import 'package:flutter/material.dart';

  PageRouteBuilder<dynamic> nagivatorTransitions({required Widget screen}) {
    return  PageRouteBuilder(
    pageBuilder: (c, a1, a2) => screen,
    transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
    transitionDuration: const Duration(milliseconds: 1000),
    );
  }