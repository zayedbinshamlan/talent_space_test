import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talent_space_test/core/helpers/constants.dart';
import 'package:talent_space_test/core/helpers/extensions.dart';
import 'package:talent_space_test/core/helpers/local_storage.dart';
import 'package:talent_space_test/core/routing/app_router.dart';
import 'package:talent_space_test/core/routing/routes.dart';
import 'package:talent_space_test/core/theming/app_colors.dart';
import 'package:talent_space_test/features/auth/Presentation/cubit/auth_cubit.dart';
import 'package:talent_space_test/features/auth/data/datasource/firebase_auth_data_source.dart';
import 'package:talent_space_test/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:talent_space_test/features/auth/domin/usecases/send_verification_email_use_case.dart';
import 'package:talent_space_test/features/auth/domin/usecases/sign_in_use_case.dart';
import 'package:talent_space_test/features/auth/domin/usecases/sign_in_with_google_use_case.dart';
import 'package:talent_space_test/features/auth/domin/usecases/sign_up_use_case.dart';
import 'package:talent_space_test/firebase_options.dart';

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

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthCubit(
              signInUseCase: SignInUseCase(
                  authRepository: AuthRepositoryImpl(FirebaseAuthDataSource())),
              signUpUseCase: SignUpUseCase(
                  authRepository: AuthRepositoryImpl(FirebaseAuthDataSource())),
              signInWithGoogleUseCase: SignInWithGoogleUseCase(
                  authRepository: AuthRepositoryImpl(FirebaseAuthDataSource())),
              sendVerificationEmailUseCase: SendVerificationEmailUseCase(
                  authRepository:
                      AuthRepositoryImpl(FirebaseAuthDataSource()))),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        builder: (context, child) => MaterialApp(
          title: 'My App',
          theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: AppColors.backgroundColor),
          debugShowCheckedModeBanner: false,
          initialRoute: isLoggedInUser ? Routes.navBar : Routes.signInScreen,
          onGenerateRoute: appRouter.generateRoute,
        ),
      ),
    );
  }
}
