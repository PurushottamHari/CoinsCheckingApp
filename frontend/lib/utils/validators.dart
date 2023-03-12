class TextValidations{
  static String? emailValidator(String? value){
    if(value == null || value == ""){
      return "Enter Email!";
    }
    else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
      return "Enter valid email!";
    }
    return null;
  }

  static String? passwordValidator(String? value){
    if(value == null || value == "" ){
      return "Enter Password!";
    }
    else if(value.length<8){
      return "8 or more characters please!";
    }
    else if(value.length>15){
      return "Not more than 15 characters please!";
    }
    else if(!RegExp(r'[A-Z]+').hasMatch(value)){
      return "At least one upper case character required!";
    }
    else if(!RegExp(r'[a-z]+').hasMatch(value)){
      return "At least one lower case character required!";
    }
    else if(!RegExp(r'[0-9]+').hasMatch(value)){
      return "At least one number required!";
    }
    else if(!RegExp(r'.*[^A-Za-z0-9].*').hasMatch(value)){
      return "At least one special character required!";
    }
    return null;
  }

  static String? userNameValidator(String? value){
    if(value == null || value == ""){
      return "Enter a User Name!";
    }
    else if(value.length < 4){
      return "At least 4 characters!";
    }
    else if(value.length > 15){
      return "Not more than 15 characters please!";
    }
    else if(!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)){
      return "No special characters please!";
    }
    return null;
  }

  static String? nameValidator(String? value){
    if(value == null || value == ""){
      return "Enter a Name!";
    }
    else if(value.length < 4){
      return "At least 4 characters!";
    }
    else if(value.length > 20){
      return "not more than 20 characters please!";
    }
    else if(!RegExp(r'^[a-zA-Z]+$').hasMatch(value)){
      return "Only alphabets please!";
    }
    return null;
  }


}