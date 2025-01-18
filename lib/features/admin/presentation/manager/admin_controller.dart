import 'dart:math';
import 'package:clinics_app/features/admin/domain/use_cases/add_new_donation_usecase.dart';
import 'package:clinics_app/features/admin/domain/use_cases/add_new_quote_usecase.dart';
import 'package:clinics_app/features/admin/domain/use_cases/delete_clinic_usecase.dart';
import 'package:clinics_app/features/admin/domain/use_cases/delete_donation_usecase.dart';
import 'package:clinics_app/features/admin/domain/use_cases/delete_quote_usecase.dart';
import 'package:clinics_app/features/admin/domain/use_cases/update_clinic_usecase.dart';
import 'package:clinics_app/features/admin/presentation/manager/check_provider.dart';
import 'package:clinics_app/features/user/domain/entities/clinic_details_model.dart';
import 'package:clinics_app/features/user/domain/entities/donation_model.dart';
import 'package:clinics_app/features/user/domain/entities/quotes_model.dart';
import 'package:clinics_app/features/user/presentation/manager/user_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../../../../core/constants/custom_snakebar.dart';
import '../../../../core/utils/injections.dart';
import '../../../../core/utils/use_cases.dart';
import '../../domain/use_cases/add_new_clinic_usecase.dart';



class AdminController extends GetxController {

RxBool isImageLoading=false.obs;
  final AddNewClinicUseCase addNewClinicUseCase;
  final AddNewQuoteUseCase addNewQuoteUseCase;
  final DeleteClinicUseCase deleteClinicUseCase;
  final UpdateClinicUseCase updateClinicUseCase;
  final AddNewDonationUseCase addNewDonationUseCase;
  final DeleteQuoteUseCase deleteQuoteUseCase;
  final DeleteDonationUseCase deleteDonationUseCase;

  AdminController({
    required this.addNewClinicUseCase,
    required this.addNewQuoteUseCase,
    required this.deleteClinicUseCase,
    required this.updateClinicUseCase,
    required this.addNewDonationUseCase,
    required this.deleteQuoteUseCase,
    required this.deleteDonationUseCase,
});



  var addNewClinicFormKey = GlobalKey<FormState>();
  var addNewQuoteFormKey = GlobalKey<FormState>();
  var addNewDonationFormKey = GlobalKey<FormState>();


  TextEditingController  clinicTitleController= TextEditingController();
  TextEditingController clinicLocationController= TextEditingController();
  TextEditingController officeTimeController= TextEditingController();
  TextEditingController mobileNumberController= TextEditingController();
  TextEditingController websiteController= TextEditingController();

  ///Quote Controller
  TextEditingController quoteController= TextEditingController();
  TextEditingController authorController= TextEditingController();
  TextEditingController aboutTheAuthorController= TextEditingController();

/// Donation Controllers
TextEditingController donationTitleController= TextEditingController();
TextEditingController donationDescriptionController= TextEditingController();



  void clearController() {
    clinicTitleController.clear();
    clinicLocationController.clear();
    officeTimeController.clear();
    mobileNumberController.clear();
    quoteController.clear();
    authorController.clear();
    aboutTheAuthorController.clear();
    donationTitleController.clear();
    donationDescriptionController.clear();
    websiteController.clear();
  }



  String? validator(String? text) {
    if (text == null || text.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  Rx<String> serviceCategory = ''.obs;
  setServiceCategory(String txt){
    serviceCategory.value = txt;
    print('serviceCategory $serviceCategory');
    update();
  }



  String generateID() {
    // String userId = FirebaseAuth.instance.currentUser!.uid;
     String userId = 'QWERQASDFFGHKIOUYUIOCXCVCBCXVB';
    Random random = Random();
    String randomChars = '0123456789';
    String code = '';

    for (int i = 0; i < 6; i++) {
      code += randomChars[random.nextInt(randomChars.length)];
    }
    return userId.substring(0, 3).toUpperCase() + code;
  }


// List<Location> locations = await locationFromAddress(clinicLocationController.text.trim());


  Future<void> addNewClinic(BuildContext context, List<String> clinicImages) async {


List<Location> locations = await locationFromAddress(clinicLocationController.text.trim());

    final connectivityResult = await (Connectivity().checkConnectivity());
    CheckProvider provider = CheckProvider();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    } else {
      EasyLoading.show();
      ClinicDetailsModel clinicDetailsModel = ClinicDetailsModel(
          id: generateID(),
          // serviceCategory:serviceCategory.value,
          title: clinicTitleController.text.trim(),
          address:clinicLocationController.text.trim(),
          // officeTime:officeTimeController.text.trim(),
          mobileNumber:mobileNumberController.text.trim(),
          clinicImages: clinicImages,
          date:DateTime.now().microsecondsSinceEpoch,
          lat: 323.090,
          long: 41244.123,
          // lat: locations.last.latitude,
          // long: locations.last.longitude,
        website: websiteController.text.trim()
      );
      if (addNewClinicFormKey.currentState!.validate()) {
        var results = await addNewClinicUseCase(Params(clinicDetailsModel));
        results.fold((e) {
          CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
          print('the error in addNewClinic is //////${e.message}');

          EasyLoading.dismiss();
        }, (b) {
          CustomSnakeBars.snakeBanner(
              context, 'Hello', 'Clinic Has been added', 'success');
          clearController();
          provider.selectedIamges.clear();
          sl<UserController>().loadUserData();
          EasyLoading.dismiss();
        });
      }
    }
  }








  Future<void> addNewQuoteController(BuildContext context, String quotePhoto ) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    // String itemID = const Uri().v1();

    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    } else {
      // EasyLoading.show();
      QuotesModel quotesModel = QuotesModel(
           id: generateID(),
           quote:quoteController.text.trim(),
           author:authorController.text.trim(),
           authorDetails:aboutTheAuthorController.text.trim(),
           imgUrl: quotePhoto,
           date: DateTime.now().millisecondsSinceEpoch
      );
      if (addNewQuoteFormKey.currentState!.validate()) {
        var results = await addNewQuoteUseCase(Params(quotesModel));
        results.fold((e) {
          CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
          print('the error in addNewQuoteController is //////${e.message}');

          // EasyLoading.dismiss();
        }, (b) {
          CustomSnakeBars.snakeBanner(
              context, 'Hello', 'Quote Has been added', 'success');
          clearController();
          sl<UserController>().loadUserData();
          // EasyLoading.dismiss();
        });
      }
    }
  }



Future<void> addNewDonationController(BuildContext context, String donationPhoto) async {
  final connectivityResult = await (Connectivity().checkConnectivity());
  // String itemID = const Uri().v1();

  if (connectivityResult == ConnectivityResult.none) {
    print('check your connection');
  } else {
    // EasyLoading.show();
    DonationModel donationModel = DonationModel(
        id: generateID(),
        title:donationTitleController.text.trim(),
        description:donationDescriptionController.text.trim(),
        donationImg: donationPhoto,
        date: DateTime.now().millisecondsSinceEpoch
    );
    if (addNewDonationFormKey.currentState!.validate()) {
      var results = await addNewDonationUseCase(Params(donationModel));
      results.fold((e) {
        CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
        print('the error in addNewDonationController is //////${e.message}');

        // EasyLoading.dismiss();
      }, (b) {
        CustomSnakeBars.snakeBanner(
            context, 'Hello', 'Donation Has been added', 'success');
        clearController();
        sl<UserController>().loadUserData();
        // EasyLoading.dismiss();
      });
    }
  }
}




  Future<void> deleteClinicController(BuildContext context, ClinicDetailsModel clinicDetailsModel) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      EasyLoading.show();
      var results = await deleteClinicUseCase(Params(clinicDetailsModel));
      results.fold((e) {
        // CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
        print('the error in deleteClinicController is //////${e.message}');
        EasyLoading.dismiss();
      }, (b) {
        CustomSnakeBars.snakeBanner(
            context, 'Hello', 'Item Has been deleted', 'success');
        sl<UserController>().loadUserData();
        EasyLoading.dismiss();
      });
    }
  }


  void oldData(ClinicDetailsModel clinicDetailsModel) {
    clinicTitleController.text = clinicDetailsModel.title!;
    clinicLocationController.text = clinicDetailsModel.address!;
    // officeTimeController.text = clinicDetailsModel.officeTime!;
    mobileNumberController.text = clinicDetailsModel.mobileNumber!;
    // serviceCategory.value = clinicDetailsModel.serviceCategory!;
  }



Future<void> updateClinicController(BuildContext context, ClinicDetailsModel model,List<String> clinicImages) async {

  final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    } else {
      EasyLoading.show();
      ClinicDetailsModel itemModel = ClinicDetailsModel(
          id: model.id,
          title: clinicTitleController.text.trim(),
          address: clinicLocationController.text.trim(),
          // officeTime: officeTimeController.text.trim(),
          mobileNumber: mobileNumberController.text.trim(),
          clinicImages: clinicImages.isEmpty ? model.clinicImages! : clinicImages,
          date: model.date,
        // serviceCategory:serviceCategory.isEmpty ? model.serviceCategory : serviceCategory.value,


      );
      if (addNewClinicFormKey.currentState!.validate()) {
        var results = await updateClinicUseCase(Params(itemModel));
        results.fold((e) {
          CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
          print('the error in updateClinicController is //////${e.message}');

          EasyLoading.dismiss();
        }, (b) {
          CustomSnakeBars.snakeBanner(
              context, 'Hello', 'Item Has been updated', 'success');
          clearController();
          sl<UserController>().loadUserData();
          EasyLoading.dismiss();
        });
      }
    }
  }


Future<void> deleteQuoteController(BuildContext context,  QuotesModel quoteModel) async {
  final connectivityResult = await (Connectivity().checkConnectivity());
  EasyLoading.show();
  if (connectivityResult == ConnectivityResult.none) {
    print('check your connection');
  }
  else {
    var results = await deleteQuoteUseCase(Params(quoteModel));
    results.fold((e) {
      // CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
      print('the error in deleteQuoteController is //////${e.message}');
      EasyLoading.dismiss();
    }, (b) {
      CustomSnakeBars.snakeBanner(
          context, 'Hello', 'Quote Has been deleted', 'success');
      sl<UserController>().loadUserData();
      EasyLoading.dismiss();
    });
  }
}

Future<void> deleteDonationController(BuildContext context,DonationModel donationModel) async {
  final connectivityResult = await (Connectivity().checkConnectivity());
  EasyLoading.show();
  if (connectivityResult == ConnectivityResult.none) {
    print('check your connection');
  }
  else {
    var results = await deleteDonationUseCase(Params(donationModel));
    results.fold((e) {
      // CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
      print('the error in deleteDonationController is //////${e.message}');
      EasyLoading.dismiss();
    }, (b) {
      CustomSnakeBars.snakeBanner(
          context, 'Hello', 'Donation Has been deleted', 'success');
      sl<UserController>().loadUserData();
      EasyLoading.dismiss();
    });
  }
}



Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {

    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}




}