import 'package:expensetracker/screens/add_category/blocs/categoriesIcon.dart';
import 'package:expensetracker/screens/add_category/views/widget/colorFormField.dart';
import 'package:expensetracker/screens/add_category/views/widget/nameFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  bool isExpanded = false;
  String iconSelected = '';
 

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Create a category')),
      content: _buildDialogContent(),
    );
  }

  Widget _buildDialogContent() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NameFormField(),
          SizedBox(height: 16),
          _buildIconFormField(),
          isExpanded ? _buildIconGrid() : Container(),
          SizedBox(height: 16),
          ColorFormField(),
        ],
      ),
    );
  }

  

  Widget _buildIconFormField() {
    return TextFormField(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      // controller: dateController,
      textAlignVertical: TextAlignVertical.center,
      readOnly: true,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        suffixIcon: Icon(
          CupertinoIcons.chevron_down,
          size: 12,
        ),
        hintText: 'Icon',
        border: OutlineInputBorder(
          borderRadius: isExpanded
              ? BorderRadius.vertical(top: Radius.circular(12))
              : BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildIconGrid() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: myCategoriesIcons.length,
          itemBuilder: (context, int i) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  iconSelected = myCategoriesIcons[i];
                });
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: iconSelected == myCategoriesIcons[i]
                        ? Colors.green
                        : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage('assets/icons/${myCategoriesIcons[i]}.png'),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }


}