import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_space_test/features/settings/domin/usecases/get_theme_use_case.dart';
import 'package:talent_space_test/features/settings/domin/usecases/save_theme_use_case.dart';

class ThemeCubit extends Cubit<bool> {
  final SaveThemeUseCase saveThemeUseCase;
  final GetThemeUseCase getThemeUseCase;

  ThemeCubit({
    required this.saveThemeUseCase,
    required this.getThemeUseCase,
  }) : super(false) {
    loadTheme();
  }

  Future<void> loadTheme() async {
    final isDarkMode = await getThemeUseCase();
    emit(isDarkMode);
  }

  Future<void> toggleTheme() async {
    final newTheme = !state;
    await saveThemeUseCase(newTheme);
    emit(newTheme);
  }
}
