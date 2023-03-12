class Endpoints{
  static const String REST_URL = "192.168.0.200:8080";
  static const String REST_API_DATA_KEY = "data";
  static const String LOGIN_URL = "/user/login";
  static const String SIGN_UP_URL = "/user/sign-up";
  static const String GET_USER_URL = "/user";

  static String getHostUrl(){
    return "http://$REST_URL";
  }
}