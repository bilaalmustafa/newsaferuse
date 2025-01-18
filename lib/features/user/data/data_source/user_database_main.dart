import 'package:clinics_app/features/user/domain/entities/quotes_model.dart';

import '../../domain/entities/clinic_details_model.dart';
import '../../domain/entities/donation_model.dart';


abstract class UserDatabaseMain {


  Future<List<ClinicDetailsModel>> getAllClinicDetails();
  Future<List<ClinicDetailsModel>> getAllClinicSyringesCategory();
  Future<List<ClinicDetailsModel>> getAllClinicSaferSmokingKitsCategory();
  Future<List<ClinicDetailsModel>> getAllClinicMedicalCaresCategory();
  Future<List<ClinicDetailsModel>> getAllClinicCBRCategory();
  Future<List<ClinicDetailsModel>> getAllClinicBloodTestCategory();
  Future<List<ClinicDetailsModel>> getAllClinicHIVTestCategory();
  Future<List<QuotesModel>> getAllQuotes();
  Future<List<DonationModel>> getDonation();
  Future<QuotesModel?> getSingleQuote();
  Future<DonationModel?> getSingleDonation();


}