import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget
{
  final String text;
  final int textColor;
  final int fillcolor ;
  final double textsize;
  final Function callback;
  const CalcButton({ required this.text, this.textColor=0xFFFFF8E1,required this.callback, required this.fillcolor,this.textsize=28});
  @override
  Widget build(BuildContext context) 
  {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        // ignore: deprecated_member_use
        child: FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Text(text,
          style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: textsize,)),
          ),
          onPressed: () {callback(text);},
          // ignore: unnecessary_null_comparison
          color: fillcolor!=null?Color(fillcolor):null,
          textColor: Color(textColor),
        ),
      ),
    );

  }
}