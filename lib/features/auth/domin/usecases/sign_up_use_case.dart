import 'package:firebase_auth/firebase_auth.dart';
import 'package:talent_space_test/features/auth/domin/repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository authRepository;

  SignUpUseCase({required this.authRepository});

  Future<User> execute(String name, String email, String password) async {
    return await authRepository.signUp(name, email, password);
  }
}
