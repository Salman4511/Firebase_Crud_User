import 'package:flutter/material.dart';

class LoginTextFormFieldWidget extends StatelessWidget {
  const LoginTextFormFieldWidget({
    super.key,
    required this.controller, required this.label, required this.validationMsg, required this.prefixIcon, this.suffixIconTap, required this.isSuffixrequired,
  });

  final TextEditingController controller;
  final String label;
  final String validationMsg;
  final IconData prefixIcon;
  final void Function()? suffixIconTap;
  final bool isSuffixrequired;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.white,
      keyboardType: TextInputType.emailAddress,
      decoration:  InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        enabledBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        prefixIcon:  Icon(prefixIcon),
        suffixIcon:isSuffixrequired? IconButton(
          icon: const Icon(Icons.visibility),
          onPressed:suffixIconTap
        ):null
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationMsg;
        }
        return null;
      },
    );
  }
}
