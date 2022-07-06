import 'package:flutter/material.dart';
import 'package:innovation_test/ui/ui.dart';


class AppTheme{


  static final ThemeData lightTheme = ThemeData.light().copyWith(


    //AppBarrTheme
    appBarTheme: const AppBarTheme(
          color: AppConst.primaryColor,
          elevation: 0
    ),



  );


}