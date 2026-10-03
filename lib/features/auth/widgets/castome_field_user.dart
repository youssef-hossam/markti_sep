import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUserField extends StatefulWidget {
  final String label_text;
  final IconData icon;
  final bool ispassword;
  final String hint_text;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomUserField({
    super.key,
    required this.label_text,
    required this.icon,
    required this.hint_text,
    this.ispassword = false,
    this.validator, this.controller,
  });

  @override
  State<CustomUserField> createState() => _CustomUserFieldState();
}

bool obscureText = true;

class _CustomUserFieldState extends State<CustomUserField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.ispassword ? obscureText : false,
      decoration: InputDecoration(
        labelText: widget.hint_text,
        labelStyle: TextStyle(fontSize: 18, color: Colors.black),
        hintText: widget.label_text,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 17.sp),
        prefixIcon: Icon(widget.icon),
        suffixIcon: widget.ispassword
            ? IconButton(
                onPressed: () {
                  obscureText = !obscureText;
                  setState(() {});
                },
                icon:
                    Icon(obscureText ? Icons.visibility_off : Icons.visibility),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(177, 115, 207, 243), width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(175, 0, 179, 249), width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
