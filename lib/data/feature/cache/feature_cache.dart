import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FeatureCache {
  String getString();

  saveString(String s);
}

@Singleton(as: FeatureCache)
class FeatureCacheImpl extends FeatureCache {
  static const _stringKey = "STRING_KEY";

  final SharedPreferences _sharedPreferences;

  FeatureCacheImpl(this._sharedPreferences);

  @override
  String getString() {
    return _sharedPreferences.getString(_stringKey) ?? "";
  }

  @override
  saveString(String s) {
    _sharedPreferences.setString(_stringKey, s);
  }
}
