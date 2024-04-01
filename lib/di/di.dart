import 'package:baseflutter/common/logger.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  await getIt.init();
}

@module
abstract class SingletonModule {
  @preResolve
  @lazySingleton
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @lazySingleton
  Dio getDio() => Dio(dioBaseOptions)
    ..options.headers['Authorization'] = 'Bearer $accessToken'
    ..interceptors.add(prettyDioLogger);
}

final dioBaseOptions = BaseOptions(
  baseUrl: baseUrl,
  connectTimeout: const Duration(seconds: 10),
  receiveTimeout: const Duration(seconds: 10),
  sendTimeout: const Duration(seconds: 10),
);

const baseUrl = 'https://api.themoviedb.org/3/';
const accessToken =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwN2Q1MTYzYjhiMjYxNWUxZWUyZmMxZjE1M2E1ZmFkNyIsInN1YiI6IjVkNzA2YjVkZTIyZDI4MDAwZmI1ZDgwOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.I7dP4Z8OEMcDTcNpElV0RMWDJqKjW-Ykpgz9nUiaUeI';
