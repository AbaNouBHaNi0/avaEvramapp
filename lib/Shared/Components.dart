import 'package:flutter/material.dart';

class TEXTINPUTE extends StatelessWidget {
   TEXTINPUTE({Key? key,   this.Controller, this.Hint, this.Validator}) : super(key: key);
final Controller;
final Hint;
final Validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: Controller,
      validator: Validator,
      keyboardType: TextInputType.emailAddress,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle_outlined),
        labelText: "$Hint",
        //icon: Icon(Icons.account_circle_outlined),
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

