
import 'package:clinics_app/core/utils/use_cases.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';
import '../repository/admin_repository_main.dart';

class DeleteDonationUseCase implements UseCase {


  AdminRepositoryMain adminRepositoryMain;

  DeleteDonationUseCase({required this.adminRepositoryMain});

  @override
  Future<Either<Failure, dynamic>> call(params) async {
    return await adminRepositoryMain.deleteDonation(params.data);
  }




}