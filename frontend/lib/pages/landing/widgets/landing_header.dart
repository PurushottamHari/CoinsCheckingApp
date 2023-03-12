import 'package:flutter/material.dart';


class LandingHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      alignment: Alignment.bottomCenter,
      height: screenHeight * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          // Text(
          //   "CashRich",
          //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          // ),
        ],
      ),
    );
  }
}
