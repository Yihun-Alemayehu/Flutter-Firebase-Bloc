import 'package:firebase_auth/firebase_auth.dart';

import 'models/my_user.dart';

abstract class UserRepository {

  Stream<User?> get user;

  Future<void> signIn(String email, String password);

  Future<void> logOut();

  Future<MyUser> signUp(MyUser myUser, String password);

  Future<void> resetPassword(String email);

  //Set User Data
  Future<void> setUserData(MyUser myUserId);

  //get MyUser
  Future<MyUser> getMyUser(String myUserId);
}
