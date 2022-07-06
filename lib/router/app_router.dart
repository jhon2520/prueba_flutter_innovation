import 'package:flutter/material.dart';
import 'package:innovation_test/screens/screens.dart';

class AppRoutes{

  static const initialRoute = "home";

    static Map<String, Widget Function(BuildContext)> routes = {
          "home"      :(BuildContext context)=> const HomeScreen(),
          "products" :(BuildContext context)=> const ProductScreen(),
          "list" :(BuildContext context)=> const ListScreen(),
    };



    static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    return  MaterialPageRoute(builder: (context) => const HomeScreen());
  }

}