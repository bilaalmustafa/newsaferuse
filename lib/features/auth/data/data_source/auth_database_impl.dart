import 'package:clinics_app/features/auth/data/data_source/auth_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_mode.dart';

class AuthDatabaseImpl implements AuthDatabaseMain {



  final _db = FirebaseFirestore.instance;

  @override
  Future<String> registerUser(UserModel userModel) async {
    String message = '';
    try{
      print(userModel.email);
      print(userModel.password);
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential user = await auth.createUserWithEmailAndPassword(email: userModel.email!, password: userModel.password!);
      print('jsdlfasfjlksajflkjsklfhlkashfklsdfksafhkshfkslfklakslfkhsfdh ${user!=null}');

      User? currentUser = FirebaseAuth.instance.currentUser;
      UserModel newUser= userModel.copyWith(uid: currentUser!.uid);
      if(user.user!=null){
        await _db.collection('users').doc(currentUser.uid).set(newUser.toMap());
        print('account has been created');
        message = 'Success';
      }
    }
    on FirebaseAuthException catch(e){
      if(e.code=='email-already-in-use'){
        message = 'Email Already in use';
        print('Email Already in use $e');
      }
      else if(e.code=='weak-password'){
        print('Weak Password $e');
        message = 'Weak Password';
      }
    }
    catch(e){
      print('///////The exception in register user database impl is ////// $e');
      message  = '///////The exception in register user database impl is ////// $e';
    }
    return message;
  }




  ///SignIn Function
  @override
  Future<String> signInUser(UserModel userModel) async  {

    String message = '';

    try{
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential user = await auth.signInWithEmailAndPassword(email: userModel.email!, password: userModel.password!);
      if(user.user!=null){
        print('account has been login');
        message = 'Success';
      }
    }
    on FirebaseAuthException catch(e){
      print("FirebaseAuthException : ${e.code}");
      if(e.code == 'user-not-found') {
        message = 'user-not-found';
      }
      else if(e.code=='wrong-password'){
        message= 'wrong-password';

      }
      else if(e.code=='invalid-credential'){
        message= 'Invalid Credential';
      }

    }
    catch(e){
      print('The Exception in signInUser is $e');
      message = 'Error $e';
    }
    return message;
  }




  @override
  Future<String> forgotPasswordOfUser(UserModel userModel) async {
    String message = '';

    try{
      FirebaseAuth.instance.sendPasswordResetEmail(email: userModel.email!);
      message = 'Success';
    }
    catch(e){
      message = 'Error $e';
    }
    return message;

  }


  @override
  Future<UserModel?> getUser()async {

    print("getUser");
    String uid =FirebaseAuth.instance.currentUser!.uid;
    try{
      print("try");
      final snapshot = await _db.collection('users').doc(uid).get();
      print("snapshot : ${snapshot.id}");
      print("snapshot : ${snapshot.data().toString()}");
      UserModel mdl = UserModel.fromMap(snapshot.data()!);
      print("mdl : ${mdl.uid}");
      return mdl;
    }

    catch(e){
      print('The Error in get User is @@@@@@@ $e');
    }
    print("aFTER");
    return null;

  }



  @override
  Future<String> updateUserPicture(UserModel model) async {
    String message = '';

    String uid = FirebaseAuth.instance.currentUser!.uid;

    try{
      await _db.collection('users').doc(uid).update({
        "imgUrl":model.imgUrl
      });
      message = 'Success';

    }
    catch(e){
      print('the error in updateItem in updateUserPricture  //////!!!!! is $e');
      message = 'the error in insertNewItem in updateUserPricture $e';
    }

    return message;
  }



}