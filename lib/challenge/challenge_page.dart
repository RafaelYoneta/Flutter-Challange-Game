import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:organics/challenge/challange_controller.dart';
import 'package:organics/challenge/widgets/answer_widget/answer_widget.dart';
import 'package:organics/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:organics/challenge/widgets/quiz/quiz_widget.dart';
import 'package:organics/home/widgets/next_button/next_button_widget.dart';
import 'package:organics/result/result_page.dart';
import 'package:organics/shared/shared/quiz_model.dart';

class ChallangePage extends StatefulWidget {

  final List<QuestionModel> questions;
  final String title;
  
  const ChallangePage({Key? key,required this.title, required this.questions }) : super(key: key);

  @override

  _ChallangePageState createState() => _ChallangePageState();
}


class _ChallangePageState extends State<ChallangePage> {
  final controller = ChallangeControler();
  PageController pageControlle = PageController();
  
  @override


  void initState() {
     super.initState();
  }

  void nextPage() {
    if(controller.currentPage < widget.questions.length)
    pageControlle.nextPage(
                    duration: Duration(milliseconds: 200), 
                    curve: Curves.linear);
  }


  void result(bool result){

    if(result){controller.qntAcertos++;}
    nextPage();
    log("$result");

  }



  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              ValueListenableBuilder<int>(valueListenable: controller.currentPageNotifier, builder: (context,value,_) =>
              QuestionIndicatorWidget(currentPage: value, lenght: widget.questions.length,),)
              
            ],
          )
          ), 
        preferredSize: Size.fromHeight(100)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
       child: 
            PageView(
              children: [
              ...widget.questions.map((e) => QuizWidget(
                question: e,
                onSelected: result,  
                
              )).toList()
              //necessário o squid para concatenar os itens
              ],
              physics: NeverScrollableScrollPhysics(),
              controller: pageControlle,
              //scrollDirection: Axis.vertical,
              onPageChanged: (num){
                controller.currentPage = num;
                log("Questão visivel ${controller.currentPage}");
                //Onpagechange permite que seja feito o controle da udança de paginas.
                
              },
            )
          
        
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          child: 
             ValueListenableBuilder<int>(
               valueListenable: controller.currentPageNotifier,
               builder: (context,value, _) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if(value<widget.questions.length-1)
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: NextButtonWidget.white(
                      label: "Pular", 
                      onTap: nextPage
                    ),
                  )),
                  if(value==widget.questions.length-1)
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: NextButtonWidget.green(label: "Confirmar",onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ResultPage(
                        title: widget.title,
                        lenght: widget.questions.length,
                        result: controller.qntAcertos,
                      )));
                    }),
                  ))
                ],
          ))  ,
        ),
      ),
    );
  }
}