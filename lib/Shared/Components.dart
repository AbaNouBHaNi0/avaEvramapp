import 'package:flutter/material.dart';

class TEXTINPUTE extends StatelessWidget {
   TEXTINPUTE({Key? key,   this.icon ,required this.keyBoard ,this.Controller, this.Hint, this.Validator , this.textDirection , this.textAlign}) : super(key: key);
final Controller;
final Hint;
final Validator;
TextDirection? textDirection = TextDirection.ltr;
TextAlign? textAlign = TextAlign.left;
IconData? icon = Icons.account_circle_outlined;
TextInputType keyBoard = TextInputType.emailAddress;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign!,
      textDirection: textDirection,
      controller: Controller,
      validator: Validator,
      keyboardType: keyBoard,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: "$Hint",
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(),
          //fillColor: Colors.green
        ),
      ),
    );
  }
}
class DefaultText extends StatelessWidget
{
  const DefaultText({Key? key, this.content,  this.Size = 20, this.weight = FontWeight.bold, this.color}) : super(key: key);

  final content;
  final Size ;
  final weight;
  final color;

  @override
  Widget build(BuildContext context) {

    return Text(content , style: TextStyle(fontSize: Size ,fontWeight: weight , color: color),);
  }
}

Shadow(color)
{
  return BoxShadow(
    color: color.withOpacity(0.5),
    spreadRadius: 5,
    blurRadius: 7,
    offset: const Offset(0, 3), // changes position of shadow
  );
}

textStyle()
{
  return  TextStyle(
      color: Colors.white,
      fontSize: 28,
      fontFamily: "Timesnewroman");
}