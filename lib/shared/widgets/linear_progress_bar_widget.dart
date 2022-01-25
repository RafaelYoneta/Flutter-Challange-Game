import 'package:flutter/material.dart';
import 'package:organics/core/app_colors.dart';

class LinearProgressBarWidget extends StatelessWidget {
  final double value;
  const LinearProgressBarWidget ({Key?key , required this.value,}) 
  : super (key : key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
        LinearProgressIndicator(
          value: value,
          backgroundColor: AppColors.chartSecondary,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
          ),
      
    );
  }
}