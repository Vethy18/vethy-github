import 'package:flutter/material.dart';

class DefaultFormField extends StatefulWidget {
  final String label;
  final TextEditingController value;
  final IconData prefix;
 final Function onchanged , validatore;
  final TextInputType type;
  final bool ispassword= false;
  const DefaultFormField({
     required this.label,
     required this.value,
     required this.prefix,
    required this.type,
    required this.onchanged,
    required this.validatore

  })  ;

  @override
  _DefaultFormFieldState createState() => _DefaultFormFieldState();
}

class _DefaultFormFieldState extends State<DefaultFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        keyboardType: widget.type,
        controller: widget.value,
        onChanged: widget.onchanged(),
        validator:widget.validatore(),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: widget.label,
           prefixIcon:Icon(
            widget.prefix
          )
        ),
      ),
    );
  }
}
