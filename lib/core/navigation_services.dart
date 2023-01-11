import 'package:flutter/material.dart';

class NavigationServices {
  void goto({
    required BuildContext context,
    required Widget nextScreen,
    bool replace = false,
    bool clean = false,
  }) {
    if (replace) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => nextScreen),
      );
    } else if (clean) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => nextScreen,
        ),
        (route) => false,
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => nextScreen),
      );
    }
  }
}
