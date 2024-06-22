import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor:const Color(
              0xffdbf4fc) ),

      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return  Scaffold(
      body:SafeArea(
        child: Column (
          children:  [
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(16),
                  child: const Text("0",style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,),

                ),
              ),
            ),
            Wrap(
                children: Calculatorbtn.buttonValues.map((value) =>SizedBox(
                  width //: value == "AC"? screenSize.width /2
                      : value == "0"
                      ? screenSize.width /2
                      : screenSize.width / 4,
                  height:  screenSize.width /4.5,
                  child: buildButton(value),
                ),
                ).toList()
            ),
          ],
        ),
      ),);
  }
  Widget buildButton(value){
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: getBtnColor(value),
        shape: OutlineInputBorder(

            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius:
            BorderRadius.circular(25)),
        child: InkWell(
          onTap: () {},
          child:
          Center(child: Text(value , style:  const TextStyle(fontSize: 30),),),),
      ),
    );
  }
  Color getBtnColor (value){
    return [ Calculatorbtn.del, Calculatorbtn.clr,Calculatorbtn.parenthese].contains(value)? const Color(
        0xff9cff23) :[
      Calculatorbtn.add,
      //Calculatricebtn.calculate,
      Calculatorbtn.divide,
      Calculatorbtn.multiply,
      Calculatorbtn.subtract
    ].contains(value)? const Color(0xFF9FFFCF):
    [Calculatorbtn.calculate].contains(value)? const Color(0xFF018DFF):
    const Color(0xffffffff);
  }

}
class Calculatorbtn {
  static const clr = "AC";
  static const del = "⌫";
  static const multiply = "x";
  static const divide = "÷";
  static const add = "+";
  static const subtract = "−";
  static const calculate = "=";
  static const dot = ".";

  static const parenthese = "( )";

  static const n0 = "0";
  static const n1 = "1";
  static const n2 = "2";
  static const n3 = "3";
  static const n4 = "4";
  static const n5 = "5";
  static const n6 = "6";
  static const n7 = "7";
  static const n8 = "8";
  static const n9 = "9";


  static const List buttonValues=[

    clr,
    parenthese,
    del,
    add,
    n9,
    n8,
    n7,
    subtract,
    n6,
    n5,
    n4,
    multiply,
    n3,
    n2,
    n1,
    divide,
    n0,
    dot,
    calculate
  ];
}