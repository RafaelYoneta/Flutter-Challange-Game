import 'dart:convert';
import 'dart:developer';


import 'package:flutter/services.dart';
import 'package:organics/shared/shared/quiz_question.dart';
import 'package:organics/shared/shared/user_name.dart';

class HomeRepository {
  Future<UserModel> getUser() async{
    final response = await rootBundle.loadString("assets/database/user.json");
    final user = UserModel.fromJson(response);
            //log("PrimeiroUser $response");
            //log("segundoUser $user");
    return user;
  }

  Future<List<QuizModel>> getQuizzes() async{
    
    final response = await rootBundle.loadString("assets/database/quizzes.json");
        //log("Primeiro $response");
        final list = jsonDecode(response) as List;
         final quizzes =  list.map((e) => QuizModel.fromMap(e)).toList();
        //log("Segundo $list");


    return quizzes;
    


  }
}