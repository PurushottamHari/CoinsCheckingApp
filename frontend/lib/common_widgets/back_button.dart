import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  final void Function() onPressed;
  final Color? color;

  const BackButton({required this.onPressed, this.color});

  @override
  Widget build(context) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.arrow_back_ios,
          color: color ?? Colors.white,
        )
    );
  }
}