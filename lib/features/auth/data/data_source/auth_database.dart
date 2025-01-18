import '../../domain/entities/user_mode.dart';

abstract class AuthDatabaseMain {

  Future<String> registerUser(UserModel userModel);
  Future<String> signInUser(UserModel userModel);
  Future<String> forgotPasswordOfUser(UserModel userModel);
  Future<UserModel?> getUser();
  Future<String> updateUserPicture(UserModel userModel);


}