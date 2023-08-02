import 'dart:ui';

import 'package:flutter/material.dart';

class HeroDialog extends PageRoute {
  final WidgetBuilder builder;
  final bool? isDismissible;
  HeroDialog({required this.builder, this.isDismissible});

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => isDismissible ?? true;

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black.withOpacity(.4);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 400);

  @override
  String get barrierLabel => 'popup';

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return builder(context);
  }
}

class HeroTween extends RectTween {
  HeroTween({required Rect? begin, required Rect? end}) : super(begin: begin, end: end);

  @override
  Rect lerp(double t) {
    final curveValue = Curves.easeInBack.transform(t);
    return Rect.fromLTRB(
      lerpDouble(begin!.left, end!.left, curveValue)!,
      lerpDouble(begin!.top, end!.top, curveValue)!,
      lerpDouble(begin!.right, end!.right, curveValue)!,
      lerpDouble(begin!.bottom, end!.bottom, curveValue)!,
    );
  }
}




class TransparentRoute extends PageRoute<void> {
  TransparentRoute({
    required this.builder,
    RouteSettings? settings,
  })  : super(settings: settings, fullscreenDialog: false);

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 350);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: result,
      ),
    );
  }
}