import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:timer/models/user_model.dart';


class UserRepository{
  String endpoint = "https://jsonplaceholder.typicode.com/users";

  Future<List<UserModel>> getUsers() async{
    var response= await http.get(Uri.parse(endpoint));

    if(response.statusCode == 200){
      final List results = jsonDecode(response.body);
      return results.map((e) => UserModel.fromJson(e)).toList();
    }else{
      throw Exception(response.reasonPhrase);
    }
  }
}