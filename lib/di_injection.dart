import 'package:adviser_clean_arch/0_data/datasources/remote_datasource/advice_remote_datasource.dart';
import 'package:adviser_clean_arch/0_data/repositories/advice_repo_impl.dart';
import 'package:adviser_clean_arch/1_domain/repositories/advice_repo.dart';
import 'package:adviser_clean_arch/1_domain/usecases/advice_usecases.dart';
import 'package:adviser_clean_arch/2_application/screens/advice/cubit/advicer_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;
//sl Service Locator
// I => instance

Future<void> init() async {
  //! Core Applications Layer
  // Factory => every time it is called it will create a new instance of that class
  sl.registerFactory(() => AdvicerCubit(adviceUsecases: sl()));

//! Domain Layer
  sl.registerFactory(() => AdviceUsecases(adviceRepo: sl()));

//! Data Layer
  
sl.registerFactory<AdviceRepo>(
  () => AdviceRepoImpl(adviceRemoteDatasource: sl()),
);
  sl.registerFactory<AdviceRemoteDatasource>(
      () => AdviceRemoteDatasourceImpl(client: sl()));

//! External
  sl.registerFactory(() => http.Client());
}
