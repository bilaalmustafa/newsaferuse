import 'package:clinics_app/features/auth/domain/repositories/auth_repository_main.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';
import '../../../../core/utils/use_cases.dart';
import '../entities/user_mode.dart';


class GetUserUseCase implements UseCase<UserModel, Params<String>>{

  final AuthRepositoryMain authRepositoryMain;

  GetUserUseCase({required this.authRepositoryMain});
  @override
  Future<Either<Failure, UserModel>> call(params) async {
    return await authRepositoryMain.getUser();
  }



}