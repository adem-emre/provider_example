
import 'dart:convert';

import 'package:provider_example/constants/app_constant.dart';
import 'package:provider_example/features/home/joke_model.dart';
import 'package:http/http.dart' as http;

class JokeService{

  Future<List<Jokes>?> fetchJokes()async{
    
    http.Response response = await http.get(Uri.parse(AppConstant.API_BASE_URL+"joke/Programming?type=single&amount=10"));
    if(response.statusCode == 200){
      List<Jokes>? jokeList = JokeResponse.fromJson(jsonDecode(response.body)).jokes;
      return jokeList;

    }else{
      return null;
    }
    
    
  }
}