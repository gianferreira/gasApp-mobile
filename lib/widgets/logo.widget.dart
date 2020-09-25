import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Image.asset(
          "assets/images/app-logo.png",
          height: 120,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Álcool ou Gasolina",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: "Big Shoulders Display",
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
