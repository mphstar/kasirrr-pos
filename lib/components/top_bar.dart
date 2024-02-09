// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  Widget leftIcon;
  Widget? rightIcon;

  String title;

  TopBar({
    super.key,
    required this.leftIcon,
    this.rightIcon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        leftIcon,
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Text(title),
        ),
        rightIcon != null ? rightIcon! : Container()
      ],
    );
  }
}
