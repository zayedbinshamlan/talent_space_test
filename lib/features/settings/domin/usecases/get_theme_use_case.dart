import 'package:talent_space_test/features/settings/domin/repositories/theme_repository.dart';

class GetThemeUseCase {
  final ThemeRepository repository;
  GetThemeUseCase({required this.repository});

  Future<bool> call() async {
    return await repository.getTheme();
  }
}