import 'package:flutter/material.dart';
import 'package:talent_space_test/features/auth/data/datasource/firebase_auth_data_source.dart';
import 'package:talent_space_test/features/settings/presentation/widgets/edit_profile_button.dart';

class UserProfileSection extends StatelessWidget {
  final TextEditingController nameController;
  final Function loadUserData;

  const UserProfileSection(
      {super.key, required this.nameController, required this.loadUserData});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String>>(
      future: FirebaseAuthDataSource().getUserDataFromLocal(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final userData = snapshot.data!;
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Row(
              children: [
                const Icon(Icons.person, color: Colors.black),
                const SizedBox(width: 8.0),
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${userData['name']}',
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      Text('${userData['email']}'),
                    ],
                  ),
                ),
                EditProfileButton(
                  nameController: nameController,
                  userData: userData,
                  loadUserData: loadUserData,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
