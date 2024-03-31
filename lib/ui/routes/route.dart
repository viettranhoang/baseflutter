import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import 'route.gr.dart';

@singleton
@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends $AppRouter {

  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(page: HomeRoute.page, initial: true),
    ];
  }

}
