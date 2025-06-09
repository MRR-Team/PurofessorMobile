class AuthException implements Exception {
  final String message;

  AuthException([this.message = 'Błąd autoryzacji.']);

  @override
  String toString() => 'AuthException: $message';
}
