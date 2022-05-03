import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ThemeData get themeData => Theme.of(context);
  ColorScheme get colorScheme => Theme.of(context).colorScheme;
  TextTheme get textTheme => Theme.of(context).textTheme;
  double get height => MediaQuery.of(context).size.height;
  double get width => MediaQuery.of(context).size.width;
  double get topPadding => MediaQuery.of(context).padding.top;
  double get bottomPadding => MediaQuery.of(context).padding.bottom;
  double get appBarSize => topPadding + dynamicHeight(60);
  double dynamicHeight(double value) => height / 812 * value;
  double dynamicWidth(double value) => width / 375 * value;
}

abstract class BaseStateless extends StatelessWidget {
  const BaseStateless({Key? key}) : super(key: key);
  ThemeData themeData(BuildContext context) => Theme.of(context);
  ColorScheme colorScheme(BuildContext context) => Theme.of(context).colorScheme;
  TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;
  double height(BuildContext context) => MediaQuery.of(context).size.height;
  double width(BuildContext context) => MediaQuery.of(context).size.width;
  double topPadding(BuildContext context) => MediaQuery.of(context).padding.top;
  double appBarSize(BuildContext context) => topPadding(context) + dynamicHeight(context, 60);
  double bottomPadding(BuildContext context) => MediaQuery.of(context).padding.bottom;
  double dynamicHeight(BuildContext context, double value) => height(context) / 812 * value;
  double dynamicWidth(BuildContext context, double value) => width(context) / 375 * value;
}
