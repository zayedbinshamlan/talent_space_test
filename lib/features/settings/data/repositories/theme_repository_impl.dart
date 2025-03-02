import 'package:talent_space_test/features/settings/data/datasource/theme_local_data_source.dart';
import 'package:talent_space_test/features/settings/domin/repositories/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource localDataSource;
  ThemeRepositoryImpl({required this.localDataSource});

  @override
  Future<void> saveTheme(bool isDarkMode) async {
    await localDataSource.saveTheme(isDarkMode);
  }

  @override
  Future<bool> getTheme() async {
    return await localDataSource.getTheme();
  }
}
