import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organics/core/app_colors.dart';

// a opção assert esta fazendo uma validação se a variável label esta dentro das opções disponíveis
class LevelButtonWidget extends StatelessWidget {
 final String label;
  LevelButtonWidget({Key? key, required this.label,})  
 : assert (['Fácil',"Médio",'Difícil','Perito'].contains(label)),
  super (key: key);

//config esta criando as opções de cores para cadaestágio
final config = {
  'Fácil':{
    'color': AppColors.levelButtonFacil,
    'borderColor': AppColors.levelButtonBorderFacil,
    'fontColors' : AppColors.levelButtonTextFacil,
  },
  'Médio':{
    'color': AppColors.levelButtonMedio,
    'borderColor': AppColors.levelButtonBorderMedio,
    'fontColors' : AppColors.levelButtonTextMedio,
  },
  'Difícil':{
    'color': AppColors.levelButtonDificil,
    'borderColor': AppColors.levelButtonBorderDificil,
    'fontColors' : AppColors.levelButtonTextDificil,
  },
  'Perito':{
    'color': AppColors.levelButtonPerito,
    'borderColor': AppColors.levelButtonBorderPerito,
    'fontColors' : AppColors.levelButtonTextPerito,
  },
};

//pegar a cor baseado na config e devolver para uma variável a traves do get

Color get color => config[label]!['color']!;
Color get bordercolor => config[label]!['borderColor']!;
Color get fontcolor => config[label]!['fontColors']!;

//Color get color => config(label)!colorE
 
  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(28),
      color: color, //passando a variavel de cor do get
      border: Border.fromBorderSide(
        BorderSide(
          color: bordercolor) //passando a variavel de cor do get
        )
    ),
    child: 
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 26),
      child: Text(label,
      style: GoogleFonts.notoSans(
        color: fontcolor, //passando a variavel de cor do get
        fontSize: 13,
      ),
    ),
    ),
      
    );
    
  }
}