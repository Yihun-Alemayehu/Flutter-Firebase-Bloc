import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'models/my_user.dart';

abstract class UserRepository {
  Stream<User?> get user;

  Future<void> signIn(String email, String password);

  Future<void> logOut();

  Future<MyUser> signUp(MyUser myUser, String password, MyUser copyWith);

  Future<void> resetPassword(String email);

  //Set User Data
  Future<void> setUserData(MyUser myUserId);

  //get MyUser
  Future<MyUser> getMyUser(String myUserId);

  //Upload Picture
  Future<String> uploadPicture(String file, String userId);

  // get admin
  // AuthorizeAccess(BuildContext context){}
}
