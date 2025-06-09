abstract class AuthRepository {
  Future<void> login(String email, String password);
  Future<void> register(
    String email,
    String name,
    String password,
    String confirmPassword,
  );
  Future<void> logout();
  Future<void> forgotPassword(String email);
}
