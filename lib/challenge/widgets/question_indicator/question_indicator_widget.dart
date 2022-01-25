import 'package:flutter/material.dart';

import 'package:organics/challenge/widgets/answer_widget/answer_widget.dart';
import 'package:organics/challenge/widgets/quiz/quiz_widget.dart';
import 'package:organics/core/app_text_styles.dart';
import 'package:organics/home/widgets/quiz_card_widget/quiz_card_widget.dart';
import 'package:organics/shared/widgets/linear_progress_bar_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {

  final int currentPage;
  final int lenght;

  const QuestionIndicatorWidget({
    Key? key,
    required this.currentPage,
    required this.lenght,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Questão ${currentPage+1}', style: AppTextStyles.body,),
                Text(' de $lenght' , style: AppTextStyles.body,),
              ],
            ),
            SizedBox(height: 16),
            LinearProgressBarWidget(value: currentPage+1/lenght,),
            
            
          ],
        ),      
      ),
    );
  }
}
