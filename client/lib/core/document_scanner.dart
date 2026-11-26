import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Native VisionKit document scanner service (docs/APPLE-INTEGRATIONS-PLAN.md §6.4).
/// Presents `VNDocumentCameraViewController` on iOS/iPadOS and returns the combined PDF bytes.
class ScannedDocument {
  const ScannedDocument({
    required this.name,
    required this.path,
    required this.bytes,
    required this.pages,
  });

  final String name;
  final String path;
  final Uint8List bytes;
  final int pages;
}

class DocumentScannerService {
  DocumentScannerService({MethodChannel? channel})
    : _channel = channel ?? const MethodChannel('casama/document_scanner');

  final MethodChannel _channel;

  bool get isPlatformSupported =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

  Future<bool> isSupported() async {
    if (!isPlatformSupported) return false;
    try {
      return await _channel.invokeMethod<bool>('isSupported') ?? false;
    } catch (_) {
      return false;
    }
  }

  Future<ScannedDocument?> scan() async {
    if (!isPlatformSupported) return null;
    final raw = await _channel.invokeMapMethod<String, dynamic>('scan');
    if (raw == null) return null;
    final path = raw['path'] as String?;
    final name = (raw['name'] as String?) ?? 'scan.pdf';
    final pages = (raw['pages'] as int?) ?? 1;
    if (path == null || path.isEmpty) return null;
    final file = File(path);
    if (!await file.exists()) return null;
    final bytes = await file.readAsBytes();
    return ScannedDocument(name: name, path: path, bytes: bytes, pages: pages);
  }
}

final documentScannerProvider = Provider<DocumentScannerService>(
  (ref) => DocumentScannerService(),
);
