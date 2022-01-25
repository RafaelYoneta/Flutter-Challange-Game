import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:organics/challenge/challenge_page.dart';
import 'package:organics/core/app_colors.dart';
import 'package:organics/core/app_images.dart';
import 'package:organics/home/home_controller.dart';
import 'package:organics/home/home_state.dart';
import 'package:organics/home/widgets/appbar/app_bar_widget.dart';
import 'package:organics/home/widgets/level_button/level_button_widget.dart';
import 'package:organics/home/widgets/quiz_card_widget/quiz_card_widget.dart';
import 'package:organics/shared/widgets/linear_progress_bar_widget.dart';


class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
    void initState() {

      super.initState();
      controller.getQuizzes();
      controller.getUser();
      controller.stateNotifier.addListener(() { 
        setState(() {
                log("Atualizado ${controller.state} / ${controller.stateNotifier}") ;
                });
      });
      
    }

  @override
  Widget build(BuildContext context) {
    
    if(controller.state==HomeState.sucesso){
      log("sucesso - desenhado a tela");
    return Scaffold(
      appBar: AppBarWidget(user:controller.user!),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevelButtonWidget(
                  label: 'Fácil'),
                  LevelButtonWidget(
                  label: 'Médio'),
                  LevelButtonWidget(
                  label: 'Difícil'),
                  LevelButtonWidget(
                  label: 'Perito'),
              ],
            ),
            SizedBox(
              height: 16,
              ),

            Expanded(
              child: GridView.count(
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount:2, 
                children: 
                  controller.quizzes!.map((e) => QuizCardWidget(
                    onTap: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => ChallangePage(
                            questions: e.questions,
                            title: e.title,),          
                        ),
                        
                      );
                    },
                    title: e.title,
                    img: e.imagem,
                    completed: "${e.questionAnswered} de ${e.questions.length}",
                    respondidas: e.questionAnswered,
                    total: e.questions.length,
                    )).toList(),
              
              ),
            )
            
          ],
        ),
      ),
      
    );
    }
    else {
      log("loading - aguardando");
      return Scaffold(body: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),)),);
    }
  }
}