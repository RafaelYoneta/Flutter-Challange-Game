import 'package:flutter/material.dart';
import 'package:organics/core/app_colors.dart';
import 'package:organics/core/app_text_styles.dart';

class AnswerWidget extends StatelessWidget {
  final String title;
  final bool isRight;
  final bool disable;
  final bool isSelected;
  final ValueChanged<bool> onTap;

  const AnswerWidget ({Key? key, 
  required this.title,
  required this.onTap,
  this.isRight =false,
  this.isSelected = false, this.disable=false})
  : super (key : key);

  Color get _selectedColorRight =>
    isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
    isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
    isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
    isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
    isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight =>
    isRight ? Icons.check : Icons.close;


  @override
  
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: IgnorePointer(
        ignoring: disable,
        child: GestureDetector(
          onTap: () {
            onTap(isRight);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected ? _selectedColorCardRight : AppColors.white,
              border: Border.fromBorderSide(BorderSide(
                color: isSelected ? _selectedBorderRight : AppColors.border)),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(title, 
                  style: 
                    isSelected ?
                    _selectedTextStyleRight : AppTextStyles.body,),
                ),
                Container(
                  decoration: BoxDecoration(
                   color: isSelected ?  _selectedColorRight : Colors.white ,
                   border: Border.fromBorderSide(BorderSide(color: 
                    isSelected ? _selectedBorderRight : AppColors.border)),
                   borderRadius: BorderRadius.circular(500) 
                  ),
                  width: 24,
                  height: 24,
                  child: Icon(
                    isSelected? _selectedIconRight : Icons.check,
                    size: 16,
                    color: Colors.white,),

                )
              ],
            ),
            
          ),
        ),
      ),
    );
  }
}