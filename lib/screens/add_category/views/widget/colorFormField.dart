import 'package:expensetracker/screens/add_category/blocs/create_category_bloc/create_category_bloc.dart';
import 'package:expensetracker/screens/add_category/blocs/create_category_bloc/create_category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

// ignore: must_be_immutable
class ColorFormField extends StatefulWidget {
  ColorFormField(
      {super.key,
      required this.categoryColorController,
      required this.categoryColor});
  TextEditingController categoryColorController;
  Color categoryColor;
  @override
  State<ColorFormField> createState() => _ColorFormFieldState();
}

class _ColorFormFieldState extends State<ColorFormField> {
  Color pickerColor = Colors.blue;

  Color categoryColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.categoryColorController,
      onTap: () {
        showDialog(
            context: context,
            builder: (ctx2) {
              return AlertDialog(
                  content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ColorPicker(
                      pickerColor: categoryColor,
                      onColorChanged: (value) {
                        setState(() {
                          categoryColor = value;
                        });
                      }),
                  SizedBox(
                    width: double.infinity,
                    height: kToolbarHeight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(ctx2);
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: Text(
                        'Save Color',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ));
            });
      },
      // controller: dateController,
      textAlignVertical: TextAlignVertical.center,
      readOnly: true,

      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: categoryColor,
        hintText: 'Color',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
