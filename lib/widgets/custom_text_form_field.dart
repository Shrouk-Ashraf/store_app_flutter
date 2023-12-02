import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({
    this.onChanged,
    required this.labelText,
     this.textInputType,
    this.isObscureText = false,
     this.textController
  });

  final String labelText;
  Function(String)? onChanged;
  final bool isObscureText;
  TextInputType? textInputType;
  TextEditingController? textController ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
        obscureText: isObscureText,
        onChanged: onChanged,
        keyboardType: textInputType,
        cursorColor: Colors.grey,
        decoration:  InputDecoration(

          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey
              ),
            borderRadius: BorderRadius.circular(8)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
              borderRadius: BorderRadius.circular(8)
          ),
          errorBorder: const OutlineInputBorder(),
          labelText: labelText,

          labelStyle:const TextStyle(
              color: Colors.grey
          ),
        )
    );
  }

}
