import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {

  IconData icon;
  Widget title;
  CustomTile({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white,),
        SizedBox(
          width: 12,
        ),
        title
      ],
    );
  }
}