import 'package:clinics_app/core/utils/use_cases.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';
import '../repositries/user_repositories.dart';

class GetClientSaferSmokingCategoryUseCase implements UseCase {


  final UserRepositories userRepositories;

  GetClientSaferSmokingCategoryUseCase({required this.userRepositories});
  @override


  Future<Either<Failure, dynamic>> call(params) async {
    return await userRepositories.getAllClinicSaferSmokingKitsCategory();
  }


}