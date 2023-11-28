import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api{

  final String BASE_URL ='https://api.escuelajs.co/api/v1';

  Future<dynamic> get({required String url}) async{
    http.Response response = await http.get(Uri.parse("$BASE_URL/$url"));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      throw Exception(
          'There is a problem in status code ${response.statusCode}');
    }
  }
  Future<dynamic> post({required String url,
    @required dynamic body,
    @required String? token
  })async{
    Map<String,String> headers ={};
    if(token != null){
      headers.addAll({
        'Authorization':'Bearer $token'});
    }

    http.Response response = await http.post(
      Uri.parse(url),
    body: jsonEncode(body),
      headers: headers
    );
    return jsonDecode(response.body);
  }
}