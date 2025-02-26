abstract class AuthRepository {
  Future signUp(String name, String email, String password);
  Future signIn(String email, String password);
  Future<void> sendVerificationEmail();
  Future<void> signOut();
}
