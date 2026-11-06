import 'package:flutter/material.dart';

class CustomTxtInput extends StatelessWidget implements PreferredSizeWidget {
  final String label;
  final TextEditingController? controller;

  const CustomTxtInput(
      {super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Enter your $label",
            border: const OutlineInputBorder(),
          ),
          controller: controller,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
