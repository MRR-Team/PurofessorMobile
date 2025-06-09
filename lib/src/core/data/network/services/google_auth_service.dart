import 'dart:io';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:purofessor_mobile/src/core/data/network/http_client.dart';
import 'package:purofessor_mobile/src/core/exceptions/http_exception.dart';
import 'package:purofessor_mobile/src/core/exceptions/no_internet_exception.dart';
import 'package:purofessor_mobile/src/shared/domain/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleAuthService {
  final HttpClient httpClient;

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

  GoogleAuthService(this.httpClient);

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        throw Exception('Logowanie Google anulowane przez użytkownika');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final String? idToken = googleAuth.idToken;

      if (idToken == null) {
        throw Exception(
          'Nie udało się uzyskać idToken od Google. Spróbuj ponownie.',
        );
      }

      final response = await httpClient.get('/api/auth/callback/google');

      final userJson = response['user'];
      final token = response['token'];

      await _saveToken(token);

      return User.fromJson(userJson);
    } on SocketException {
      throw NoInternetException();
    } on HttpException catch (e) {
      throw HttpException(message: e.message, statusCode: e.statusCode);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}
