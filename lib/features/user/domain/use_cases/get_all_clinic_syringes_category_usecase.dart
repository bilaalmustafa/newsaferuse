import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';
import '../../../../core/utils/use_cases.dart';
import '../repositries/user_repositories.dart';

class GetAllClinicSyringesCategoryUseCase implements UseCase {



  final UserRepositories userRepositories;

  GetAllClinicSyringesCategoryUseCase({required this.userRepositories});
  @override


  Future<Either<Failure, dynamic>> call(params) async {
    return await userRepositories.getAllClinicSyringesCategory();
  }


}