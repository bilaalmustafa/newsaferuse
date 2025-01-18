import 'package:clinics_app/features/user/domain/entities/clinic_details_model.dart';
import 'package:clinics_app/features/user/domain/entities/donation_model.dart';
import 'package:clinics_app/features/user/domain/entities/quotes_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'admin_database_main.dart';

class AdminDatabaseImpl implements AdminDatabaseMain {



  final _db = FirebaseFirestore.instance;

  @override
  Future<String> addNewClinic(ClinicDetailsModel clinicDetailsModel) async {
    String message = '';

    try{

      await _db.collection('clinic').doc(clinicDetailsModel.id).set(clinicDetailsModel.toMap());
      print('Clinic has been Added');
      message = 'Success';

    }
    catch(e){
      print('the error in addNewClinic in AdminDatabaseImpl  //////!!!!! is $e');
      message = 'the error in addNewClinic in AdminDatabaseImpl $e';
    }

    return message;
  }




  @override
  Future<String> addNewQuote(QuotesModel quotesModel) async {
    String message = '';

    try{
      await _db.collection('quotes').doc(quotesModel.id).set(quotesModel.toMap());
      print('Quote has been Added');
      message = 'Success';

    }
    catch(e){
      print('the error in addNewQuote in AdminDatabaseImpl  //////!!!!! is $e');
      message = 'the error in addNewQuote in AdminDatabaseImpl $e';
    }

    return message;
  }



  @override
  Future<String> addNewDonation(DonationModel donationModel) async {
    String message = '';

    try{
      await _db.collection('donation').doc(donationModel.id).set(donationModel.toMap());
      print('Donation has been Added');
      message = 'Success';

    }
    catch(e){
      print('the error in addNewDonation in AdminDatabaseImpl  //////!!!!! is $e');
      message = 'the error in addNewDonation in AdminDatabaseImpl $e';
    }

    return message;
  }



  @override
  Future<String> deleteClinic(ClinicDetailsModel clinicDetailsModel) async {
    String message = '';
    try{
      _db.collection('clinic').doc(clinicDetailsModel.id).delete();
      message = 'Success';
      print('Clinic is deleted AdminDatabaseImpl is');
    }

    catch(e){
      print('The problem in deleteClinic in AdminDatabaseImpl is $e');
      message = 'Problem is $e';
    }

    return message;
  }

  @override
  Future<String> updateClinic(ClinicDetailsModel clinicDetailsModel) async  {

    String message = '';
    try{
      await _db.collection('clinic').doc(clinicDetailsModel.id).update(clinicDetailsModel.toMap());
      print('Item has been Added');
      message = 'Success';

    }
    catch(e){
      print('the error in updateClinic in AdminDatabaseImpl  //////!!!!! is $e');
      message = 'the error in updateClinic in AdminDatabaseImpl $e';
    }

    return message;

  }

  @override
  Future<String> deleteQuote(QuotesModel quoteModel) async {
    String message = '';
    try{
      _db.collection('quotes').doc(quoteModel.id).delete();
      message = 'Success';
      print('quote is deleted AdminDatabaseImpl is');
    }

    catch(e){
      print('The problem in deleteQuote in AdminDatabaseImpl is $e');
      message = 'Problem is $e';
    }

    return message;
  }

  @override
  Future<String> deleteDonation(DonationModel donationModel) async {
    String message = '';
    try{
      _db.collection('donation').doc(donationModel.id).delete();
      message = 'Success';
      print('donation  is deleted AdminDatabaseImpl is');
    }

    catch(e){
      print('The problem in deleteDonation in AdminDatabaseImpl is $e');
      message = 'Problem is $e';
    }

    return message;
  }




}