import 'dart:math';
import 'package:clinics_app/features/user/domain/entities/donation_model.dart';
import 'package:clinics_app/features/user/domain/entities/quotes_model.dart';
import 'package:clinics_app/features/user/domain/use_cases/get_all_clinic_data_usecase.dart';
import 'package:clinics_app/features/user/domain/use_cases/get_all_clinic_syringes_category_usecase.dart';
import 'package:clinics_app/features/user/domain/use_cases/get_client_safer_smoking_category_usecase.dart';
import 'package:clinics_app/features/user/domain/use_cases/get_single_donation_usecase.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_map_math/flutter_geo_math.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/utils/use_cases.dart';
import '../../domain/entities/clinic_details_model.dart';
import '../../domain/entities/clinic_distance_model.dart';
import '../../domain/use_cases/get_all_clinic_blood_test_category_usecase.dart';
import '../../domain/use_cases/get_all_clinic_cbr_ category_usecase.dart';
import '../../domain/use_cases/get_all_clinic_hiv_test_category_usecase.dart';
import '../../domain/use_cases/get_all_clinic_medical_care_usecase.dart';
import '../../domain/use_cases/get_all_quotes_usecase.dart';
import '../../domain/use_cases/get_donation_usecase.dart';
import '../../domain/use_cases/get_signle_quote_usecase.dart';

import 'package:location/location.dart';


class UserController extends GetxController{

  final GetAllClinicDataUseCase getAllClinicDataUseCase;
  final GetAllClinicSyringesCategoryUseCase getAllClinicSyringesCategoryUseCase;
  final GetClientSaferSmokingCategoryUseCase getClientSaferSmokingCategoryUseCase;
  final GetAllClinicMedicalCareUseCase getAllClinicMedicalCareUseCase;
  final GetAllClinicCbrCategoryUseCase getAllClinicCbrCategoryUseCase;
  final GetAllClinicBloodTestCategoryUseCase getAllClinicBloodTestCategoryUseCase;
  final GetAllClinicHivTestCategoryUseCase getAllClinicHivTestCategoryUseCase;
  final GetAllQuotesUseCase getAllQuotesUseCase;
  final GetDonationUseCase getDonationUseCase;
  final GetSingleQuoteUseCase getSingleQuoteUseCase;
  final GetSingleDonationUseCase getSingleDonationUseCase;


  UserController({
    required this.getAllClinicDataUseCase,
    required this.getAllClinicSyringesCategoryUseCase,
    required this.getClientSaferSmokingCategoryUseCase,
    required this.getAllClinicMedicalCareUseCase,
    required this.getAllClinicCbrCategoryUseCase,
    required this.getAllClinicBloodTestCategoryUseCase,
    required this.getAllClinicHivTestCategoryUseCase,
    required this.getAllQuotesUseCase,
    required this.getDonationUseCase,
    required this.getSingleQuoteUseCase,
    required this.getSingleDonationUseCase,
});



  RxBool isAllFunctionLoading = false.obs;
  Future<void> loadUserData() async {
    await userGetAllClinicData();
    await userGetAllClinicSyringesCategory();
    await userGetAllClinicSaferSmokingKitsCategory();
    await userGetAllClinicMedicalCaresCategory();
    await userGetAllClinicCBRCategory();
    await userGetAllClinicBloodTestCategory();
    await userGetAllQuotes();
    await userGetDonation();
    // await getSingleDonationController();
    isAllFunctionLoading.value = true;
    isAllFunctionLoading.value = false;

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



  RxList<int> categoryIndex=<int>[].obs;
  setCategoryIndex(int val){

    if(val==0){
      categoryIndex.clear();
      categoryIndex.add(val);
    }else{
      if(categoryIndex.contains(0)){

        categoryIndex.remove(0);
      }
      if(categoryIndex.contains(val)){
        categoryIndex.remove(val);
      }else{
        categoryIndex.add(val);
      }


    }
    getSortedData();

    update();
  }

  getSortedData(){
    getSortedClinicData.clear();


    print(getClinicData.length);
    for(var mdl in getClinicData){
      print(categoryIndex.contains(1));
      print(mdl.serviceCategory!.contains('Syringes'));
      if(categoryIndex.contains(1)){
        if(mdl.serviceCategory!.contains('Syringes')){
          getSortedClinicData.add(mdl);

        }
      }else
      if(categoryIndex.contains(2)){
        if(mdl.serviceCategory!.contains('Safer smoking kits')){
          getSortedClinicData.add(mdl);
        }
      }else
      if(categoryIndex.contains(3)){
        if(mdl.serviceCategory!.contains('Medical care')){
          getSortedClinicData.add(mdl);
        }
      }else
      if(categoryIndex.contains(4)){
        if(mdl.serviceCategory!.contains('CBR')){
          getSortedClinicData.add(mdl);
        }
      }else
      if(categoryIndex.contains(5)){
        if(mdl.serviceCategory!.contains('Blood test')){
          getSortedClinicData.add(mdl);
        }
      }else
      if(categoryIndex.contains(6)){
        if(mdl.serviceCategory!.contains('HIV test')){
          getSortedClinicData.add(mdl);
        }
      }

    }

    print(getSortedClinicData.length);
    print(categoryIndex.length);
    update();
  }
  // RxBool isResultLoaded = false.obs;








  List<ClinicDetailsModel> getClinicData = [];
  List<ClinicDetailsModel> getSortedClinicData = [];
  static List<ClinicDetailsModel> mmmooodell = [];
  List<ClinicDetailsModel> model = [];
  Future<void> userGetAllClinicData() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    // String uid = FirebaseAuth.instance.currentUser!.uid;
    String uid = 'jhjhjkh';
    getClinicData.clear();
    getSortedClinicData.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await getAllClinicDataUseCase(Params(uid));
      results.fold((e) {
        print('the error in client userGetAllClinicData controller  is //////${e.message}');
      }, (b) {

        getClinicData=b;
        for(var mdl in getClinicData){
          getSortedClinicData.add(mdl);
        }
        
        mmmooodell = b;
        model =List.from(mmmooodell);
        getAllClinicsToList();
        // isResultLoaded.value = true;
        // isResultLoaded.value = false;
        update();
      });
    }
  }

  RxList<ClinicDistanceModel> nearMeList=<ClinicDistanceModel>[].obs;
Future<void>  getNearMeClinics({required double lat,required double long})async{

  EasyLoading.show();

  nearMeList.value=[];
  List<ClinicDistanceModel> list=[];
  getClinicData.forEach((clinic){
    double distance = FlutterMapMath().distanceBetween(
      lat,
        long,
        clinic.lat??0,
        clinic.long??0,
        "kilometers"
    );
    ClinicDistanceModel mdl=ClinicDistanceModel(
      distance: distance,
      id:clinic.id,
      serviceCategory:clinic.serviceCategory,
      title:clinic.title,
      clinicDescription:clinic.clinicDescription,
      address:clinic.address,
      fromHour:clinic.fromHour,
      fromMinute:clinic.fromMinute,
      toHour:clinic.toHour,
      toMinute:clinic.toMinute,
      mobileNumber:clinic.mobileNumber,
      lat:clinic.lat,
      long:clinic.long,
      clinicImages:clinic.clinicImages,
      date:clinic.date,
      website:clinic.website,
    );

list.add(mdl);
  });

  list.sort((a, b) => a.distance!.compareTo(b.distance!));
  list.forEach((ele)=>print("distance ${ele.distance}"));
  list.forEach((ele)async {
    nearMeList.add(ele);
    List<Placemark> placeMark = await placemarkFromCoordinates(ele.lat!, ele.long!);
    print('placeMark.last.name ${placeMark.last.name} ${placeMark.last.street} ${placeMark.last.subAdministrativeArea} ${placeMark.last.administrativeArea}');
  },);
  EasyLoading.dismiss();
update();
  }





  // This function is called whenever the text field changes
  void runFilter(String enteredKeyword) {
    // foundClinic = getClinicData;
    print('skdjfkslajdfklsjadfjklsadfjaskf;jaksldjfklsajdkfljasd $enteredKeyword');
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      // results = getClinicData;
    } else {
      // model = getClinicData.where((user) => user.title!.toLowerCase().contains(enteredKeyword.toLowerCase()) || user.serviceCategory!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      // model = getClinicData.where((user) => user.serviceCategory!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

  }


  List<String> allClinicsName = [];
  void getAllClinicsToList(){
    allClinicsName.clear();
    for(var e in getClinicData){
      allClinicsName.add(e.title!);
    }
    print('All Clinic Names is ${allClinicsName}');
    print('All Clinic Lenght is ${allClinicsName.length}');
    update();
  }



  List<ClinicDetailsModel> getAllClinicSyringesCategory = [];
  Future<void> userGetAllClinicSyringesCategory() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    // String uid = FirebaseAuth.instance.currentUser!.uid;
    String uid = 'jhjhjkh';;
    getAllClinicSyringesCategory.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await getAllClinicSyringesCategoryUseCase(Params(uid));
      results.fold((e) {
        print('the error in client getAllClinicSyringesCategory controller  is //////${e.message}');
      }, (b) {
        getAllClinicSyringesCategory = b;
        // isResultLoaded.value = true;
        // isResultLoaded.value = false;
        update();
      });
    }
  }

  List<ClinicDetailsModel> getAllClinicSaferSmokingKitsCategory = [];
  Future<void> userGetAllClinicSaferSmokingKitsCategory() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    // String uid = FirebaseAuth.instance.currentUser!.uid;
    String uid = 'jhjhjkh';
    getAllClinicSaferSmokingKitsCategory.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await getClientSaferSmokingCategoryUseCase(Params(uid));
      results.fold((e) {
        print('the error in client getAllClinicSaferSmokingKitsCategory controller  is //////${e.message}');
      }, (b) {
        getAllClinicSaferSmokingKitsCategory = b;
        // isResultLoaded.value = true;
        // isResultLoaded.value = false;
        update();
      });
    }
  }


 List<ClinicDetailsModel> getAllClinicMedicalCaresCategory = [];
  Future<void> userGetAllClinicMedicalCaresCategory() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    // String uid = FirebaseAuth.instance.currentUser!.uid;
    String uid = 'jhjhjkh';
    getAllClinicMedicalCaresCategory.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await getAllClinicMedicalCareUseCase(Params(uid));
      results.fold((e) {
        print('the error in client getAllClinicMedicalCaresCategory controller  is //////${e.message}');
      }, (b) {
        getAllClinicMedicalCaresCategory = b;
        // isResultLoaded.value = true;
        // isResultLoaded.value = false;
        update();
      });
    }
  }


  List<ClinicDetailsModel> getAllClinicCBRCategory = [];
  Future<void> userGetAllClinicCBRCategory() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    // String uid = FirebaseAuth.instance.currentUser!.uid;
    String uid = 'jhjhjkh';
    getAllClinicCBRCategory.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await getAllClinicCbrCategoryUseCase(Params(uid));
      results.fold((e) {
        print('the error in client userGetAllClinicCBRCategory controller  is //////${e.message}');
      }, (b) {
        getAllClinicCBRCategory = b;
        // isResultLoaded.value = true;
        // isResultLoaded.value = false;
        update();
      });
    }
  }


  List<ClinicDetailsModel> getAllClinicBloodTestCategory = [];
  Future<void> userGetAllClinicBloodTestCategory() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    // String uid = FirebaseAuth.instance.currentUser!.uid;
    String uid = 'jhjhjkh';
    getAllClinicBloodTestCategory.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await getAllClinicBloodTestCategoryUseCase(Params(uid));
      results.fold((e) {
        print('the error in client getAllClinicBloodTestCategory controller  is //////${e.message}');
      }, (b) {
        getAllClinicBloodTestCategory = b;
        // isResultLoaded.value = true;
        // isResultLoaded.value = false;
        update();
      });
    }
  }



  List<ClinicDetailsModel> getAllClinicHIVTestCategory = [];
  Future<void> userGetAllClinicHIVTestCategory() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    // String uid = FirebaseAuth.instance.currentUser!.uid;
    String uid = 'jhjhjkh';
    getAllClinicHIVTestCategory.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await getAllClinicHivTestCategoryUseCase(Params(uid));
      results.fold((e) {
        print('the error in client getAllClinicHIVTestCategory controller  is //////${e.message}');
      }, (b) {
        getAllClinicHIVTestCategory = b;
        // isResultLoaded.value = true;
        // isResultLoaded.value = false;
        update();
      });
    }
  }


  RxInt quoteIndex=0.obs;
  List<QuotesModel> getAllQuotes = [];
  RxBool isQuoteLoaded = false.obs;
  QuotesModel? singleQuote;
  Future<void> userGetAllQuotes() async {
    isQuoteLoaded.value = false;
    final connectivityResult = await (Connectivity().checkConnectivity());
    // String uid = FirebaseAuth.instance.currentUser!.uid;
    String uid = 'jhjhjkh';
    getAllQuotes.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await getAllQuotesUseCase(Params(uid));
      results.fold((e) {
        print('the error in client userGetAllQuotes controller  is //////${e.message}');
      }, (b) {
        getAllQuotes = b;
        // isResultLoaded.value = true;
        // isResultLoaded.value = false;
        quoteIndex.value = Random().nextInt(getAllQuotes.length);
        singleQuote= getAllQuotes[quoteIndex.value];
        isQuoteLoaded.value = true;
        update();
      });
    }
  }

  DonationModel? singleDonation;
  List<DonationModel> getDonation = [];
  RxBool isDonationLoaded = false.obs;
  RxInt donationIndex=0.obs;
  Future<void> userGetDonation() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    // String uid = FirebaseAuth.instance.currentUser!.uid;
    String uid = 'jhjhjkh';
    getDonation.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await getDonationUseCase(Params(uid));
      results.fold((e) {
        print('the error in client userGetDonation controller  is //////${e.message}');
      }, (b) {
        getDonation = b;
        // isResultLoaded.value = true;
        // isResultLoaded.value = false;
        donationIndex.value = Random().nextInt(getDonation.length);
        singleDonation= getDonation[donationIndex.value];
        isDonationLoaded.value = true;
        update();
      });
    }
  }







  openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    bool isLaunchUrl=await canLaunchUrl(Uri.parse(googleUrl));
    print(isLaunchUrl);
    if (isLaunchUrl) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      await launchUrl(Uri.parse(googleUrl));
      throw 'Could not open the map.';
    }
  }



  openClinicWebsite(String url)async  {
    // String googleUrl = url;
    bool isLaunchUrl=await canLaunchUrl(Uri.parse(url));
    print(isLaunchUrl);
    if (isLaunchUrl) {
      await launchUrl(Uri.parse(url));
    } else {
      await launchUrl(Uri.parse(url));
      throw 'Could not open the Url.';
    }

  }







}