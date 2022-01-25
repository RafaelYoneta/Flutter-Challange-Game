import 'package:flutter/material.dart';
import 'package:organics/core/app_images.dart';
import 'package:organics/core/app_text_styles.dart';
import 'package:organics/home/widgets/next_button/next_button_widget.dart';
import 'package:share/share.dart';

class ResultPage extends StatelessWidget {

  final String title;
  final int lenght;
  final int result;

  const ResultPage({ Key? key, required this.title, required this.lenght, required this.result }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.only(top: 130),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if(result==lenght)
                Image.asset(AppImages.trophy) ,
              if(result<lenght)
                Image.asset(AppImages.donkey) ,
                
            Column(children: [
              if(result==lenght)
                Text("Parabéns!", style: AppTextStyles.heading40,),
              if(result<lenght)
                Text("Ops, seu bosta!", style: AppTextStyles.heading40,),
              
              SizedBox(
                height: 16,
              ),
              Text.rich(
                TextSpan(text:"Você concluiu" ,style: AppTextStyles.body,
                children: 
                [TextSpan(text: "\n$title", style: AppTextStyles.bodyBold),
                TextSpan(text: "\ncom $result de $lenght acertos", style: AppTextStyles.body)]
                ),
                textAlign: TextAlign.center)
            ],),
              
            Column(
              children: [
                            Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 68),
                    child: NextButtonWidget.purple(label: "Conpartilhar", onTap: (){
                      Share.share('DevQuiz - $title - Acertei $result de $lenght', subject: 'Meu resultado no Quiz!');
                    }),
                  )),
                ],
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 68),
                    child: NextButtonWidget.grey(
                      label: "Voltar ao início", 
                      onTap: (){
                        Navigator.pop(context);
                      }),
                  )),
                ],
              )
              ],
            )
            ],
            
          ),
        ),
      ),
    );
  }
}