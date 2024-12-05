import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFild extends StatelessWidget {
  final TextEditingController controller;
  final void Function()? onPressed;
  final void Function(String)? onChanged;

  const CustomTextFild({
    super.key,
    required this.controller,
    this.onPressed,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Qidiruv...',
          hintStyle: TextStyle(
            color: Colors.grey[600],
          ),
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(
              CupertinoIcons.clear_circled_solid,
              color: Colors.grey[700],
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
