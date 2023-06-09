// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:murasame_playground/ec_app/ec_app.dart';
import 'package:murasame_playground/sns_app/sns_app.dart';
import 'package:murasame_playground/todo_app/todo_app.dart';
import 'home_page.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  late final SharedPreferences sharedPreferences;
  await Future.wait([
    Future(() async {
      sharedPreferences = await SharedPreferences.getInstance();
    })
  ]);

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences)
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Murasame Playground',
      theme: ThemeData(
        primaryColor: const Color(0xFFFF7939),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFFF7939),
        ),
      ),
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'todo_app',
          builder: (context, state) => const TodoListPage(),
        ),
        GoRoute(
          path: 'ec_app',
          builder: (context, state) => const EcAppHomePage(),
          routes: [
            GoRoute(
              path: 'products/:id',
              builder: (context, state) =>
                  ProductDetailPage(productId: state.params['id']!),
            ),
          ],
        ),
        GoRoute(
          path: 'sns_app',
          builder: (context, state) => const SnsAppHomePage(),
        ),
      ],
    ),
  ],
);
