import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class CustomIcon extends StatefulWidget {
  final Color? color;
  final IconData? icon;
  final Color? iconColor;
  final void Function()? onPressed;

  const CustomIcon({super.key, this.color, this.icon, this.iconColor, this.onPressed,});

  @override
  State<CustomIcon> createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Opacity(
        opacity: 0.3,
        child: Icon(
          Icons.circle,
          color: widget.color ?? AppColors.primaryRed,
          size: 60.0,
        ),
      ),
      Opacity(
        opacity: 0.4,
        child: Icon(
          Icons.circle,
          color: widget.color ?? AppColors.primaryRed,
          size: 50.0,
        ),
      ),
      Opacity(
        opacity: 0.8,
        child: Icon(
          Icons.circle,
          color: widget.color ?? AppColors.primaryRed,
          size: 40.0,
        ),
      ),
      IconButton(
        icon: Icon(
          widget.icon,
          color: widget.iconColor ?? AppColors.white,
          size: 20.0,
        ),
        onPressed: widget.onPressed,
      ),
    ]);
  }
}
