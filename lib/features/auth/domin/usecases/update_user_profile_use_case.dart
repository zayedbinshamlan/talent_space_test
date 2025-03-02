import 'package:talent_space_test/features/auth/domin/repositories/auth_repository.dart';

class UpdateUserProfileUseCase {
  final AuthRepository authRepository;

  UpdateUserProfileUseCase({required this.authRepository});

  Future execute(String name , String uId) async {
    return await authRepository.updateUserProfile(name , uId);
  }
}
