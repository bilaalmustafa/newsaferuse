
import 'package:clinics_app/features/user/domain/entities/quotes_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';
import '../entities/clinic_details_model.dart';
import '../entities/donation_model.dart';

abstract class UserRepositories {




  Future<Either<Failure,List<ClinicDetailsModel>>> getAllClinicDetails();
  Future<Either<Failure,List<ClinicDetailsModel>>> getAllClinicSyringesCategory();
  Future<Either<Failure,List<ClinicDetailsModel>>> getAllClinicSaferSmokingKitsCategory();
  Future<Either<Failure,List<ClinicDetailsModel>>> getAllClinicMedicalCaresCategory();
  Future<Either<Failure,List<ClinicDetailsModel>>> getAllClinicCBRCategory();
  Future<Either<Failure,List<ClinicDetailsModel>>> getAllClinicBloodTestCategory();
  Future<Either<Failure,List<ClinicDetailsModel>>> getAllClinicHIVTestCategory();
  Future<Either<Failure,List<QuotesModel>>> getAllQuotes();
  Future<Either<Failure,List<DonationModel>>> getDonation();
  Future<Either<Failure,QuotesModel>> getSingleQuote();
  Future<Either<Failure,DonationModel>> getSingleDonation();

}

