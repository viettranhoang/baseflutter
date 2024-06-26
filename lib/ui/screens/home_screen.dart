
import 'package:auto_route/auto_route.dart';
import 'package:baseflutter/common/logger.dart';
import 'package:baseflutter/data/feature/feature_repository.dart';
import 'package:baseflutter/di/di.dart';
import 'package:baseflutter/ui/utils/build_context_ext.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  fetch() async {
    final repository = getIt<FeatureRepository>();

    final movies = await repository.fetchMovies();
    final value = movies.asValue?.value;
    logger.e(value?.first.title);
  }

  @override
  Widget build(BuildContext context) {
    fetch();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.primary,
        title: Text(context.translations.home_page),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              context.translations.main_pushed_button,
            ),
            Text(
              '$_counter',
              style: context.typography.mediumSemi
                  .copyWith(color: context.colors.primary),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
