import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskcalculator/CalcButton.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalcApp());
}
class CalcApp extends StatefulWidget {
  const CalcApp({ Key? key }) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}


class CalcAppState extends State<CalcApp>
{
  // This widget is the root of your application.
  String _history = '';
  String _expression = '';
  void numClick(String text)
  {
    setState(() {
      _expression +=text;
    });


  }

   void allClear(String text)
  {
    setState(() {
      _history = '';
      _expression='';
    });
    
  }
   // ignore: non_constant_identifier_names
   void clear(String text)
  {
    setState(() {
      
      _expression='';
    });
    
  }
  void evaluate(String text)
  {
     Parser p = Parser();
     // ignore: unused_local_variable
     Expression exp = p.parse(_expression);
     // ignore: unused_local_variable
     ContextModel cm = ContextModel();
     double eval = exp.evaluate(EvaluationType.REAL, cm);
     
     
    setState(() {
      _history=_expression;
      _expression=eval.toString();
    });
    
  }
  
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(backgroundColor: Colors.lightGreen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children:<Widget>[
           Container(
            padding: EdgeInsets.only(right: 12),
            child: Text(_history,style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: 40,
              ),color:Colors.white70

            ),
            ),
            alignment: Alignment(1, 1),
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: Text(_expression,style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: 64,
              ),color:Colors.white70

            ),
            ),
            alignment: Alignment(1, 1),
          ),
          SizedBox(height: 40,),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:<Widget> [
          CalcButton(
            text: "AC",fillcolor: 0xFF7C870f,textsize: 25, callback: allClear,),
             CalcButton(
            text: "C",fillcolor: 0xFF7C870f,  callback: clear),
             CalcButton(
            text: "%",fillcolor: 0xFF7C870f,callback: numClick),
             CalcButton(
            text: "/",fillcolor: 0xFF7C870f,callback: numClick),

        ],
          ),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:<Widget> [
          CalcButton(
            text: "7",fillcolor: 0xFF7C870f,callback: numClick),
             CalcButton(
            text: "8",fillcolor: 0xFF7C870f,callback: numClick),
             CalcButton(
            text: "9",fillcolor: 0xFF7C870f,callback: numClick),
             CalcButton(
            text: "%",fillcolor: 0xFF7C870f,callback: numClick),

        ],
          ),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:<Widget> [
          CalcButton(
            text: "4",fillcolor: 0xFF7C870f,callback: numClick),
             CalcButton(
            text: "5",fillcolor: 0xFF7C870f,callback: numClick),
             CalcButton(
            text: "6",fillcolor: 0xFF7C870f,callback: numClick),
             CalcButton(
            text: "-",fillcolor: 0xFF7C870f,callback: numClick),

        ],
          ),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:<Widget> [
          CalcButton(
            text: "1",fillcolor: 0xFF7C870f,callback: numClick,),
             CalcButton(
            text: "2",fillcolor: 0xFF7C870f,callback: numClick),
             CalcButton(
            text: "3",fillcolor: 0xFF7C870f,callback: numClick),
             CalcButton(
            text: "+",fillcolor: 0xFF7C870f,callback: numClick),

        ],
          ),
           Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:<Widget> [
          CalcButton(
            text: ".",fillcolor: 0xFF7C870f,callback: numClick),
             CalcButton(
            text: "0",fillcolor: 0xFF7C870f,callback: numClick),
             CalcButton(
            text: "00",fillcolor: 0xFF7C870f,callback: numClick,textsize: 26,),
             CalcButton(
            text: "=",fillcolor: 0xFF7C870f,callback: evaluate),

        ],
          ),

          ], 
      ),
      ),
      );
    
  }
}



