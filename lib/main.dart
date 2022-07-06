import 'package:flutter/material.dart';
import 'package:innovation_test/router/app_router.dart';
import 'package:innovation_test/screens/screens.dart';
import 'package:innovation_test/theme/app_theme.dart';


void main(){
  runApp(MyApp());
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
      home: ProductScreen(),
      onGenerateRoute: (settings)=> AppRoutes.onGenerateRoute(settings),
      theme: AppTheme.lightTheme,
    );
  }
}


