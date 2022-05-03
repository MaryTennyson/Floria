import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const LoadingView({Key? key, required this.isLoading, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? child
        : Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: Center(
              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
            ),
          );
  }
}
