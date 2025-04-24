import 'dart:developer';
import 'dart:io';
import 'package:clinics_app/features/user/lacewatch/core/config/di.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/utils.dart';
import 'package:clinics_app/features/user/lacewatch/core/services/drug_services.dart';
import 'package:clinics_app/features/user/lacewatch/model/drag.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';


class DrugViewmodel extends ChangeNotifier {
  bool isLoading = false;
  double _lat = 0.0;
  double _long = 0.0;
  double get lat => _lat;
  double get long => _long;
  Future<String?> _getImageUrl(File image, String id) async {
    File compressImage = await Utils.getCompressedFile(image);
    return await instance<DrugService>()
        .uploadImage(compressImage, '/drugs/drug_$id');
  }

  Future<bool> createPost(String id, Drug drug, File image) async {
    for (int i = 0; i < drug.queries!.length; i++) {
      if (drug.queries![i].id == null) {
        Fluttertoast.showToast(msg: "Please answer all the queries.");
        return false;
      }
    }

    isLoading = true;
    notifyListeners();

    String? drugImage = await _getImageUrl(image, id);
    log(drugImage ?? "");
    if (drugImage == null) {
      Fluttertoast.showToast(msg: "Error Uploading Image");
      isLoading = false;
      notifyListeners();
      return false;
    }
    drug = drug.copyWith(drugImage: drugImage);
    drug = drug.copyWith(queries: drug.queries);
    bool success = await instance<DrugService>().createDrug(id, drug);
    isLoading = true;
    notifyListeners();
    return success;
  }

  /// Function to request permission and get current location
  Future<bool> determinePosition() async {
    isLoading = true;
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      isLoading = false;
      return false;
    } else {
      isLoading = true;
      Position position = await Geolocator.getCurrentPosition();
      _lat = position.latitude;
      _long = position.longitude;
      log("latttt  $_lat");

      return true;
    }
  }
}
