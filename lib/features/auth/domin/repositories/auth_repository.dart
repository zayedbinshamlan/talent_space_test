abstract class AuthRepository {
  Future signUp(String name, String email, String password);
  Future signIn(String email, String password);
  Future signInWithGoogle();
  Future<void> sendVerificationEmail();
  Future updateUserProfile(String name , String uId);
  Future<void> signOut();
}
