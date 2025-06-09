import 'package:purofessor_mobile/src/core/data/network/services/google_auth_service.dart';
import 'package:purofessor_mobile/src/shared/domain/models/user_model.dart';

class GoogleLoginUseCase {
  final GoogleAuthService googleAuthService;

  GoogleLoginUseCase(this.googleAuthService);

  Future<User> call() async {
    return await googleAuthService.signInWithGoogle();
  }
}
