import 'package:flutter/material.dart';

class CustomCircleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Handle button tap
      },
      child: Ink(
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.lightBlue, Colors.blue.shade900]),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Container(
          constraints: BoxConstraints(
            minWidth: 56.0,
            minHeight: 56.0,
          ),
          alignment: Alignment.center,
          child: Text(
            'Test',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
