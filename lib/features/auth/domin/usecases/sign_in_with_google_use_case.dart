import 'package:firebase_auth/firebase_auth.dart';
import 'package:talent_space_test/features/auth/domin/repositories/auth_repository.dart';

class SignInWithGoogleUseCase {
  final AuthRepository authRepository;

  SignInWithGoogleUseCase({required this.authRepository});

  Future<User> execute() async {
    return await authRepository.signInWithGoogle();
  }
}
