import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:organics/core/app_colors.dart';
import 'package:organics/core/app_text_styles.dart';
import 'package:organics/core/core.dart';
import 'package:organics/shared/widgets/linear_progress_bar_widget.dart';

class QuizCardWidget extends StatelessWidget {

  final String title;
  final String completed;
  final String img;
  final int respondidas;
  final int total;
  final VoidCallback onTap;

  QuizCardWidget({
    required this.title,
    required this.completed,
    required this. img,
    required this.respondidas,
    required this.total,
    required this.onTap,
  });
  

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        
        child: Container(
          decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  child: Image.asset(img),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(title, // Texto com o título do card
                style: AppTextStyles.heading15),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(completed, 
                      style: AppTextStyles.body11,),
                    ),
                    Expanded(
                      flex: 3,
                      child: LinearProgressBarWidget(
                        value: respondidas/total,
                        ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}