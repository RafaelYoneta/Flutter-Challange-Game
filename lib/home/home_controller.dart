import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:organics/core/app_images.dart';
import 'package:organics/home/home_repository.dart';
import 'package:organics/home/home_state.dart';
import 'package:organics/shared/shared/quiz_answer.dart';
import 'package:organics/shared/shared/quiz_model.dart';
import 'package:organics/shared/shared/quiz_question.dart';
import 'package:organics/shared/shared/user_name.dart';

// Gerenciar o estado, o usuário e os quizes

class HomeController {

  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state (HomeState state) =>stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();
  

  void getUser() async{

    state = HomeState.loading;
    
    user= await repository.getUser();
    
    state = HomeState.sucesso;
  }

  void getQuizzes() async{
    state = HomeState.loading;
    quizzes = await repository.getQuizzes(); 
    
    state = HomeState.sucesso; 
  }
}