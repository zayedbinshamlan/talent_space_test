// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_space_test/core/helpers/local_storage.dart';
import 'package:talent_space_test/features/auth/Presentation/cubit/auth_cubit.dart';

class EditProfileButton extends StatelessWidget {
  final TextEditingController nameController;
  final Map<String, String> userData;
  final Function loadUserData;

  const EditProfileButton({
    super.key,
    required this.nameController,
    required this.userData,
    required this.loadUserData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: AlertDialog(
                title: const Text("تعديل الاسم"),
                content: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'الاسم'),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('إلغاء'),
                  ),
                  TextButton(
                    onPressed: () async {
                      context.read<AuthCubit>().updateUserProfile(
                          nameController.text, userData['uid'].toString());
                      await SharedPrefHelper.setData(
                          'name', nameController.text);
                      loadUserData();
                      Navigator.pop(context);
                    },
                    child: const Text('تحديث'),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const Icon(Icons.edit),
    );
  }
}
