import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Transform.scale(
            scale: 0.8, child: const CircularProgressIndicator()));
  }
}
