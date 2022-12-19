import 'package:flutter/material.dart';

class NoInterNetWidget extends StatelessWidget {
  const NoInterNetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Text(
            "Can\'t connect..check internet",
            style: TextStyle(
              fontSize: 22,
              color: Colors.grey,
            ),
          ),
          Image.asset(
            "asset/no_internet.png",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
