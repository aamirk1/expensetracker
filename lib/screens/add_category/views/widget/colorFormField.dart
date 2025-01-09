import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

// ignore: must_be_immutable
class ColorFormField extends StatefulWidget {
   ColorFormField({super.key});

  @override
  State<ColorFormField> createState() => _ColorFormFieldState();
}

class _ColorFormFieldState extends State<ColorFormField> {
  Color pickerColor = Colors.blue;

   Color categoryColor = Colors.white ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    onTap: () {
      showDialog(context: context, builder: 
      (ctx2){
        return AlertDialog(content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ColorPicker(pickerColor: categoryColor, onColorChanged: (value){
              setState((){
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
                    'Save',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              )
          ],
        ));
      }
      );
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