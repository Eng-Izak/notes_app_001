import 'package:flutter/material.dart';
import 'package:notes_app_001/features/home/ui/widgets/custom_search_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.txt, required this.icon});
  final String txt;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          txt,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        CustomButtonIcon(icon: icon),
      ],
    );
  }
}
