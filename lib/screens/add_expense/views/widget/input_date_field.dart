import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class InputDateField extends StatefulWidget {
   InputDateField({super.key,required this.dateController});
TextEditingController dateController;
  @override
  State<InputDateField> createState() => _InputDateFieldState();
}

class _InputDateFieldState extends State<InputDateField> {
   DateTime selectDate = DateTime.now();
 
  @override
  void initState() {
    widget.dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
                controller: widget.dateController,
                textAlignVertical: TextAlignVertical.center,
                readOnly: true,
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: selectDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(
                      Duration(days: 365),
                    ),
                  );
                  if (newDate != null) {
                    setState(() {
                     widget. dateController.text =
                          DateFormat('dd/MM/yyyy').format(DateTime.now());
                      selectDate = newDate;
                    });
                  }
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      FontAwesomeIcons.clock,
                      size: 16,
                      color: Colors.grey,
                    ),
                    hintText: 'Date',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none)),
              )
              ;
  }
}