import 'package:calculator/buttons.dart';
import "package:flutter/material.dart";


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(child: Container()),
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
                    if(buttons[index] == "C" ){
                      return MyButtons(
                        color: Colors.green,
                        textColor: Colors.white70,
                        buttonText: buttons[index],
                      );
                    }else if(buttons[index] == "Del")
                      {
                        return MyButtons(
                          color: Colors.redAccent,
                          textColor: Colors.white70,
                          buttonText: buttons[index],
                        );
                      }
                    else{
                      return MyButtons(
                        color: isOperator(buttons[index]) ?  Colors.deepPurple : Colors.white70,
                        textColor: isOperator(buttons[index]) ?  Colors.white70: Colors.deepPurple,
                        buttonText: buttons[index],
                      );
                    }
                    }// Item Builder
              ),
          ),)
        ],
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
