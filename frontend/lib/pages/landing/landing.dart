// flutter
import 'package:flutter/material.dart';

// local
import 'package:frontend/pages/landing/widgets/landing_header.dart';
import 'package:frontend/pages/landing/widgets/landing_navigation.dart';
import 'package:frontend/pages/landing/widgets/landing_filler.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _landingHome(context);
  }

  Scaffold _landingHome(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Column(
              children: [
                LandingHeader(),
                LandingFiller(),
                LandingNavigation()
              ],
            ),
          ),
        )
    );
  }
}