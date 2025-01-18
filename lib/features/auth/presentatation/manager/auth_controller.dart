import 'dart:io';
import 'dart:typed_data';
import 'package:clinics_app/features/admin/presentation/screen/admin_home_screen.dart';
import 'package:clinics_app/features/auth/domain/usecases/get_user_usecase.dart';
import 'package:clinics_app/features/user/presentation/manager/user_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/custom_snakebar.dart';
import '../../../../core/utils/injections.dart';
import '../../../../core/utils/use_cases.dart';
import '../../domain/entities/user_mode.dart';
import '../../domain/usecases/forgot_password_use_case.dart';
import '../../domain/usecases/login_use_case.dart';
import '../../domain/usecases/register_use_case.dart';
import '../../domain/usecases/update_user_picture_usecase.dart';

class AuthController extends GetxController {

  final RegisterUserUseCase registerUserUseCase;
  final LoginUseCase loginUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final GetUserUseCase getUserUseCase;
  final UpdateUserPictureUseCase updateUserPictureUseCase;

  AuthController({
    required this.registerUserUseCase,
    required this.loginUseCase,
    required this.forgotPasswordUseCase,
    required this.getUserUseCase,
    required this.updateUserPictureUseCase,
});





  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();



  TextEditingController signUpNameController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpConfirmPasswordController = TextEditingController();
  TextEditingController mobileNumberPassword = TextEditingController();


  TextEditingController  signInEmailController= TextEditingController();
  TextEditingController signInPasswordController= TextEditingController();

  TextEditingController forgotPasswordEmailController= TextEditingController();



  void clearController() {
    signUpNameController.text.trim();
    signUpEmailController.text.trim();
    signInEmailController.text.trim();
    signInPasswordController.text.trim();
    signUpConfirmPasswordController.text.trim();
    mobileNumberPassword.text.trim();
    signInEmailController.text.trim();
    signInPasswordController.text.trim();
    forgotPasswordEmailController.text.trim();
  }


  String? validator(String? text) {
    if (text == null || text.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  String? validateEmailField(String? text) {
    String pattern =
        r"^[a-zA-Z0-9_.]+@(gmail|yahoo|outlook|apple|hotmail|mailbox|aim).com$";
    RegExp regex = RegExp(pattern);

    if (text!.isEmpty) {
      return "Email is empty";
    } else if (!regex.hasMatch(text)) {
      return 'Enter a Valid Email Address ';
    }
    return null;
  }



  Future<void> signUpSubmit(BuildContext context) async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    } else {
      EasyLoading.show();
      UserModel userModel = UserModel(
          uid:"",
          role:"admin",
          name: signUpNameController.text.trim(),
          email: signUpEmailController.text.trim(),
          password: signUpPasswordController.text.trim(),
          confirmPassword:signUpConfirmPasswordController.text.trim(),
          mobileNumber: mobileNumberPassword.text.trim(),
          imgUrl:"",

      );
      if (signUpFormKey.currentState!.validate()) {
        var results = await registerUserUseCase(Params(userModel));
        results.fold((e) {
          CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
          print('the error in signup Submit is //////${e.message}');
          EasyLoading.dismiss();
        }, (b) async {
          CustomSnakeBars.snakeBanner(
              context, 'Hello', 'New Admin has been created', 'success');
          await FirebaseAuth.instance.signOut();

          String email = GetStorage().read("email")??"";
          String pass = GetStorage().read("pass")??"";
          print('emiallllllllllllllllllllllll : $email');
          print('paswordddddddddddddddd : $pass');
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
          EasyLoading.dismiss();
          getCurrentUser();
          clearController();
          EasyLoading.dismiss();
        });
      }
    }
  }

  Future<void> signInSubmit(BuildContext context) async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    } else {
      EasyLoading.show();
      GetStorage().write("email", signInEmailController.text);
      GetStorage().write("pass", signInPasswordController.text);
      UserModel userModel = UserModel(
        email: signInEmailController.text.trim(),
        password: signInPasswordController.text.trim(),
      );
      if (signInFormKey.currentState!.validate()) {
        var results = await loginUseCase(Params(userModel));
        results.fold((e) {
          CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
          print('the error in signiIN Submit is //////${e.message}');
          EasyLoading.dismiss();
        }, (b) async {
          Get.offAll(const AdminHomeScreen());
          clearController();
          EasyLoading.dismiss();
          // await getCurrentUser();
          await sl<UserController>().loadUserData();
          // await sl<AdminController>().loadAdminData();
          // await sl<ClientController>().loadClientData();
          // await sl<DeliveryController>().loadDeliveryData();
        });
      }
    }
  }



  Future<void> forgotPasswordSubmit(BuildContext context) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    } else {
      EasyLoading.show();
      UserModel userModel = UserModel(
        email: forgotPasswordEmailController.text.trim(),
      );
      print('name = ${userModel.email}');
      if (forgotPasswordFormKey.currentState!.validate()) {
        var results = await forgotPasswordUseCase(Params(userModel));
        results.fold((e) {
          CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
          print('the error in Forgot Password  Submit is //////${e.message}');
          EasyLoading.dismiss();
        }, (b) {
          CustomSnakeBars.snakeBanner(
              context, 'Hello', 'Mail Has been sent', 'success');
          clearController();
          EasyLoading.dismiss();
        });
      }
    }
  }




  RxBool isResultLoaded = false.obs;

  UserModel? currUser;
  Future<UserModel?> getCurrentUser() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    String uid = FirebaseAuth.instance.currentUser!.uid;
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    } else {
      var results = await getUserUseCase(Params(uid));
      results.fold((e) {
      }, (b) {
        currUser= b;
        isResultLoaded.value = true;
        isResultLoaded.value = false;
        // if(currUser != null){
        //   if(currUser!.role == "admin"){
        //     Get.offAll(const AdminHomeScreen());
        //   }
        //   else if(currUser!.role == 'client'){
        //     Get.offAll( ClientHomeScreen());
        //   }
        //   else{
        //     Get.offAll( const DeliveryHomeScreen());
        //   }
        // }
        // else{
        //   print("model is null");
        // }
      });
    }
    return currUser;
  }

  String profileImgUrl = '';

  Future<void> getUserPicture(BuildContext context, ImageSource source) async {
    EasyLoading.show();
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
     Uint8List? fileTt = await file!.readAsBytes();
    print('Image File is ${file?.path}');
    if (file == null) return;
    Reference reference = FirebaseStorage.instance.ref()
        .child('ProfileImages')
        .child(currUser!.name!);
    try {
      Reference upload = reference;
      await upload.putBlob(fileTt);
      profileImgUrl = await upload.getDownloadURL();
      EasyLoading.dismiss();
      CustomSnakeBars.snakeBanner(
          context, 'Hello', 'Picture has been Uploaded', 'success');
      print('Image Url is $profileImgUrl');
      updateUserProfilePicture(context);
      Navigator.of(context).pop();
      EasyLoading.dismiss();
    }
    catch (e) {
      print('error is $e');
      EasyLoading.dismiss();
    }
    EasyLoading.dismiss();
  }

  Future<void> updateUserProfilePicture(BuildContext context) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    } else {
      EasyLoading.show();
      UserModel model = UserModel(
          imgUrl: profileImgUrl.isEmpty ? currUser!.imgUrl! : profileImgUrl
      );
      var results = await updateUserPictureUseCase(Params(model));
      results.fold((e) {
        CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
        print('the error in getUserProfilePicture is //////${e.message}');

        EasyLoading.dismiss();
      }, (b) {
        CustomSnakeBars.snakeBanner(
            context, 'Hello', 'Picture Has been updated', 'success');
        getCurrentUser();
        EasyLoading.dismiss();
      });
    }
  }



}