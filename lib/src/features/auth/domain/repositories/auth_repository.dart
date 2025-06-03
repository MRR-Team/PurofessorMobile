abstract class AuthRepository {
  Future<void> login(String email, String password);
  Future<Map<String, dynamic>?> getCurrentUser();
  Future<void> register(
    String email,
    String name,
    String password,
    String confirmPassword,
  );
}
