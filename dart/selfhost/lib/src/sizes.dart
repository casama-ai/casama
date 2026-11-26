/// What a release downloads and how much disk it takes (the manifest's optional `download` field,
/// written by scripts/release-selfhost.sh with scripts/selfhost-image-sizes.mjs).
library;

/// One image an install may pull, for one CPU type.
class SizedImage {
  const SizedImage({required this.name, required this.ref, required this.layers, this.profile});

  /// `server`, `computer-headless`, `db`, …
  final String name;

  /// The reference compose pulls: `ghcr.io/casama-ai/…@sha256:…` or `caddy:2.10.2-alpine`.
  final String ref;

  /// The compose profile that pulls it (`desktop`, `link`, `backup`, `search`, …), or null when
  /// every install pulls it.
  final String? profile;

  /// Its layer digests.
  final List<String> layers;

  Map<String, dynamic> toJson() => {'name': name, 'ref': ref, 'profile': profile, 'layers': layers};
}

/// How much an install has to download, and the disk it needs for the images.
class DownloadEstimate {
  const DownloadEstimate({required this.downloadBytes, required this.diskBytes});

  /// Compressed layers still to fetch.
  final int downloadBytes;

  /// Disk the new images take: the unpacked layers plus the compressed copies Docker keeps (Docker
  /// Desktop's image store keeps both; plain Docker Engine needs the room while it unpacks).
  final int diskBytes;

  double get downloadGb => downloadBytes / 1e9;
  double get diskGb => diskBytes / 1e9;
}

/// The release's image sizes per CPU type.
class ImageSizes {
  const ImageSizes({required this.layers, required this.images});

  /// Layer digest → (compressed bytes, unpacked bytes).
  final Map<String, (int, int)> layers;

  /// CPU type (`amd64`, `arm64`) → the images an install may pull.
  final Map<String, List<SizedImage>> images;

  /// Reads the manifest's `download` field. Anything malformed gives null: sizes are a nicety and
  /// never stop an install.
  static ImageSizes? tryParse(Object? j) {
    try {
      if (j is! Map) return null;
      final rawLayers = j['layers'];
      final rawImages = j['images'];
      if (rawLayers is! Map || rawImages is! Map) return null;
      final layers = <String, (int, int)>{};
      for (final e in rawLayers.entries) {
        final v = e.value as List;
        layers[e.key as String] = ((v[0] as num).toInt(), (v[1] as num).toInt());
      }
      final images = <String, List<SizedImage>>{};
      for (final e in rawImages.entries) {
        images[e.key as String] = [
          for (final i in e.value as List)
            SizedImage(
              name: (i as Map)['name'] as String,
              ref: i['ref'] as String,
              profile: i['profile'] as String?,
              layers: [for (final l in i['layers'] as List) l as String],
            ),
        ];
      }
      // Every layer an image names must have a size, or the sums would be short.
      for (final list in images.values) {
        for (final i in list) {
          if (i.layers.any((l) => !layers.containsKey(l))) return null;
        }
      }
      return ImageSizes(layers: layers, images: images);
    } catch (_) {
      return null;
    }
  }

  Map<String, dynamic> toJson() => {
    'layers': {for (final e in layers.entries) e.key: [e.value.$1, e.value.$2]},
    'images': {for (final e in images.entries) e.key: [for (final i in e.value) i.toJson()]},
  };

  /// What an install on [arch] with [profiles] turned on still has to fetch, when the images in
  /// [present] (references as compose names them) are already on the machine. Each layer counts
  /// once, and layers the present images already hold don't count. Null when the release has no
  /// sizes for [arch].
  DownloadEstimate? estimate({required String arch, Set<String> profiles = const {}, Set<String> present = const {}}) {
    final list = images[arch];
    if (list == null || list.isEmpty) return null;
    final have = <String>{for (final i in list) if (present.contains(i.ref)) ...i.layers};
    final need = <String>{
      for (final i in list)
        if ((i.profile == null || profiles.contains(i.profile)) && !present.contains(i.ref)) ...i.layers,
    }..removeAll(have);
    var download = 0;
    var unpacked = 0;
    for (final l in need) {
      download += layers[l]!.$1;
      unpacked += layers[l]!.$2;
    }
    return DownloadEstimate(downloadBytes: download, diskBytes: download + unpacked);
  }
}

/// Docker's CPU type (`docker info` says `x86_64`, `aarch64`, …) as image platforms name it.
String? dockerArch(String info) => switch (info.trim().toLowerCase()) {
  'x86_64' || 'amd64' => 'amd64',
  'aarch64' || 'arm64' => 'arm64',
  _ => null,
};

/// The image references `docker image ls --digests --format '{{.Repository}}|{{.Tag}}|{{.Digest}}'`
/// lists, both as `repo:tag` and `repo@sha256:…`, so either way of pinning matches.
Set<String> presentRefs(String imageLs) {
  final out = <String>{};
  for (final line in imageLs.split('\n')) {
    final parts = line.trim().split('|');
    if (parts.length < 3 || parts[0].isEmpty || parts[0] == '<none>') continue;
    if (parts[1].isNotEmpty && parts[1] != '<none>') out.add('${parts[0]}:${parts[1]}');
    if (parts[2].startsWith('sha256:')) out.add('${parts[0]}@${parts[2]}');
  }
  return out;
}
