import 'package:clinics_app/features/user/domain/entities/clinic_details_model.dart';
import 'package:clinics_app/features/user/domain/entities/donation_model.dart';
import 'package:clinics_app/features/user/domain/entities/quotes_model.dart';

abstract class AdminDatabaseMain {


  Future<String> addNewClinic(ClinicDetailsModel clinicDetailsModel);
  Future<String> addNewQuote(QuotesModel quotesModel);
  Future<String> deleteClinic(ClinicDetailsModel clinicDetailsModel);
  Future<String> updateClinic(ClinicDetailsModel clinicDetailsModel);
  Future<String> addNewDonation(DonationModel donationModel);
  Future<String> deleteQuote(QuotesModel quoteModel);
  Future<String> deleteDonation(DonationModel donationModel);





}