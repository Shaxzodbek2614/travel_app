import 'package:flutter/material.dart';

class BuildSignInButton extends StatelessWidget {
  IconData? icon;
  VoidCallback onPressed;
  Image? image;
  Color? color;
  BuildSignInButton({
    super.key,
    this.icon,
    required this.onPressed,
    this.color,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      width: 110,
      height: 70,
      decoration: BoxDecoration(
        border: BoxBorder.all(width: 2, color: Colors.grey),
        borderRadius: .circular(35),
      ),
      child: icon != null
          ? IconButton(
              onPressed: onPressed,
              icon: Icon(icon, color: color, size: 30),
            )
          : image
    );
  }
}
