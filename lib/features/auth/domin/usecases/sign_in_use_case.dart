// sign_in_usecase.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:talent_space_test/features/auth/domin/repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository authRepository;

  SignInUseCase({required this.authRepository});

  Future<User> execute(String email, String password) async {
    return await authRepository.signIn(email, password);
  }
}
