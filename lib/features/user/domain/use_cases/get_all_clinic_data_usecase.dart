import 'package:clinics_app/core/utils/failure.dart';
import 'package:clinics_app/core/utils/use_cases.dart';
import 'package:clinics_app/features/user/domain/repositries/user_repositories.dart';
import 'package:dartz/dartz.dart';

class GetAllClinicDataUseCase implements UseCase {


  final UserRepositories userRepositories;

  GetAllClinicDataUseCase({required this.userRepositories});
  @override


  Future<Either<Failure, dynamic>> call(params) async {
    return await userRepositories.getAllClinicDetails();
  }



}