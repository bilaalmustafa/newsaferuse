import 'package:clinics_app/features/user/lacewatch/core/config/di.dart';
import 'package:clinics_app/features/user/lacewatch/core/services/auth_services.dart';
import 'package:clinics_app/features/user/lacewatch/core/services/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:clinics_app/features/user/lacewatch/model/user.dart' as u;

class AuthViewmodel extends ChangeNotifier {
  AuthViewmodel();

  bool isLoading = false;

  Future<User?> signIn(String email, String pass) async {
    isLoading = true;
    notifyListeners();
    User? user =
        await instance<AuthService>().signInWithEmailAndPassword(email, pass);
    isLoading = false;
    notifyListeners();
    return user;
  }

  Future<User?> signUp(String email, String pass, u.User userData) async {
    isLoading = true;
    notifyListeners();
    User? user =
        await instance<AuthService>().signUpWithEmailAndPassword(email, pass);
    if (user != null) {
      await user.updateDisplayName(userData.username);
      await instance<UserService>().createUser(user.uid, userData);
    }
    isLoading = false;
    notifyListeners();
    return user;
  }

  signOut() {
    instance<AuthService>().signOut();
  }

  Future<String?> resetPassword(String email) async {
    isLoading = true;
    notifyListeners();
    String? message =
        await instance<AuthService>().sendPasswordResetEmail(email);
    isLoading = false;
    notifyListeners();
    return message;
  }
}
