import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';
import '../entities/user_mode.dart';

abstract class AuthRepositoryMain {


  Future<Either<Failure,bool>> registerUser(UserModel userModel);
  Future<Either<Failure,bool>> loginUser(UserModel userModel);
  Future<Either<Failure,bool>> forgotPassword(UserModel userModel);
  Future<Either<Failure,UserModel>> getUser();
  Future<Either<Failure,bool>> updateUserPicture(UserModel userModel);


}