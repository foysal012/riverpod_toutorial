import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_toutorial/day_9/user_model.dart';
import 'package:http/http.dart' as http;

final postProvider = FutureProvider<List<UserModel>>((ref) async{
  try{
    final response  = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json'
        }
    );
    debugPrint('999${response.statusCode}');
    if(response.statusCode == 200){
      final List<dynamic> data = jsonDecode(response.body);
      List<UserModel> demoList =  data.map((e) => UserModel.fromJson(e)).toList();
      return demoList;
    } else {
      throw 'Something went wrong';
    }
  } on SocketException{
    throw 'No Internet';
  } catch (e){
    rethrow ;
  }
});