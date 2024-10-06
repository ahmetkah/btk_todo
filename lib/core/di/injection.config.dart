// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:btk_todo/auth/login/bloc/login_bloc.dart' as _i757;
import 'package:btk_todo/auth/signup/bloc/signup_bloc.dart' as _i303;
import 'package:btk_todo/core/di/register_module.dart' as _i905;
import 'package:btk_todo/data/data.dart' as _i1056;
import 'package:btk_todo/domain/auth_repository.dart' as _i116;
import 'package:btk_todo/domain/domain.dart' as _i919;
import 'package:btk_todo/domain/storage_repository.dart' as _i440;
import 'package:btk_todo/domain/todo_repository.dart' as _i813;
import 'package:btk_todo/todo/cubit/todo_cubit.dart' as _i44;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.unsecuredStorage,
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i1056.TodoClient>(() => registerModule.authClient);
    gh.singleton<_i1056.AuthClient>(() => registerModule.tokenClient);
    gh.singleton<_i558.FlutterSecureStorage>(
        () => registerModule.securedStorage);
    gh.factory<_i440.IStorageRepository>(() => _i440.StorageRepository(
          securedStorage: gh<_i558.FlutterSecureStorage>(),
          unsecuredStorage: gh<_i460.SharedPreferences>(),
        ));
    gh.singleton<_i813.ITodoRepository>(() => _i813.TodoRepository(
          todoClient: gh<_i1056.TodoClient>(),
          storageRepository: gh<_i919.IStorageRepository>(),
        ));
    gh.factory<_i44.TodoCubit>(
        () => _i44.TodoCubit(todoRepository: gh<_i919.ITodoRepository>()));
    gh.singleton<_i116.IAuthRepository>(() => _i116.AuthRepository(
          authClient: gh<_i1056.AuthClient>(),
          storageRepository: gh<_i919.IStorageRepository>(),
        ));
    gh.factory<_i303.SignupBloc>(
        () => _i303.SignupBloc(authRepository: gh<_i919.IAuthRepository>()));
    gh.factory<_i757.LoginBloc>(
        () => _i757.LoginBloc(authRepository: gh<_i919.IAuthRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i905.RegisterModule {}
