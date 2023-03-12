// flutter
import 'package:frontend/common_widgets/loading_dialog.dart';
import 'package:frontend/models/user_dto.dart';
import 'package:frontend/pages/home/home.dart';
import 'package:flutter/material.dart';

// local
import 'package:frontend/common_widgets/input_text_field.dart';
import 'package:frontend/utils/user/user_utils.dart';
import 'package:frontend/utils/validators.dart';


class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}


class _SignUpState extends State<SignUp> {

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      padding: EdgeInsets.only(left: screenWidth*0.02, right: screenWidth*0.02),
      key: const Key("SignUp"),
      height: screenHeight * 0.5,
      width: screenWidth * 0.9,
      child: Form(
        key: _signUpFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InputTextField(controller: _firstNameController, validator: TextValidations.nameValidator, label: "First Name"),
            InputTextField(controller: _lastNameController, validator: TextValidations.nameValidator, label: "Last Name"),
            InputTextField(controller: _emailController, validator: TextValidations.emailValidator, label: "Email"),
            InputTextField(controller: _usernameController, validator: TextValidations.userNameValidator, label: "Username"),
            InputTextField(controller: _passwordController, validator: TextValidations.passwordValidator, label: "Password", obscureText: true),
            _signUpButton()
          ],
        ),
      ),
    );
  }

  TextButton _signUpButton() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return TextButton(
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.primary,
          fixedSize: Size(screenWidth*0.3, screenHeight * 0.05),
        ),
        onPressed: _handleSignUp,
        child: const Text("Sign Up", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900))
    );
  }

  void _handleSignUp() async {
    if(!_signUpFormKey.currentState!.validate()){
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

    UserDTO userDTO = UserDTO(
        firstName: _firstNameController.value.text,
        lastName: _lastNameController.value.text,
        email: _emailController.value.text,
        userName: _usernameController.value.text,
        password: _passwordController.value.text
    );

    bool signUpSuccess = await UserUtils.signUpUser(userDTO);

    if(signUpSuccess){
      status.add(1);
    }
    else{
      status.add(2);
    }

  }

}