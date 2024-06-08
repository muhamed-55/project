import 'package:bmi_calculator/Constants.dart';
import 'package:flutter/material.dart';
import 'ReusableCard.dart';
class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  ResultPage({required this.interpretation, required this.bmiResult, required this.resultText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
         Expanded(
           child: Container(
             child: Text('Your Result',style: titlestyle,),
             padding : EdgeInsets.all(10.0),
             alignment: Alignment.bottomLeft,
           ),
         ),
          Expanded(
            flex: 5 ,
              child: ReusableCard(
                c: activeCardColor ,
                cardchild:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                    Text(resultText.toUpperCase() , style: resultstyle,),
                    Text(bmiResult , style: BMIstyle,),
                    Text(interpretation, style: largeButtonstyle,textAlign: TextAlign.center, ),
                  ],
                )
                ,)
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              child: Center(child: Text('RE-CALCULATE',style: largeButtonstyle,),),
              color:bottomContainerColor ,
              height: bottomContainerHeight,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
            ),
          ),
        ],
      )
    );
  }
}
