import 'package:flutter/material.dart';
import 'package:notes_app/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final int maxLine;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.maxLine = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defPadding),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 12,
        child: Row(
          children: [
            SizedBox(width: 12),
            Icon(icon, color: Colors.black),
            Flexible(
              child: TextField(
                controller: controller,
                maxLines: maxLine,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: defPadding, vertical: defPadding / 2),
                  hintText: hintText,
                  hintStyle:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
