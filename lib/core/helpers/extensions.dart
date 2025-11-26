import 'package:flutter/widgets.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(
    final String routeName, {
    final Object? arguments,
  }) => Navigator.of(this).pushNamed(routeName, arguments: arguments);

  Future<dynamic> pushReplacementNamed(
    final String routeName, {
    final Object? arguments,
  }) =>
      Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);

  Future<dynamic> pushNamedAndRemoveUntil(
    final String routeName, {
    required final RoutePredicate predicate,
    final Object? arguments,
  }) => Navigator.of(
    this,
  ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);

  void pop() => Navigator.of(this).pop();
}

extension StringExtension on String? {
  bool isNullAndEmpty() => this == null || this == '';
}

extension ListExtension<T> on List<T>? {
  bool isNullAndEmpty() => this == null || this == [];
}
