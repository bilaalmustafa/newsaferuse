import 'package:clinics_app/core/constants/states_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController{

  //
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  //
  // RxInt tabIndex=0.obs;
  //
  // setTabIndex(int val){
  //
  //   tabIndex.value=val;
  //   if (scaffoldKey.currentState!.isEndDrawerOpen == true) {
  //
  //     scaffoldKey.currentState!.closeEndDrawer();
  //   }
  // }

  Rx<StatesModel> selectedStateModel=StatesModel.statesModelList[0].obs;
  setSelectedStateModel(StatesModel mdl){
    selectedStateModel.value=mdl;
  }

  RxInt adminHomeTabIndex=0.obs;
  setAdminHomeTabIndex(int val){
    adminHomeTabIndex.value = val;
  }


  RxInt userHomeTabIndex=0.obs;
  setUserHomeTabIndex(int val){
    userHomeTabIndex.value = val;
    update();
  }


  RxInt selectDonationAmount =0.obs;
  setSelectDonationAmount(int val){
    selectDonationAmount.value = val;
    update();
  }

  TextEditingController selectAmountController = TextEditingController();




  RxInt selectDonationAmountToController = 5.obs;
  setDonationAmountToController(int val){
    selectDonationAmountToController.value = val;
    selectAmountController.text = selectDonationAmountToController.toString();
    print(selectDonationAmountToController);
    update();
  }


  var donationFormKey = GlobalKey<FormState>();

  String? validate(String? txt){

    if(txt!.isEmpty){
      return 'Please select any amount or write it';
    }
    return null;

  }




  Future<void> locationPermission(BuildContext context) async {
    if (!await Permission.location.status.isGranted) {
      var status = await Permission.location.request();
      if (status == PermissionStatus.permanentlyDenied) {
        showDialog<String>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Allow Safe User to access the Location'),
            content:
            const Text('This app uses the location for orders acceptation'),
            actions: <Widget>[
              // if user deny again, we do nothing
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Don\'t allow'),
              ),

              TextButton(
                onPressed: () {
                  openAppSettings();
                  Navigator.pop(context);
                },
                child: const Text('Allow'),
              ),
            ],
          ),
        );

        return;
      }
    }
  }



  List<String> listText = [
    'Text 1',
    'Text 2',
    'Text 3',
    'Text 4',
  ];

  Rx<String> selectText = ''.obs;
  setText(String txt){
    selectText.value = txt;
    update();
  }






}