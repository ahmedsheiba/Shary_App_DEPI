import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      this.onChanged,
      this.hinttext,
      this.controller,
      this.obscureText = false});
  Text? hinttext;
  Function(String)? onChanged;

  TextEditingController? controller = TextEditingController();

  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText!,
      style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
      validator: (data) {
        if (data!.isEmpty) {
          return 'field required';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade400,
          label: hinttext,
          labelStyle: const TextStyle(color: Colors.black),
          floatingLabelStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.black))),
    );
  }
}
