//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:organics/core/app_colors.dart';
import 'package:organics/core/core.dart';
import 'package:organics/home/widgets/chart/char_widget.dart';

class ScoreCardWidget extends StatelessWidget {

  final double percent;

  const ScoreCardWidget({Key? key, required this.percent}) : super(key: key);
   
  @override
  Widget build(BuildContext context) {
    
    double size = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 136,
        width: size,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
    ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,   
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Expanded(
                flex: 1,
                child: ChartWidget(percent: percent,),
              ),
            ),//Gráfico
            Expanded(
                flex: 3,
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Vamos Começar!",
                     style: AppTextStyles.heading),
                    Text("bla bla bla bla bla bla bla bla!",
                    style: AppTextStyles.body),
                  ],
                )
            )// Texto
          
          ],
        ),
      ),
    );
  }
}