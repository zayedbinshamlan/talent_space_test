import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talent_space_test/core/helpers/spacing.dart';
import 'package:talent_space_test/features/auth/data/datasource/firebase_auth_data_source.dart';
import 'package:talent_space_test/features/settings/presentation/widgets/theme_switch_row.dart';
import 'package:talent_space_test/features/settings/presentation/widgets/user_profile_section.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    final userData = await FirebaseAuthDataSource().getUserDataFromLocal();
    _nameController.text = userData['name'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("إعدادات"), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserProfileSection(
                    nameController: _nameController,
                    loadUserData: _loadUserData),
                verticalSpace(32),
                ThemeSwitchRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
