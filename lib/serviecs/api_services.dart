
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiServices{

  Future<dynamic> get({required String url,@required String? token}) async{
    http.Response response= await http.get(Uri.parse(url));
    Map<String,String> headers={};
    if(token!=null)
    {
      headers.addAll({'Authorization':'Bearer $token'});
    }
    if (response.statusCode==200) {
      print('From jason ${jsonDecode(response.body)}');
      return jsonDecode(response.body);

    }
    else{
      throw Exception('there is an error ${response.statusCode}');
    }

  }

  Future<dynamic> post({required String url,@required dynamic body,@required String? token}) async{
    Map<String,String> headers={};
    if(token!=null)
      {
          headers.addAll({'Authorization':'Bearer $token'});
      }
    http.Response response=await http.post(Uri.parse(url),
        body: body,
        headers: headers,
    );
    if (response.statusCode==200) {
      return jsonDecode(response.body);
    }
    else{
      throw Exception("there's problem in status code ${response.statusCode} with body ${jsonDecode(response.body)}" );
    }
  }

  Future<dynamic> put({required String url,@required dynamic body,@required String? token}) async{
    Map<String,String> headers={};
    headers.addAll({'Content-Type':'application/x-www-form-urlencoded'});
    if(token!=null)
    {
      headers.addAll({'Authorization':'Bearer $token'});
    }
    print('url = $url  body= $body  token= $token');
    http.Response response=await http.post(Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode==200) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    }
    else{
      throw Exception("there's problem in status code ${response.statusCode} with body ${jsonDecode(response.body)}" );
    }
  }
}