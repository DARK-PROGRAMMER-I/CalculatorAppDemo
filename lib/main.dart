import 'package:calculator/buttons.dart';
import "package:flutter/material.dart";
import "dart:convert";

void main() => runApp(Calculator());

class Calculator extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String>  buttons= [
    "C", "Del" , "%" , "/",
    "9", "8" , "7" , "x",
    "6", "5" , "4" , "-",
    "3", "2" , "1" , "+",
    "0", "." , "Ans" , "=",

  ];
  String initial_number = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],

      body: Container(
        // padding: EdgeInsets.only(top: 20),
        child: Column(

          children: [



            // Expanded(child: child),
            Expanded(


                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.only(top: 120, left: 10, right: 30 ),
                  child: Text(initial_number, style: TextStyle(fontSize: 22),),

                ),
            ),
            Expanded(
                flex: 2,

                child: Container(

                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: false,

                      itemCount: buttons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisSpacing: 0 , crossAxisSpacing: 3.0,childAspectRatio: 1.2,
                      ), // We have used this to split the buttons
                      itemBuilder: (BuildContext context, int index){
                        // clear button
                      if(buttons[index] == "C" ){
                        return MyButtons(
                          isTapped: (){
                            setState(() {
                              initial_number = '0';
                            });
                          },
                          color: Colors.green,
                          textColor: Colors.white70,
                          buttonText: buttons[index],
                        );
                        // Delete button
                      }else if(buttons[index] == "Del")
                        {
                          return MyButtons(
                            isTapped: () {
                              setState(() {
                                initial_number = initial_number.substring(0, initial_number.length -1);
                              });
                            },
                            color: Colors.redAccent,
                            textColor: Colors.white70,
                            buttonText: buttons[index],
                          );
                        }
                      // other buttons
                      else{
                        return MyButtons(
                          isTapped:(){
                            setState(() {
                              initial_number += buttons[index];
                            });
                          },
                          color: isOperator(buttons[index]) ?  Colors.deepPurple : Colors.white70,
                          textColor: isOperator(buttons[index]) ?  Colors.white70: Colors.deepPurple,
                          buttonText: buttons[index],
                        );
                      }
                      }// Item Builder
                ),
            ),
            ),

          ],
        ),
      ),
    );
  }
  bool isOperator(String x){
    if(x == "/" || x == "x" || x == "+" ||x == "-" || x == "=" || x== "%" ){
      return true;
    }
    return false;
  }

}
// GridView.builder(
// physics: NeverScrollableScrollPhysics(),
// shrinkWrap: true,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 5,
// crossAxisSpacing: 5.0,
// ),
// mainAxisSpacing: 5.0,
