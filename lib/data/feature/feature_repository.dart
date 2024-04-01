import 'package:async/async.dart';
import 'package:baseflutter/data/feature/remote/feature_remote.dart';
import 'package:baseflutter/data/feature/remote/model/fetch_movies_response.dart';
import 'package:injectable/injectable.dart';

abstract class FeatureRepository {
  Future<Result<List<Movie>>> fetchMovies();
}

@Singleton(as: FeatureRepository)
class FeatureRepositoryImpl extends FeatureRepository {
  final FeatureRemote featureRemote;

  FeatureRepositoryImpl(this.featureRemote);

  @override
  Future<Result<List<Movie>>> fetchMovies() async {
    try {
      final movies = await featureRemote.fetchMovies();
      return Result.value(movies);
    } catch (e) {
      return Result.error(e);
    }
  }
}
