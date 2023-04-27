import 'package:get_it/get_it.dart';
import 'package:traind_app/features/authentication/data/data%20source/register_data_source.dart';
import 'package:traind_app/features/authentication/data/repository/register_data_repository.dart';
import 'package:traind_app/features/authentication/domain/repository/register_domain_repository.dart';
import 'package:traind_app/features/authentication/domain/usecase/register_usecase.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerLazySingleton<BaseRegisterDataSource>(() => RegisterDataSource());
    sl.registerLazySingleton<BaseRegisterRepository>(() => RegisterRepository(sl()));
    sl.registerLazySingleton(() => PostRegisterDataUseCase(sl()));
  }
}
