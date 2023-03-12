// flutter
import 'package:flutter/material.dart';

// external
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';

// local
import 'package:frontend/pages/login/login.dart';
import 'package:frontend/pages/signup/signup.dart';

enum PageState {
  login,
  signup
}

class LandingNavigation extends StatefulWidget {

  @override
  _LandingNavigationState createState() => _LandingNavigationState();
}

class _LandingNavigationState extends State<LandingNavigation> {

  final FlipCardController _flipCardController = FlipCardController();
  PageState _pageState = PageState.login;


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: 0.6 * screenHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _landingOptionsCard(),
          const Spacer(),
          _animateSkipAndBackButton()
        ],
      ),
    );
  }

  Widget _landingOptionsCard() {
    return FlipCard(
      controller: _flipCardController,
      flipOnTouch: false,
      direction: FlipDirection.HORIZONTAL,
      front: _logInAndSignUpButtons(),
      back: _logInOrSignUpForms(),
    );
  }

  Widget _animateSkipAndBackButton() {
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight*0.1,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: _flipCardController.state == null ?
        const SizedBox.shrink() : !_flipCardController.state!.isFront ?
        const SizedBox.shrink() : BackButton(onPressed: () => {_flipCardController.toggleCard(), setState(() {})}),
      ),
    );
  }

  Widget _logInAndSignUpButtons() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      padding: EdgeInsets.only(left: screenWidth*0.02, right: screenWidth*0.02),
      key: const Key("logInAndSignUpButtons"),
      height: screenHeight * 0.5,
      width: screenWidth * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _getQuote(),
          _logInOrSignUpButton("Sign up", PageState.signup),
          _logInOrSignUpButton("Log in", PageState.login),
        ],
      ),
    );
  }

  Widget _getQuote() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.3,
      width: screenWidth * 0.9,
      child: const Center(
        child: Text(
          " \"Cash Rich.\"",
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.w300, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }

  Widget _logInOrSignUpButton(String label, PageState goToPageState) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(screenWidth*0.8, screenHeight * 0.05),
            elevation: 0.5
        ),
        onPressed: () => {_pageState = goToPageState, _flipCardController.toggleCard(), setState(() {})},
        child: Text(label, style: const TextStyle(color: Colors.black))
    );
  }

  Widget _logInOrSignUpForms() {
    if(_pageState == PageState.login) {
      return Login();
    } else if(_pageState == PageState.signup){
      return SignUp();
    }
    return const CircularProgressIndicator();
  }
}