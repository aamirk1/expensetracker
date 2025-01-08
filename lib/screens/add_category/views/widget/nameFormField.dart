import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NameFormField extends StatelessWidget {
  const NameFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildNameFormField();
  }
  Widget _buildNameFormField() {
    return TextFormField(
      // controller: dateController,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        hintText: 'Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}