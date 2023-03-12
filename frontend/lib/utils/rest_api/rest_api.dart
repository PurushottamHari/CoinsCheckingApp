// flutter/dart
import 'dart:convert';
import 'package:flutter/material.dart';

// external
import 'package:http/http.dart' as http;

// local
import 'package:frontend/utils/rest_api/endpoints.dart';

class RestAPI {

  Future<List<dynamic>?> getListFromPostCall(String path, String body, {Map<String, String>? parameters}) async {
    try{
      http.Response response = await http.post(
          Uri.http(Endpoints.REST_URL, path, parameters),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
          },
          body: body,
          encoding: Encoding.getByName("utf-8")
      );
      List<dynamic> receivedJson = jsonDecode(response.body)[Endpoints.REST_API_DATA_KEY];
      return receivedJson;
    }
    catch(e){
      debugPrint("Exception caught while making Post call!: $e");
      return null;
    }
  }
  
  Future<dynamic> getObjectFromPostCall(String path, String body, {Map<String, String>? parameters}) async {
    try{
      http.Response response = await http.post(
          Uri.http(Endpoints.REST_URL, path, parameters),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
          },
          body: body,
          encoding: Encoding.getByName("utf-8")
      );
      dynamic receivedJson = jsonDecode(response.body)[Endpoints.REST_API_DATA_KEY];
      return receivedJson;
    }
    catch(e){
      debugPrint("Exception caught while making Post call!: $e");
      return null;
    }
  }
  
  Future<int?> getStatusCodeFromPostCall(String path, String body, {Map<String, String>? parameters}) async {
    try{
      http.Response response = await http.post(
          Uri.http(Endpoints.REST_URL, path, parameters),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
          },
          body: body,
          encoding: Encoding.getByName("utf-8")
      );
      debugPrint("Post request returned status code: ${response.statusCode}");
      return response.statusCode;
    }
    catch(e){
      debugPrint("Exception caught while making Post call!: $e");
      return null;
    }
  }

  Future<List<dynamic>?> getListFromGetCall(String path, {Map<String, String>? parameters}) async {
    try{
      http.Response response = await http.get(Uri.http(Endpoints.REST_URL, path, parameters));
      List<dynamic> receivedJson = jsonDecode(response.body)[Endpoints.REST_API_DATA_KEY];
      return receivedJson;
    }
    catch(e){
      debugPrint("Exception caught while making Get call!: $e");
      return null;
    }
  }

  Future<dynamic> getObjectFromGetCall(String path, {Map<String, String>? parameters}) async{
    try{
      http.Response response = await http.get(Uri.http(Endpoints.REST_URL, path, parameters));
      dynamic receivedJson = jsonDecode(response.body)[Endpoints.REST_API_DATA_KEY];
      return receivedJson;
    }
    catch(e){
      debugPrint("Exception caught while making Get call!: $e");
      return null;
    }
  }

  Future<int?> getStatusCodeFromGetCall(String path, {Map<String, String>? parameters}) async {
    try{
      http.Response response = await http.get(Uri.http(Endpoints.REST_URL, path, parameters));
      debugPrint("Get request returned status code: ${response.statusCode}");
      return response.statusCode;
    }
    catch(e){
      debugPrint("Exception caught while making Get call!: $e");
      return null;
    }
  }

}