import 'package:flutter/material.dart';
import 'package:twekl_test_app/core/colors.dart';

class GeneralTextFieldComponent extends StatelessWidget {
  const GeneralTextFieldComponent({
    super.key,
    required this.action,
    required this.keyboard,
    required this.hint,
    required this.validation,
    required this.icon,
    required this.controller,
    this.secureText = false,
    this.suffixIcon,
  });

  final String hint;
  final TextInputType keyboard;
  final TextInputAction action;
  final Function validation;
  final IconData icon;
  final Widget? suffixIcon;

  final bool secureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboard,
      textInputAction: action,
      obscureText: secureText,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.zero,
        prefixIcon: Icon(icon, color: primaryColor.withOpacity(.3)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: primaryColor.withOpacity(.3),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: suffixIcon,
      ),
      validator: (value) => validation(value),
    );
  }
}

class UserNameField extends StatelessWidget {
  const UserNameField({super.key, required this.nameController});

  final TextEditingController nameController;
  String? validation(String text) {
    if (text.trim().isEmpty) {
      return 'Required Field';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GeneralTextFieldComponent(
      controller: nameController,
      action: TextInputAction.next,
      hint: 'User Name',
      icon: Icons.person,
      keyboard: TextInputType.text,
      validation: (text) => validation(text),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, required this.passController});
  final TextEditingController passController;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  String? validation(String text) {
    if (text.trim().isEmpty) {
      return 'Required Field';
    }
    if (text.trim().length < 6) {
      return 'Weak passord, min 6 characters';
    }
    return null;
  }

  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return GeneralTextFieldComponent(
        controller: widget.passController,
        action: TextInputAction.done,
        hint: 'Password',
        icon: Icons.lock,
        keyboard: TextInputType.visiblePassword,
        validation: (text) => validation(text),
        secureText: isSecure,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() => isSecure = !isSecure);
          },
          icon: Icon(isSecure ? Icons.visibility : Icons.visibility_off),
          color: primaryColor.withOpacity(.3),
        ));
  }
}
