
import 'package:clinics_app/features/user/domain/entities/quotes_model.dart';
import 'package:clinics_app/core/utils/failure.dart';
import 'package:clinics_app/features/user/data/data_source/user_database_main.dart';
import 'package:clinics_app/features/user/domain/repositries/user_repositories.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/clinic_details_model.dart';
import '../../domain/entities/donation_model.dart';

class UserRepoImpl implements UserRepositories {



  UserDatabaseMain userDatabaseMain;

  UserRepoImpl({
    required this.userDatabaseMain
  });



  @override
  Future<Either<Failure, List<ClinicDetailsModel>>> getAllClinicDetails() async  {
    List<ClinicDetailsModel>  allOrders= await  userDatabaseMain.getAllClinicDetails();
    if(allOrders != null){
      print("repo : ${allOrders.length}");
      return  Right(allOrders);
    }
    else {
      print('the error in getAllClinicDetails in AdminRepoImpl is @@@@@@@@@@@@ ////////////@@@@@@ ');
      return Left(Failure(message: "Something went wrong"));
    }

  }



  @override
  Future<Either<Failure, List<ClinicDetailsModel>>> getAllClinicSyringesCategory() async {
    List<ClinicDetailsModel>  allOrders= await  userDatabaseMain.getAllClinicSyringesCategory();
    if(allOrders != null){
      print("repo : ${allOrders.length}");
      return  Right(allOrders);
    }
    else {
      print('the error in getAllClinicSyringesCategory in AdminRepoImpl is @@@@@@@@@@@@ ////////////@@@@@@ ');
      return Left(Failure(message: "Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, List<ClinicDetailsModel>>> getAllClinicSaferSmokingKitsCategory() async {
    List<ClinicDetailsModel>  allOrders= await  userDatabaseMain.getAllClinicSaferSmokingKitsCategory();
    if(allOrders != null){
      print("repo : ${allOrders.length}");
      return  Right(allOrders);
    }
    else {
      print('the error in getAllClinicSaferSmokingKitsCategory in AdminRepoImpl is @@@@@@@@@@@@ ////////////@@@@@@ ');
      return Left(Failure(message: "Something went wrong"));
    }
  }



  @override
  Future<Either<Failure, List<ClinicDetailsModel>>> getAllClinicMedicalCaresCategory() async {
    List<ClinicDetailsModel>  allOrders= await  userDatabaseMain.getAllClinicMedicalCaresCategory();
    if(allOrders != null){
      print("repo : ${allOrders.length}");
      return  Right(allOrders);
    }
    else {
      print('the error in getAllClinicMedicalCaresCategory in AdminRepoImpl is @@@@@@@@@@@@ ////////////@@@@@@ ');
      return Left(Failure(message: "Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, List<ClinicDetailsModel>>> getAllClinicCBRCategory() async {
    List<ClinicDetailsModel>  allOrders= await  userDatabaseMain.getAllClinicCBRCategory();
    if(allOrders != null){
      print("repo : ${allOrders.length}");
      return  Right(allOrders);
    }
    else {
      print('the error in getAllClinicCBRCategory in AdminRepoImpl is @@@@@@@@@@@@ ////////////@@@@@@ ');
      return Left(Failure(message: "Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, List<ClinicDetailsModel>>> getAllClinicBloodTestCategory() async {
    List<ClinicDetailsModel>  allOrders= await  userDatabaseMain.getAllClinicBloodTestCategory();
    if(allOrders != null){
      print("repo : ${allOrders.length}");
      return  Right(allOrders);
    }
    else {
      print('the error in getAllClinicBloodTestCategory in AdminRepoImpl is @@@@@@@@@@@@ ////////////@@@@@@ ');
      return Left(Failure(message: "Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, List<ClinicDetailsModel>>> getAllClinicHIVTestCategory() async {
    List<ClinicDetailsModel>  allOrders= await  userDatabaseMain.getAllClinicHIVTestCategory();
    if(allOrders != null){
      print("repo : ${allOrders.length}");
      return  Right(allOrders);
    }
    else {
      print('the error in getAllClinicHIVTestCategory in AdminRepoImpl is @@@@@@@@@@@@ ////////////@@@@@@ ');
      return Left(Failure(message: "Something went wrong"));
    }
  }

 @override
  Future<Either<Failure, List<QuotesModel>>> getAllQuotes() async {
    List<QuotesModel>  allOrders= await  userDatabaseMain.getAllQuotes();
    if(allOrders != null){
      print("repo : ${allOrders.length}");
      return  Right(allOrders);
    }
    else {
      print('the error in getAllQuotes in AdminRepoImpl is @@@@@@@@@@@@ ////////////@@@@@@ ');
      return Left(Failure(message: "Something went wrong"));
    }
  }


 @override
  Future<Either<Failure, List<DonationModel>>> getDonation() async {
    List<DonationModel>  allOrders= await  userDatabaseMain.getDonation();
    if(allOrders != null){
      print("repo : ${allOrders.length}");
      return  Right(allOrders);
    }
    else {
      print('the error in getDonation in AdminRepoImpl is @@@@@@@@@@@@ ////////////@@@@@@ ');
      return Left(Failure(message: "Something went wrong"));
    }
  }


  @override
  Future<Either<Failure, QuotesModel>> getSingleQuote() async {

    QuotesModel?  singleQuote = await  userDatabaseMain.getSingleQuote();
    if(singleQuote != null){
      print("repo");
      return  Right(singleQuote);
    }
    else {
      print('the eroor in getting getSingleQuote in AdminRepoImpl is @@@@@@@@@@@@ ////////////@@@@@@ ');
      return Left(Failure(message: "Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, DonationModel>> getSingleDonation() async {

    DonationModel?  singleDonation = await  userDatabaseMain.getSingleDonation();
    if(singleDonation != null){
      print("repo");
      return  Right(singleDonation);
    }
    else {
      print('the eroor in getting getSingleDonation in AdminRepoImpl is @@@@@@@@@@@@ ////////////@@@@@@ ');
      return Left(Failure(message: "Something went wrong"));
    }
  }





}