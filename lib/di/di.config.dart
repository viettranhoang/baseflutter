// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../data/feature/cache/feature_cache.dart' as _i6;
import '../data/feature/feature_repository.dart' as _i9;
import '../data/feature/remote/api/feature_api.dart' as _i7;
import '../data/feature/remote/feature_remote.dart' as _i8;
import '../ui/routes/route.dart' as _i3;
import 'di.dart' as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final singletonModule = _$SingletonModule();
    gh.singleton<_i3.AppRouter>(() => _i3.AppRouter());
    await gh.lazySingletonAsync<_i4.SharedPreferences>(
      () => singletonModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i5.Dio>(() => singletonModule.getDio());
    gh.singleton<_i6.FeatureCache>(
        () => _i6.FeatureCacheImpl(gh<_i4.SharedPreferences>()));
    gh.factory<_i7.FeatureApi>(() => _i7.FeatureApi(gh<_i5.Dio>()));
    gh.singleton<_i8.FeatureRemote>(
        () => _i8.FeatureRemoteImpl(gh<_i7.FeatureApi>()));
    gh.singleton<_i9.FeatureRepository>(
        () => _i9.FeatureRepositoryImpl(gh<_i8.FeatureRemote>()));
    return this;
  }
}

class _$SingletonModule extends _i10.SingletonModule {}
