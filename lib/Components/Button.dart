import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomButton({
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 60,
        child: MaterialButton(
          textColor: Colors.white,
          color: const Color(0xFF0B274E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
