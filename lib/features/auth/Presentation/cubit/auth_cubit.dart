import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_space_test/core/helpers/constants.dart';
import 'package:talent_space_test/core/helpers/local_storage.dart';
import 'package:talent_space_test/features/auth/Presentation/cubit/auth_state.dart';
import 'package:talent_space_test/features/auth/domin/usecases/send_verification_email_use_case.dart';
import 'package:talent_space_test/features/auth/domin/usecases/sign_in_use_case.dart';
import 'package:talent_space_test/features/auth/domin/usecases/sign_in_with_google_use_case.dart';
import 'package:talent_space_test/features/auth/domin/usecases/sign_up_use_case.dart';
import 'package:talent_space_test/main.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final SignInWithGoogleUseCase signInWithGoogleUseCase;
  final SendVerificationEmailUseCase sendVerificationEmailUseCase;

  AuthCubit({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.signInWithGoogleUseCase,
    required this.sendVerificationEmailUseCase,
  }) : super(AuthInitial());

  Future<void> signInWithEmailPassword(String email, String password) async {
    try {
      emit(AuthLoading());
      User user = await signInUseCase.execute(email, password);
      await saveUserToken(user.uid);
      emit(AuthLoaded(user: user));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> signUpWithEmailPassword(
      String name, String email, String password) async {
    try {
      emit(AuthLoading());
      User user = await signUpUseCase.execute(name, email, password);
      await saveUserToken(user.uid);
      emit(AuthLoaded(user: user));
      await sendVerificationEmailUseCase.execute();
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      emit(AuthLoading());
      final user = await signInWithGoogleUseCase.execute();
      await saveUserToken(user.uid);
      emit(AuthLoaded(user: user));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      await signInUseCase.authRepository.signOut();
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> saveUserToken(String token) async {
    userToken = token;
    isLoggedInUser = true;
    await SharedPrefHelper.setData(SharedPrefKeys.userToken, token);
  }
}
