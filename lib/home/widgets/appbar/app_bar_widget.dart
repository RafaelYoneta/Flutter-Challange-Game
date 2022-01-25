import 'package:flutter/material.dart';
import 'package:organics/core/app_gradients.dart';
import 'package:organics/core/app_text_styles.dart';
import 'package:organics/home/widgets/score_card/score_card_widget.dart';
import 'package:organics/shared/shared/user_name.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;

  AppBarWidget({required this.user}) : super (
    preferredSize: Size.fromHeight(250),
    child: Container(
      height: 250,
      child: Stack(
        children: [
          Container(
            height: 161,
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
            gradient: AppGradients.linear,  
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,// Espaçamento para que o texto e a foto fiquem distantes 
              children: [
                Text.rich(
                  TextSpan(
                    text:'Olá, ',
                    style: AppTextStyles.title,
                    children: [TextSpan(
                      text:user.name, 
                      style: AppTextStyles.titleBold,
                      )], 
                  )
                ),
                
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(user.photoURL)
                    )
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.0, 1.75),
            child: ScoreCardWidget(percent: user.score/100,)),
        ],
      ),
    ),
  );
}