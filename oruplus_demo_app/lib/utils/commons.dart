import 'package:flutter/material.dart';

PageRouteBuilder pageNavigationAnimation(
  BuildContext context, {
  required Widget navigateWidget,
  Offset? begin,
  Offset? end,
  Curve curve = Curves.fastEaseInToSlowEaseOut,
}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => navigateWidget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final position = Tween<Offset>(
        begin: begin ?? const Offset(1, 0),
        end: end ?? Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: curve,
      ));

      return SlideTransition(
        position: position,
        child: child,
      );
    },
  );
}

bool canPopPage(BuildContext context) =>
    ModalRoute.of(context)?.canPop ?? false;
