
import 'package:flutter/material.dart';
import 'package:frontend/models/user_dto.dart';
import 'package:frontend/utils/user/user_utils.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Column(
              children: [
                SizedBox(height: screenHeight*0.07,),
                Text("User Profile", style: TextStyle(fontSize: 30),),
                SizedBox(height: screenHeight*0.03,),
                Container(
                  height: screenHeight*0.5,
                  width: screenWidth*0.9,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                      child: _userProfile(context)
                  )
                ),
                SizedBox(height: screenHeight*0.05,),
                _checkCoinsButton(context)
              ],
            ),
          ),
        )
    );
  }

  Widget _userProfile(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder<UserDTO?>(
        future: UserUtils.getUser(),
        builder: (BuildContext context, AsyncSnapshot<UserDTO?> userDto){
          switch(userDto.connectionState){
            case ConnectionState.done:
              bool received = userDto.data != null;
              return received
                  ? _userProfileWidget(context, userDto.data!)
                  : Text("Some Error!", style: TextStyle(fontSize: 25),);
            default:
              return SizedBox(
                  height: screenHeight*0.07,
                  width: screenWidth*0.15,
                  child: CircularProgressIndicator()
              );
          }
        }
    );
  }

  Widget _userProfileWidget(BuildContext context, UserDTO userDTO){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(height: screenHeight*0.02),
        Icon(Icons.verified_user, size: 100, color: Colors.yellow,),
        SizedBox(height: screenHeight*0.05,),
        Text("UserName: ${userDTO.userName}", style: TextStyle(fontSize: 28),),
        SizedBox(height: screenHeight*0.02,),
        Text("First Name: ${userDTO.firstName}", style: TextStyle(fontSize: 28),),
        SizedBox(height: screenHeight*0.02,),
        Text("Last Name: ${userDTO.lastName}", style: TextStyle(fontSize: 28),),
        SizedBox(height: screenHeight*0.02,),
        Text("( ${userDTO.email} )"),
      ],
    );

  }

  Widget _checkCoinsButton(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return MaterialButton(
        onPressed: (){

        },
        child: const Text("Check Coins"),
        color: Colors.yellow,
        textColor: Colors.black,
        height: screenHeight*0.06,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    );
  }

}