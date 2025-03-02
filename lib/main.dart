import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:talent_space_test/core/helpers/constants.dart';
import 'package:talent_space_test/core/helpers/extensions.dart';
import 'package:talent_space_test/core/helpers/local_storage.dart';
import 'package:talent_space_test/core/routing/app_router.dart';
import 'package:talent_space_test/firebase_options.dart';
import 'package:talent_space_test/my_app.dart';

String? userToken;
bool isLoggedInUser = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await checkIfLoggedInUser();
  runApp(MyApp(appRouter: AppRouter()));
}

checkIfLoggedInUser() async {
  String userToken = await SharedPrefHelper.getString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
