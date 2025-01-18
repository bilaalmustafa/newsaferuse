import 'package:clinics_app/features/admin/data/data_repository/admin_repository_impl.dart';
import 'package:clinics_app/features/admin/data/data_source/admin_database_impl.dart';
import 'package:clinics_app/features/admin/data/data_source/admin_database_main.dart';
import 'package:clinics_app/features/admin/domain/repository/admin_repository_main.dart';
import 'package:clinics_app/features/admin/domain/use_cases/add_new_clinic_usecase.dart';
import 'package:clinics_app/features/admin/domain/use_cases/add_new_donation_usecase.dart';
import 'package:clinics_app/features/admin/domain/use_cases/add_new_quote_usecase.dart';
import 'package:clinics_app/features/admin/domain/use_cases/delete_donation_usecase.dart';
import 'package:clinics_app/features/admin/presentation/manager/admin_controller.dart';
import 'package:clinics_app/features/auth/data/data_repository/auth_repository_impl.dart';
import 'package:clinics_app/features/auth/data/data_source/auth_database.dart';
import 'package:clinics_app/features/auth/data/data_source/auth_database_impl.dart';
import 'package:clinics_app/features/auth/domain/repositories/auth_repository_main.dart';
import 'package:clinics_app/features/auth/presentatation/manager/auth_controller.dart';
import 'package:clinics_app/features/user/data/data_repository/user_repo_impl.dart';
import 'package:clinics_app/features/user/data/data_source/user_database_impl.dart';
import 'package:clinics_app/features/user/data/data_source/user_database_main.dart';
import 'package:clinics_app/features/user/domain/repositries/user_repositories.dart';
import 'package:clinics_app/features/user/domain/use_cases/get_all_clinic_data_usecase.dart';
import 'package:clinics_app/features/user/domain/use_cases/get_all_clinic_syringes_category_usecase.dart';
import 'package:clinics_app/features/user/domain/use_cases/get_client_safer_smoking_category_usecase.dart';
import 'package:clinics_app/features/user/presentation/manager/user_controller.dart';
import 'package:get_it/get_it.dart';
import '../../features/admin/domain/use_cases/delete_clinic_usecase.dart';
import '../../features/admin/domain/use_cases/delete_quote_usecase.dart';
import '../../features/admin/domain/use_cases/update_clinic_usecase.dart';
import '../../features/auth/domain/usecases/forgot_password_use_case.dart';
import '../../features/auth/domain/usecases/get_user_usecase.dart';
import '../../features/auth/domain/usecases/login_use_case.dart';
import '../../features/auth/domain/usecases/register_use_case.dart';
import '../../features/auth/domain/usecases/update_user_picture_usecase.dart';
import '../../features/user/domain/use_cases/get_all_clinic_blood_test_category_usecase.dart';
import '../../features/user/domain/use_cases/get_all_clinic_cbr_ category_usecase.dart';
import '../../features/user/domain/use_cases/get_all_clinic_hiv_test_category_usecase.dart';
import '../../features/user/domain/use_cases/get_all_clinic_medical_care_usecase.dart';
import '../../features/user/domain/use_cases/get_all_quotes_usecase.dart';
import '../../features/user/domain/use_cases/get_donation_usecase.dart';
import '../../features/user/domain/use_cases/get_signle_quote_usecase.dart';
import '../../features/user/domain/use_cases/get_single_donation_usecase.dart';
import '../controllers/home_controllers.dart';

final sl = GetIt.instance;

Future<void> init() async {

  ///!  All Controller///////////////////////////////////////
  sl.registerLazySingleton(() => HomeController());


  ///UserController
  sl.registerLazySingleton(() => UserController(
      getAllClinicDataUseCase: sl(),
    getAllClinicSyringesCategoryUseCase: sl(),
    getClientSaferSmokingCategoryUseCase: sl(),
    getAllClinicMedicalCareUseCase: sl(),
    getAllClinicCbrCategoryUseCase: sl(),
    getAllClinicBloodTestCategoryUseCase: sl(),
    getAllClinicHivTestCategoryUseCase: sl(),
    getAllQuotesUseCase: sl(),
    getDonationUseCase: sl(),
    getSingleQuoteUseCase: sl(), getSingleDonationUseCase: sl(),



  ));


  ///Admin Controller

  sl.registerLazySingleton(()=> AdminController(
      addNewClinicUseCase: sl(),
    addNewQuoteUseCase: sl(),
    deleteClinicUseCase: sl(),
    updateClinicUseCase: sl(),
    addNewDonationUseCase: sl(),
    deleteQuoteUseCase: sl(),
    deleteDonationUseCase: sl(),

  ));


/// AuthController

  sl.registerLazySingleton(()=> AuthController(
      registerUserUseCase: sl(),
    loginUseCase: sl(),
    forgotPasswordUseCase: sl(),
    getUserUseCase: sl(),
    updateUserPictureUseCase: sl(),


  ));




  ///UseCases ///////////////////////////////////////////////////////////////////////////

  sl.registerLazySingleton(() => GetAllClinicDataUseCase(userRepositories: sl()));
  sl.registerLazySingleton(() => GetAllClinicSyringesCategoryUseCase(userRepositories: sl()));
  sl.registerLazySingleton(() => GetClientSaferSmokingCategoryUseCase(userRepositories: sl()));
  sl.registerLazySingleton(() => GetAllClinicMedicalCareUseCase(userRepositories: sl()));
  sl.registerLazySingleton(() => GetAllClinicCbrCategoryUseCase(userRepositories: sl()));
  sl.registerLazySingleton(() => GetAllClinicBloodTestCategoryUseCase(userRepositories: sl()));
  sl.registerLazySingleton(() => GetAllClinicHivTestCategoryUseCase(userRepositories: sl()));
  sl.registerLazySingleton(() => GetAllQuotesUseCase(userRepositories: sl()));
  sl.registerLazySingleton(() => GetDonationUseCase(userRepositories: sl()));
  sl.registerLazySingleton(() => GetSingleQuoteUseCase(userRepositories: sl()));
  sl.registerLazySingleton(() => GetSingleDonationUseCase(userRepositories: sl()));

  ///AdminUseCase
  sl.registerLazySingleton(()=> AddNewClinicUseCase(adminRepositoryMain: sl()));
  sl.registerLazySingleton(()=> AddNewQuoteUseCase(adminRepositoryMain: sl()));
  sl.registerLazySingleton(()=> DeleteClinicUseCase(adminRepositoryMain: sl()));
  sl.registerLazySingleton(()=> UpdateClinicUseCase(adminRepositoryMain: sl()));
  sl.registerLazySingleton(()=> AddNewDonationUseCase(adminRepositoryMain: sl()));
  sl.registerLazySingleton(()=> DeleteQuoteUseCase(adminRepositoryMain: sl()));
  sl.registerLazySingleton(()=> DeleteDonationUseCase(adminRepositoryMain: sl()));



  ///Auth Use Cases

  sl.registerLazySingleton(()=> RegisterUserUseCase(authRepositoryMain: sl()));
  sl.registerLazySingleton(()=> LoginUseCase(authRepositoryMain: sl()));
  sl.registerLazySingleton(()=> ForgotPasswordUseCase(authRepositoryMain: sl()));
  sl.registerLazySingleton(()=> GetUserUseCase(authRepositoryMain: sl()));
  sl.registerLazySingleton(()=> UpdateUserPictureUseCase(authRepositoryMain: sl()));






  ///Repo //////////////////////////////////////////////////////////////////////////////

  sl.registerLazySingleton<UserRepositories>(
          () => UserRepoImpl(userDatabaseMain: sl()));

  sl.registerLazySingleton<AdminRepositoryMain>(
          () => AdminRepositoryImpl(adminDatabaseMain: sl()));

  sl.registerLazySingleton<AuthRepositoryMain>(
          () => AuthRepositoryImpl(databaseMain: sl()));




  ///Database////////////////////////////////////////////////////////////////
  sl.registerLazySingleton<UserDatabaseMain>(() => UserDatabaseImpl());
  sl.registerLazySingleton<AdminDatabaseMain>(() => AdminDatabaseImpl());
  sl.registerLazySingleton<AuthDatabaseMain>(() => AuthDatabaseImpl());






  ///Initials/////////////////////////////////////////////////////////

  sl<UserController>().loadUserData();
  // sl<HomeController>().locationPermission(context);
  // sl<AuthController>().getAllUsers();






}
