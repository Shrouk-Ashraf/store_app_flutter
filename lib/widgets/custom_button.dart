import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({ this.onTap,required this.buttonText,Key? key}) : super(key: key);

  final String buttonText;
   Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
