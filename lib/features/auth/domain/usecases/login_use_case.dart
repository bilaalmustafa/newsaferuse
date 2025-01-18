
import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';
import '../../../../core/utils/use_cases.dart';
import '../entities/user_mode.dart';
import '../repositories/auth_repository_main.dart';


class LoginUseCase implements UseCase<bool, Params<UserModel>>{


  final AuthRepositoryMain authRepositoryMain;

  LoginUseCase({required this.authRepositoryMain});

  @override
  Future<Either<Failure, bool>> call(Params params)async {
    return await authRepositoryMain.loginUser(params.data);
  }

}