import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableCard.dart';
import 'iconContent.dart';
import 'Constants.dart';
import 'Result_Page.dart';
import 'package:bmi_calculator/Calculation.dart';
enum Gender{male,female,}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender ?selectedGender ;
  int height = 180 ;
  int weight = 60 ;
  int age = 10 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
        Expanded(
            child: Row(
          children: <Widget>[
            Expanded(
              child: ReusableCard(
                onpress: (){
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
              c:selectedGender==Gender.male? activeCardColor : inactiveCardColor,
              cardchild: IconContent(
                label: 'MALE',
                icon: FontAwesomeIcons.mars,
              ),
            ),
            ),
            Expanded(
              child: ReusableCard(
                onpress: (){
                  setState(() {
                    selectedGender = Gender.female ;
                  });
                },
                  c: selectedGender == Gender.female ? activeCardColor : inactiveCardColor,
                  cardchild: IconContent(
                    label: 'FEMALE',
                    icon: FontAwesomeIcons.venus,
                  ),
              ),
            ),
          ],
        )),
        Expanded(
          child: ReusableCard(c: activeCardColor,
            cardchild:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("HEIGHT",style: textstyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(height.toString(),
                      style: numberstyle,
                    ),
                    Text("cm" ,
                      style: textstyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor:Color(0xFFEB1555),
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    overlayColor: Color(0x29EB1555),

                  ),
                  child: Slider(
                    onChanged: (double newvalue){
                      setState(() {
                        height = newvalue.round() ;
                      });
                  },
                    value: height.toDouble(),
                    min:120.0 ,
                    max: 220,
                  ),
                )
              ],
            ), ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                    c: activeCardColor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("WEIGHT" , style: textstyle,),
                      Text(weight.toString() , style: numberstyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(child: Icon(FontAwesomeIcons.plus),onpressed: (){
                            setState(() {
                              weight ++ ;
                            });
                          },),
                          SizedBox(width: 10.0,),
                          RoundIconButton(child: Icon(FontAwesomeIcons.minus),onpressed: (){
                            setState(() {
                              weight -- ;
                            });
                          },),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                    c: activeCardColor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("AGE" , style: textstyle,),
                      Text(age.toString() , style: numberstyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(child: Icon(FontAwesomeIcons.plus),onpressed: (){
                            setState(() {
                              age ++ ;
                            });
                          },),
                          SizedBox(width: 10.0,),
                          RoundIconButton(child: Icon(FontAwesomeIcons.minus),onpressed: (){
                            setState(() {
                              age -- ;
                            });
                          },),
                        ],
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            Calculation calc = Calculation(weight: weight, height: height);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            ),),);
          },
          child: Container(
            child: Center(child: Text('CALCULATE',style: largeButtonstyle,),),
            color:bottomContainerColor ,
            height: bottomContainerHeight,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10.0),
          ),
        ),
      ]
      ),
    );
  }
}
class RoundIconButton extends StatelessWidget {
  final Widget ?child ;
  final VoidCallback onpressed ;
  RoundIconButton({required this.child,required this.onpressed});
  @override

  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed,
      child:child ,
      constraints: BoxConstraints.tightFor(width: 56.0,height: 56.0),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
