import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

// ignore: must_be_immutable
class ColorFormField extends StatelessWidget {
   ColorFormField({super.key});

  Color pickerColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return _buildColorFormField();
  }
  Widget _buildColorFormField() {
  return TextFormField(
    onTap: () {
      ColorPicker(
        pickerColor: pickerColor,
        onColorChanged: (Color value) {},
      );
    },
    // controller: dateController,
    textAlignVertical: TextAlignVertical.center,
    readOnly: true,

    decoration: InputDecoration(
      isDense: true,
      filled: true,
      fillColor: Colors.white,
      hintText: 'Color',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
}