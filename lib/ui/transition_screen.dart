import 'package:flutter/material.dart';

  PageRouteBuilder<dynamic> nagivatorTransitions({required Widget screen}) {
    return PageRouteBuilder(
              pageBuilder: (c, a1, a2) => screen,
              transitionsBuilder: (c, anim, a2, child) => SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1,0), 
                  end: Offset.zero).animate(anim), 
                child: child),
              transitionDuration: Duration(milliseconds: 500),
              );
  }