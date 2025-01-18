import 'package:clinics_app/features/admin/domain/repository/admin_repository_main.dart';
import 'package:clinics_app/features/user/domain/entities/donation_model.dart';
import 'package:clinics_app/features/user/domain/entities/quotes_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';
import '../../../user/domain/entities/clinic_details_model.dart';
import '../data_source/admin_database_main.dart';

class AdminRepositoryImpl implements AdminRepositoryMain {



  AdminDatabaseMain adminDatabaseMain;

  AdminRepositoryImpl({required this.adminDatabaseMain});

  @override
  Future<Either<Failure, bool>> addNewClinic(ClinicDetailsModel clinicDetailsModel) async {
    String  isRegister= await  adminDatabaseMain.addNewClinic(clinicDetailsModel);
    if(isRegister=='Success'){
      return const Right(true);
    }
    else {
      return Left(Failure(message: isRegister));
    }
  }



  @override
  Future<Either<Failure, bool>> addNewQuote(QuotesModel quotesModel) async {
    String  isRegister= await  adminDatabaseMain.addNewQuote(quotesModel);
    if(isRegister=='Success'){
      return const Right(true);
    }
    else {
      return Left(Failure(message: isRegister));
    }
  }



  @override
  Future<Either<Failure, bool>> deleteClinic(ClinicDetailsModel clinicDetailsModel)async {
    String  isRegister= await  adminDatabaseMain.deleteClinic(clinicDetailsModel);
    if(isRegister=='Success'){
      return const Right(true);
    }
    else {
      return Left(Failure(message: isRegister));
    }
  }

  @override
  Future<Either<Failure, bool>> updateClinic(ClinicDetailsModel clinicDetailsModel)async  {
    String  isRegister= await  adminDatabaseMain.updateClinic(clinicDetailsModel);
    if(isRegister=='Success'){
      return const Right(true);
    }
    else {
      return Left(Failure(message: isRegister));
    }
  }

  @override
  Future<Either<Failure, bool>> addNewDonation(DonationModel donationModel) async {
    String  isRegister= await  adminDatabaseMain.addNewDonation(donationModel);
    if(isRegister=='Success'){
      return const Right(true);
    }
    else {
      return Left(Failure(message: isRegister));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteQuote(QuotesModel quoteModel) async {
    String  isRegister= await  adminDatabaseMain.deleteQuote(quoteModel);
    if(isRegister=='Success'){
      return const Right(true);
    }
    else {
      return Left(Failure(message: isRegister));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteDonation(DonationModel donationModel) async  {
    String  isRegister= await  adminDatabaseMain.deleteDonation(donationModel);
    if(isRegister=='Success'){
      return const Right(true);
    }
    else {
      return Left(Failure(message: isRegister));
    }
  }



}