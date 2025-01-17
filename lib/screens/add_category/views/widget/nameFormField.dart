import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NameFormField extends StatelessWidget {
  NameFormField({super.key, required this.categoryNameController});
  TextEditingController categoryNameController;
  @override
  Widget build(BuildContext context) {
    return _buildNameFormField();
  }

  Widget _buildNameFormField() {
    return TextFormField(
      controller: categoryNameController,
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
