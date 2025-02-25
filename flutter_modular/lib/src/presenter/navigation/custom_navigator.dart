import 'package:flutter/widgets.dart';
import 'package:flutter_modular/src/presenter/modular_base.dart';

class CustomNavigator extends Navigator {
  final IModularBase modularBase;

  CustomNavigator({
    Key? key,
    required this.modularBase,
    List<NavigatorObserver> observers = const <NavigatorObserver>[],
    List<Page<dynamic>> pages = const <Page<dynamic>>[],
    bool Function(Route<dynamic>, dynamic)? onPopPage,
  }) : super(key: key, pages: pages, onPopPage: onPopPage, observers: observers);

  @override
  CustomNavigatorState createState() => CustomNavigatorState(modularBase);
}

class CustomNavigatorState extends NavigatorState {
  final IModularBase modularBase;

  CustomNavigatorState(this.modularBase);

  @override
  Future<T?> pushNamed<T extends Object?>(String routeName, {Object? arguments}) {
    return modularBase.to.pushNamed<T>(routeName, arguments: arguments);
  }

  @override
  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(String routeName, {TO? result, Object? arguments}) {
    return modularBase.to.popAndPushNamed<T, TO>(routeName, result: result, arguments: arguments);
  }

  @override
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(String newRouteName, predicate, {Object? arguments}) {
    return modularBase.to.pushNamedAndRemoveUntil<T>(newRouteName, predicate, arguments: arguments);
  }

  @override
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(String routeName, {TO? result, Object? arguments}) {
    return modularBase.to.pushReplacementNamed<T, TO>(routeName, result: result, arguments: arguments);
  }
}
