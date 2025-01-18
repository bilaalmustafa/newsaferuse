
import 'package:clinics_app/features/user/data/data_source/user_database_main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/clinic_details_model.dart';
import '../../domain/entities/donation_model.dart';
import '../../domain/entities/quotes_model.dart';

class UserDatabaseImpl implements UserDatabaseMain {


  final db = FirebaseFirestore.instance;

  @override
  Future<List<ClinicDetailsModel>> getAllClinicDetails() async {
    List<ClinicDetailsModel> mdl = [];
    try {
      final snapshot = await db.collection('clinic').get();
      for (var element in snapshot.docs) {
        ClinicDetailsModel mddl = ClinicDetailsModel.fromMap(element.data());
        mdl.add(mddl);
      }
      print('The model in databaseService in getAllClinicDetails() is $mdl');
    } catch (e) {
      print('The Exception in databaseService in getAllClinicDetails() $e');
    }

    return mdl;
  }



  @override
  Future<List<ClinicDetailsModel>> getAllClinicSyringesCategory() async {
    List<ClinicDetailsModel> mdl = [];

    try {
      final snapshot = await db.collection('clinic').where('serviceCategory', arrayContains: 'Syringes').get();
      for (var element in snapshot.docs) {
        ClinicDetailsModel mddl = ClinicDetailsModel.fromMap(element.data());
        mdl.add(mddl);
      }
      print('The model in databaseService in getAllClinicSyringesCategory() is $mdl');
    } catch (e) {
      print('The Exception in databaseService in getAllClinicSyringesCategory() $e');
    }

    return mdl;
  }

  @override
  Future<List<ClinicDetailsModel>> getAllClinicSaferSmokingKitsCategory() async {
    List<ClinicDetailsModel> mdl = [];

    try {
      final snapshot = await db.collection('clinic').where('serviceCategory', arrayContains: 'Safer smoking kits').get();
      for (var element in snapshot.docs) {
        ClinicDetailsModel mddl = ClinicDetailsModel.fromMap(element.data());
        mdl.add(mddl);
      }
      print('The model in databaseService in getAllClinicSaferSmokingKitsCategory() is $mdl');
    } catch (e) {
      print('The Exception in databaseService in getAllClinicSaferSmokingKitsCategory() $e');
    }

    return mdl;
  }

  @override
  Future<List<ClinicDetailsModel>> getAllClinicMedicalCaresCategory() async {
    List<ClinicDetailsModel> mdl = [];

    try {
      final snapshot = await db.collection('clinic').where('serviceCategory', arrayContains: 'Medical care').get();
      for (var element in snapshot.docs) {
        ClinicDetailsModel mddl = ClinicDetailsModel.fromMap(element.data());
        mdl.add(mddl);
      }
      print('The model in databaseService in getAllClinicMedicalCaresCategory() is $mdl');
    } catch (e) {
      print('The Exception in databaseService in getAllClinicMedicalCaresCategory() $e');
    }

    return mdl;
  }


  @override
  Future<List<ClinicDetailsModel>> getAllClinicCBRCategory() async {
    List<ClinicDetailsModel> mdl = [];

    try {
      final snapshot = await db.collection('clinic').where('serviceCategory', arrayContains: 'CBR').get();
      for (var element in snapshot.docs) {
        ClinicDetailsModel mddl = ClinicDetailsModel.fromMap(element.data());
        mdl.add(mddl);
      }
      print('The model in databaseService in getAllClinicCBRCategory() is $mdl');
    } catch (e) {
      print('The Exception in databaseService in getAllClinicCBRCategory() $e');
    }

    return mdl;
  }


  @override
  Future<List<ClinicDetailsModel>> getAllClinicBloodTestCategory() async {
    List<ClinicDetailsModel> mdl = [];

    try {
      final snapshot = await db.collection('clinic').where('serviceCategory', arrayContains: 'Blood test').get();
      for (var element in snapshot.docs) {
        ClinicDetailsModel mddl = ClinicDetailsModel.fromMap(element.data());
        mdl.add(mddl);
      }
      print('The model in databaseService in getAllClinicBloodTestCategory() is $mdl');
    } catch (e) {
      print('The Exception in databaseService in getAllClinicBloodTestCategory() $e');
    }

    return mdl;
  }


  @override
  Future<List<ClinicDetailsModel>> getAllClinicHIVTestCategory() async {
    List<ClinicDetailsModel> mdl = [];

    try {
      final snapshot = await db.collection('clinic').where('serviceCategory', arrayContains: 'HIV test').get();
      for (var element in snapshot.docs) {
        ClinicDetailsModel mddl = ClinicDetailsModel.fromMap(element.data());
        mdl.add(mddl);
      }
      print('The model in databaseService in getAllClinicHIVTestCategory() is $mdl');
    } catch (e) {
      print('The Exception in databaseService in getAllClinicHIVTestCategory() $e');
    }

    return mdl;
  }



  @override
  Future<List<QuotesModel>> getAllQuotes() async {
    List<QuotesModel> mdl = [];

    try {
      final snapshot = await db.collection('quotes').get();
      for (var element in snapshot.docs) {
        QuotesModel mddl = QuotesModel.fromMap(element.data());
        mdl.add(mddl);
      }
      print('The model in databaseService in getAllQuotes() is $mdl');
    } catch (e) {
      print('The Exception in databaseService in getAllQuotes() $e');
    }

    return mdl;
  }



  @override
  Future<List<DonationModel>> getDonation() async {
    List<DonationModel> mdl = [];

    try {
      final snapshot = await db.collection('donation').get();
      for (var element in snapshot.docs) {
        DonationModel mddl = DonationModel.fromMap(element.data());
        mdl.add(mddl);
      }
      print('The model in databaseService in getDonation() is $mdl');
    } catch (e) {
      print('The Exception in databaseService in getDonation() $e');
    }

    return mdl;
  }

  @override
  Future<QuotesModel?> getSingleQuote() async{

    try{
      print("try");
      final snapshot = await db.collection('quotes').doc('QWE237976').get();
      print("snapshot : ${snapshot.id}");
      print("snapshot : ${snapshot.data().toString()}");
      QuotesModel mdl = QuotesModel.fromMap(snapshot.data()!);
      return mdl;
    }

    catch(e){
      print('The Error in getSingleQuote is @@@@@@@ $e');
    }
    print("aFTER");
    return null;
  }

  @override
  Future<DonationModel?> getSingleDonation() async {

    try{
      print("try");
      final snapshot = await db.collection('donation').doc('QWE610097').get();
      print("snapshot : ${snapshot.id}");
      print("snapshot : ${snapshot.data().toString()}");
      DonationModel mdl = DonationModel.fromMap(snapshot.data()!);
      return mdl;
    }

    catch(e){
      print('The Error in getSingleDonation is @@@@@@@ $e');
    }
    print("aFTER");
    return null;
  }









}