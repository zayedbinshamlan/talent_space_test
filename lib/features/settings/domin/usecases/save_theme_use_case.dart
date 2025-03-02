import 'package:talent_space_test/features/settings/domin/repositories/theme_repository.dart';

class SaveThemeUseCase {
  final ThemeRepository repository;
  SaveThemeUseCase({required this.repository});

  Future<void> call(bool isDarkMode) async {
    await repository.saveTheme(isDarkMode);
  }
}