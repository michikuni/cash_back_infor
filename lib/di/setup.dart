import 'package:cash_back_infor/di/setup.config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: 'https://6965eb73f6de16bde44b80bf.mockapi.io',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );
}
// void setup(){
//   getIt.registerLazySingleton<Dio>(() => Dio(BaseOptions(baseUrl: 'https://6965eb73f6de16bde44b80bf.mockapi.io')));
//   getIt.registerLazySingleton<IUserRepository>(() => UserRepositoryImpl(getIt()));
//   getIt.registerLazySingleton<GetUserUseCase>(() => GetUserUseCase(getIt()));
//   getIt.registerLazySingleton<CreateUserUseCase>(() => CreateUserUseCase(getIt()));
// }