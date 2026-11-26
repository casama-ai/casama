/// A failure the installer explains to the person: [code] is stable for programs, [message] is
/// plain words for people.
class SelfhostException implements Exception {
  SelfhostException(this.code, this.message);
  final String code;
  final String message;

  @override
  String toString() => 'SelfhostException($code): $message';
}
