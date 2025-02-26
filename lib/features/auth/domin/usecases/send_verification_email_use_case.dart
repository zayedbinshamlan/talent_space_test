import 'package:talent_space_test/features/auth/domin/repositories/auth_repository.dart';

class SendVerificationEmailUseCase {
  final AuthRepository authRepository;

  SendVerificationEmailUseCase({required this.authRepository});

  Future<void> execute() async {
    return await authRepository.sendVerificationEmail();
  }
}
