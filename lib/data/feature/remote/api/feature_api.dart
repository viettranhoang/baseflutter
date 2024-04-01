import 'package:baseflutter/data/feature/remote/model/fetch_movies_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'feature_api.g.dart';

@RestApi()
@injectable
abstract class FeatureApi {
  @factoryMethod
  factory FeatureApi(Dio dio) = _FeatureApi;

  @GET("discover/movie")
  Future<FetchMovieResponse> fetchMovies();
}
