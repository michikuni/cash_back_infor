// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/repositoryImpl/user.dart' as _i969;
import '../domain/repository/user.dart' as _i118;
import '../domain/usecase/create_user_use_case.dart' as _i641;
import '../domain/usecase/get_user_use_case.dart' as _i62;
import 'setup.dart' as _i450;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i118.IUserRepository>(
      () => _i969.UserRepositoryImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i641.CreateUserUseCase>(
      () => _i641.CreateUserUseCase(gh<_i118.IUserRepository>()),
    );
    gh.lazySingleton<_i62.GetUserUseCase>(
      () => _i62.GetUserUseCase(gh<_i118.IUserRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i450.RegisterModule {}
