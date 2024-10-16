import 'package:flutter/material.dart';

class TextInputFormField extends StatelessWidget {
  const TextInputFormField({
    super.key,
    required this.textEditingController,
    this.isBass = false,
    required this.hintText,
    required this.icon,
  });
  final TextEditingController textEditingController;
  final bool isBass;
  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        obscureText: isBass,
        controller: textEditingController,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.black45, fontSize: 18),
            prefixIcon: Icon(
              icon,
              color: Colors.black45,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.grey,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.purple, width: 2),
                borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
