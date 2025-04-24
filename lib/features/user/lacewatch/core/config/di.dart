import 'package:clinics_app/features/user/lacewatch/core/services/auth_services.dart';
import 'package:clinics_app/features/user/lacewatch/core/services/drug_services.dart';
import 'package:clinics_app/features/user/lacewatch/core/services/query_services.dart';
import 'package:clinics_app/features/user/lacewatch/core/services/user_services.dart';
import 'package:get_it/get_it.dart';


GetIt instance = GetIt.instance;

initLocator() {
  instance.registerSingleton<AuthService>(AuthService());
  instance.registerSingleton<UserService>(UserService());
  instance.registerSingleton<DrugService>(DrugService());
  instance.registerSingleton<QueriesService>(QueriesService());
}
