
import 'package:flutter/cupertino.dart';

class LandingFiller extends StatelessWidget {
  
@override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
  
    return Container(
      height: screenHeight*0.3,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset("assets/logo/coin_rich_logo.png",)
      ),
    );
  }
  
}