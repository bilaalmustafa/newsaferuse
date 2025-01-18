import 'package:clinics_app/features/auth/domain/repositories/auth_repository_main.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';
import '../../../../core/utils/use_cases.dart';


class ForgotPasswordUseCase implements UseCase{

  final AuthRepositoryMain authRepositoryMain;

  ForgotPasswordUseCase({required this.authRepositoryMain});

  @override
  Future<Either<Failure, dynamic>> call(params) async{
    return await authRepositoryMain.forgotPassword(params.data);

  }



}