import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_api/Model/create_new_user.dart';
import 'package:flutter_app_api/Model/list_of_users.dart';
import 'package:flutter_app_api/Model/single_user.dart';
import 'package:http/http.dart' as http;

class ApiFetch {
  Future userLogin(String email, String password) async {
    final loginUrl = Uri.parse('https://reqres.in/api/login');
    final response = await http.post(loginUrl, body: {
      "email": email,
      "password": password,
    });
    try {
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print("Error");
      }
    } catch (e) {
      print(e);
    }
    return json.decode(response.body);
  }


  Future<ListofUsers>  listOfUsers() async{
    
    final url=Uri.parse('https://reqres.in/api/users?page=2');
    final response=await http.get(url);
    var list=null;
   try{
     if(response.statusCode==200){
       final result=json.decode(response.body);
        list=ListofUsers.fromJson(result);
     }
   }
   catch(e){
     if(e is SocketException){
       //treat SocketException
       print("Socket exception: ${e.toString()}");
     }
     else if(e is TimeoutException){
       //treat TimeoutException
       print("Timeout exception: ${e.toString()}");
     }
     return list;
   }
   return list;

  }

  Future<SingleUser> singleUser(int id) async {
    final loginUrl = Uri.parse('https://reqres.in/api/users/$id');
    final response = await http.get(loginUrl);
    try {
      if (response.statusCode == 200) {
        print("Response + ${response.body}");
      } else {
        // ignore: avoid_print
        print("Error");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    final fetchData = json.decode(response.body) ;
    return SingleUser.fromJson(fetchData) ;
  }
  
  Future createNewUser(String name,String job) async {
    final url=Uri.parse('https://reqres.in/api/users');
    final response=await http.post(url,body: {
      json.encode({
        "name": name,
        "job": job
      })
    });
    try {
      if (response.statusCode == 201) {
        print("Response + ${response.body}");
      } else {
        // ignore: avoid_print
        print("Error");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    final fetchData = json.decode(response.body) ;
    return "Success";
  }
}
