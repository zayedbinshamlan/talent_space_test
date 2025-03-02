import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talent_space_test/core/routing/app_router.dart';
import 'package:talent_space_test/core/routing/routes.dart';
import 'package:talent_space_test/features/auth/Presentation/cubit/auth_cubit.dart';
import 'package:talent_space_test/features/auth/data/datasource/firebase_auth_data_source.dart';
import 'package:talent_space_test/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:talent_space_test/features/auth/domin/usecases/send_verification_email_use_case.dart';
import 'package:talent_space_test/features/auth/domin/usecases/sign_in_use_case.dart';
import 'package:talent_space_test/features/auth/domin/usecases/sign_in_with_google_use_case.dart';
import 'package:talent_space_test/features/auth/domin/usecases/sign_up_use_case.dart';
import 'package:talent_space_test/features/auth/domin/usecases/update_user_profile_use_case.dart';
import 'package:talent_space_test/features/settings/data/datasource/theme_local_data_source.dart';
import 'package:talent_space_test/features/settings/data/repositories/theme_repository_impl.dart';
import 'package:talent_space_test/features/settings/domin/usecases/get_theme_use_case.dart';
import 'package:talent_space_test/features/settings/domin/usecases/save_theme_use_case.dart';
import 'package:talent_space_test/features/settings/presentation/cubit/theme_cubit.dart';
import 'package:talent_space_test/main.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MultiBlocProvider(
      providers: [
        _authCubitProvider(),
      ],
      child: BlocProvider(
        create: (context) => _themeCubit(),
        child: BlocBuilder<ThemeCubit, bool>(
          builder: (context, isDarkMode) {
            return _buildMaterialApp(context, isDarkMode);
          },
        ),
      ),
    );
  }

  BlocProvider<AuthCubit> _authCubitProvider() {
    return BlocProvider(
      create: (_) => AuthCubit(
        signInUseCase: _signInUseCase(),
        signUpUseCase: _signUpUseCase(),
        signInWithGoogleUseCase: _signInWithGoogleUseCase(),
        sendVerificationEmailUseCase: _sendVerificationEmailUseCase(),
        updateUserProfileUseCase: _updateUserProfileUseCase(),
      ),
    );
  }

  SignInUseCase _signInUseCase() {
    return SignInUseCase(authRepository: _authRepository());
  }

  SignUpUseCase _signUpUseCase() {
    return SignUpUseCase(authRepository: _authRepository());
  }

  SignInWithGoogleUseCase _signInWithGoogleUseCase() {
    return SignInWithGoogleUseCase(authRepository: _authRepository());
  }

  SendVerificationEmailUseCase _sendVerificationEmailUseCase() {
    return SendVerificationEmailUseCase(authRepository: _authRepository());
  }

  UpdateUserProfileUseCase _updateUserProfileUseCase() {
    return UpdateUserProfileUseCase(authRepository: _authRepository());
  }

  AuthRepositoryImpl _authRepository() {
    return AuthRepositoryImpl(FirebaseAuthDataSource());
  }

  ThemeCubit _themeCubit() {
    return ThemeCubit(
      saveThemeUseCase: SaveThemeUseCase(repository: _themeRepository()),
      getThemeUseCase: GetThemeUseCase(repository: _themeRepository()),
    );
  }

  ThemeRepositoryImpl _themeRepository() {
    return ThemeRepositoryImpl(localDataSource: ThemeLocalDataSource());
  }

  Widget _buildMaterialApp(BuildContext context, bool isDarkMode) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        title: 'My App',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        initialRoute: isLoggedInUser ? Routes.navBar : Routes.signInScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
