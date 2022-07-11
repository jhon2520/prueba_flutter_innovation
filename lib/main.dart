import 'package:flutter/material.dart';
import 'package:innovation_test/providers/product_provider.dart';
import 'package:innovation_test/router/app_router.dart';
import 'package:innovation_test/screens/screens.dart';
import 'package:innovation_test/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Innovation App",
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      home: const ProductScreen(),
      onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(settings),
      theme: AppTheme.lightTheme,
    );
  }
}
