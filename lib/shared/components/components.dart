import 'package:flutter/material.dart';

 Widget defualtButton({
  double size = 20.0,
  Color background = Colors.blue,
  required String text,
  raduis = 20.0,
  FontWeight weight = FontWeight.bold,
  required Function function,
}) =>
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(raduis), color: background),
      child: MaterialButton(
        onPressed: function(),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontWeight: weight,
            fontSize: size,
          ),
        ),
      ),
    );

 Widget defaultFormField({
  required label ,
   required type ,
  required IconData prefix,
   required Function validate,
    IconData? suffix,
})=>TextFormField(
   keyboardType: type,
   validator: validate(),
   decoration: InputDecoration(
       border: OutlineInputBorder(),
       labelText: label,
       prefixIcon: Icon(
         prefix,
       ),
   ),

 );