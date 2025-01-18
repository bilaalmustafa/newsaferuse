import 'package:clinics_app/features/user/domain/entities/clinic_details_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';
import '../../../user/domain/entities/donation_model.dart';
import '../../../user/domain/entities/quotes_model.dart';

abstract class AdminRepositoryMain {




  Future<Either<Failure,bool>> addNewClinic(ClinicDetailsModel clinicDetailsModel);
  Future<Either<Failure,bool>> addNewQuote(QuotesModel quotesModel);
  Future<Either<Failure,bool>> deleteClinic(ClinicDetailsModel clinicDetailsModel);
  Future<Either<Failure,bool>> updateClinic(ClinicDetailsModel clinicDetailsModel);
  Future<Either<Failure,bool>> addNewDonation(DonationModel donationModel);
  Future<Either<Failure,bool>> deleteQuote(QuotesModel quoteModel);
  Future<Either<Failure,bool>> deleteDonation(DonationModel donationModel);



}