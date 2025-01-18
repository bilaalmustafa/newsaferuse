import 'package:clinics_app/core/utils/use_cases.dart';
import 'package:clinics_app/features/admin/domain/repository/admin_repository_main.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';

class AddNewQuoteUseCase implements UseCase{

  AdminRepositoryMain adminRepositoryMain;

  AddNewQuoteUseCase({required this.adminRepositoryMain});

  @override
  Future<Either<Failure, dynamic>> call(params) async {
    return await adminRepositoryMain.addNewQuote(params.data);
  }




}