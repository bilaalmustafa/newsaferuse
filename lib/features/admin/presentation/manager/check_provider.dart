import 'dart:typed_data';

import 'package:clinics_app/features/admin/presentation/manager/admin_controller.dart';
import 'package:clinics_app/features/user/domain/entities/clinic_details_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/utils/injections.dart';

class CheckProvider extends ChangeNotifier {
  ImagePicker imagePicker = ImagePicker();

  List<XFile> selectedIamges = [];
  List<Uint8List> asdfasdf = [];

  Future<void> selectImages(String type) async {
    List<XFile> imgs = [];
    List<Uint8List> fdsafdsa = [];
    if (type == 'gallery') {
      try {
        imgs = await imagePicker.pickMultiImage(imageQuality: 80);
        for(var i in imgs){
          Uint8List abc = await i.readAsBytes();
          fdsafdsa.add(abc);
        }
        notifyListeners();
      } catch (e) {
        print('Error $e');
      }
    } else {
      final img = await imagePicker.pickImage(
          source: ImageSource.camera, imageQuality: 80);

      if (img != null) {
        imgs.add(img);
        notifyListeners();
      }
    }

    if (imgs.isNotEmpty && fdsafdsa.isNotEmpty) {
      selectedIamges.addAll(imgs);
      asdfasdf.addAll(fdsafdsa);
      notifyListeners();
      print(selectedIamges.length);
      print(asdfasdf.length);
      // print(selectedIamges.p);
    }
  }

  void removeImages(int index) {
    selectedIamges.removeAt(index);
    asdfasdf.removeAt(index);
    notifyListeners();
  }

  List<String> arrImagesUrl = [];

  Future<void> uploadFunction(List<Uint8List> _images) async {
    arrImagesUrl.clear();
    for (int i = 0; i < _images.length; i++) {
      print(
          'dfgsdklfjgsdjfgkjsdklfgjklsdjfgkljdfklgdfklgldfglsdgkdlkgjsdklfgjklsdgjsdklfgiosdmgiodh $i');
      dynamic imageUrl = await uploadFile(_images[i]);
      arrImagesUrl.add(imageUrl.toString());
      print('The images url is $arrImagesUrl');
    }
    notifyListeners();
  }

  final FirebaseStorage storageRef = FirebaseStorage.instance;

  Future<String> uploadFile(Uint8List _image) async {
    TaskSnapshot reference = await storageRef
        .ref()
        .child("Clinic")
        .child('_image${DateTime.now()}')
        .putBlob(_image);
    return await reference.ref.getDownloadURL();
  }

  Future<void> upload(BuildContext context) async {
    EasyLoading.show();
    await uploadFunction(asdfasdf).whenComplete(
        () => sl<AdminController>().addNewClinic(context, arrImagesUrl));
    arrImagesUrl.clear();
    // selectedIamges.replaceRange(0, selectedIamges.length, selectedIamges);
    selectedIamges.clear();
    selectedIamges.removeRange(0, selectedIamges.length);
    asdfasdf.removeRange(0, asdfasdf.length);

    EasyLoading.dismiss();
    notifyListeners();
  }

  Future<void> updateAllData(BuildContext context, ClinicDetailsModel model) async {
    EasyLoading.show();
    await uploadFunction(asdfasdf).whenComplete(
        () => sl<AdminController>().updateClinicController(context, model, arrImagesUrl));
    arrImagesUrl.clear();
    // selectedIamges.replaceRange(0, selectedIamges.length, selectedIamges);
    selectedIamges.clear();
    selectedIamges.removeRange(0, selectedIamges.length);
    EasyLoading.dismiss();
    notifyListeners();
  }




  //////////////////////////////////////////////////////////////////////////

  XFile? selectedImage;
  Uint8List? selImg;
  Future<void> uploadQuotePhoto(BuildContext context) async {
    EasyLoading.show();
    ImagePicker imagePicker = ImagePicker();
    // XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    selectedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    selImg = await  selectedImage!.readAsBytes();
    notifyListeners();
    print('Image File is ${selectedImage?.path}');
    EasyLoading.dismiss();
  }

  void removeImage() {
    selectedImage = null;
    notifyListeners();

  }




  String quotePhoto = '';
  void uploadQuoteAndImage(BuildContext context,String quotePhotoTitle)async {
    EasyLoading.show();
    if (selImg == null) return;
    Reference reference = FirebaseStorage.instance.ref()
        .child('QuoteImage')
        .child(quotePhotoTitle);
    try {
      Reference upload = reference;
      await upload.putBlob(selImg!);
      quotePhoto = await upload.getDownloadURL();
      selectedImage = null;
      await sl<AdminController>().addNewQuoteController(context,quotePhoto).whenComplete(()=> EasyLoading.dismiss());
      notifyListeners();
    }
    catch (e) {
      print('error is $e');
      EasyLoading.dismiss();
    }

  }

  String donationPhoto = '';
  void uploadDonationAndImage(BuildContext context,String quotePhotoTitle)async {
    EasyLoading.show();
    if (selImg == null) return;
    Reference reference = FirebaseStorage.instance.ref()
        .child('DonationImage')
        .child(quotePhotoTitle);
    try {
      Reference upload = reference;
      await upload.putBlob(selImg!);
      donationPhoto = await upload.getDownloadURL();
      await sl<AdminController>().addNewDonationController(context,donationPhoto).whenComplete(()=> EasyLoading.dismiss());
      selectedImage = null;
      // selImg = null;
      notifyListeners();

    }
    catch (e) {
      print('error is $e');
      EasyLoading.dismiss();
    }

  }



}
