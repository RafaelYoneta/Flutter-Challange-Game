import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:organics/challenge/widgets/answer_widget/answer_widget.dart';
import 'package:organics/core/app_text_styles.dart';
import 'package:organics/shared/shared/quiz_answer.dart';
import 'package:organics/shared/shared/quiz_model.dart';

class QuizWidget extends StatefulWidget {

  final QuestionModel question;
  final ValueChanged<bool> onSelected;
  final int indexSelected;

  const QuizWidget ({Key? key, required this.question, required this.onSelected, this.indexSelected=-1}) 
  : super (key : key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}


class _QuizWidgetState extends State<QuizWidget> {

 int indexSelected =-1;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Column(
        children: [
          Text(widget.question.title, 
          style: AppTextStyles.heading,),
          SizedBox(height: 24,),

          for (var i=0; i<widget.question.answer.length;i++)
          
          AnswerWidget(
          title: widget.question.answer[i].title,
          disable: indexSelected!=-1,
          isRight: widget.question.answer[i].isRight!,
          isSelected: indexSelected==i,
          onTap: (value){
            indexSelected=i;
            setState(() {});
            Future.delayed(Duration(seconds: 1)).then((_)=>widget.onSelected(value));
            log("$i e ${widget.question.title}");
          },
           )
        
        ],
      ),
    );
  }
}