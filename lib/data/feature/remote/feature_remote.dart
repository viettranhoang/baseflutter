import 'package:baseflutter/data/feature/remote/api/feature_api.dart';
import 'package:baseflutter/data/feature/remote/model/fetch_movies_response.dart';
import 'package:injectable/injectable.dart';

abstract class FeatureRemote {
  Future<List<Movie>> fetchMovies();
}

@Singleton(as: FeatureRemote)
class FeatureRemoteImpl extends FeatureRemote {
  final FeatureApi featureApi;

  FeatureRemoteImpl(this.featureApi);

  @override
  Future<List<Movie>> fetchMovies() async {
    final response = await featureApi.fetchMovies();
    return response.results ?? [];
  }
}
