import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/home_page.dart';
import 'pages/item_page.dart';
import 'models/item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/item',
        builder: (context, state) {
          final item = state.extra;

          if (item == null || item is! Item) {
            return const Scaffold(
              body: Center(
                child: Text('Data tidak ditemukan'),
              ),
            );
          }

          return ItemPage(itemArgs: item);
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter navigate: Rojalingga - 244107060070',
    );
  }
}