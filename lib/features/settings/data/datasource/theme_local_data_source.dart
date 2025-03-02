import 'package:talent_space_test/core/helpers/local_storage.dart';

class ThemeLocalDataSource {
  Future<void> saveTheme(bool isDarkMode) async {
    await SharedPrefHelper.setData('isDarkMode', isDarkMode);
  }

  Future<bool> getTheme() async {
    return SharedPrefHelper.getBool('isDarkMode') ?? false;
  }
}
