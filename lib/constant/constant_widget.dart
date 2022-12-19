import 'package:flutter/material.dart';

class CustomConstantWidget {
  static Widget indicator() {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }

  static Widget verticalDivider() {
    return const VerticalDivider(
      color: Colors.transparent,
      width: 5,
    );
  }
}
