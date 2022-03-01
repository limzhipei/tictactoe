import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {

  final String buttonText;
  final VoidCallback onPressed;
  final Icon shape;

  MenuButton({
    required this.buttonText,
    required this.onPressed,
    required this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Container(
        height: 80.0,
        child: Card(
          elevation: 0,
          color: Theme.of(context).primaryColor,
          child: Row(
            children: <Widget>[
              Text(
                buttonText,
                style: TextStyle(
                  fontSize: 35.0,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: shape,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
