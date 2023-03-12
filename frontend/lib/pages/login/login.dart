// flutter
import 'package:frontend/common_widgets/loading_dialog.dart';
import 'package:frontend/database/database_service.dart';
import 'package:frontend/models/user_login_dto.dart';
import 'package:frontend/pages/home/home.dart';
import 'package:flutter/material.dart';

// local
import 'package:frontend/common_widgets/input_text_field.dart';
import 'package:frontend/utils/user/user_utils.dart';
import 'package:frontend/utils/validators.dart';


class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  // Login Controllers
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      padding: EdgeInsets.only(left: screenWidth*0.02, right: screenWidth*0.02),
      key: const Key("LogIn"),
      height: screenHeight * 0.30,
      width: screenWidth * 0.9,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InputTextField(controller: _usernameController, validator: TextValidations.userNameValidator, label: "Username"),
            InputTextField(controller: _passwordController, validator: TextValidations.passwordValidator, label: "Password", obscureText: true),
            _logInButton()
          ],
        ),
      ),
    );
  }

  TextButton _logInButton() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return TextButton(
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.primary,
          fixedSize: Size(screenWidth*0.3, screenHeight * 0.05),
        ),
        onPressed: _handleLogIn,
        child: const Text("Log in", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900))
    );
  }

  void _handleLogIn() async {
    if(!_loginFormKey.currentState!.validate()){
      return;
    }
    Set<int> status = {0};
    LoadingBar.showLoadingDialog(
        parentContext: context,
        loadingText: "Logging in....",
        statusFunction: (){
          return status.last;
        },
        onComplete: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Home()));
        },
        onError: (){
          Navigator.of(context).pop();
        },
        onTimeout: (){
          Navigator.of(context).pop();
        });

    UserLoginDTO userLoginDTO = UserLoginDTO(userName: _usernameController.value.text, password: _passwordController.value.text);

    bool loginSuccess = await UserUtils.loginUser(userLoginDTO);
    if(loginSuccess){
      status.add(1);
    }
    else{
      status.add(2);
    }
  }

}