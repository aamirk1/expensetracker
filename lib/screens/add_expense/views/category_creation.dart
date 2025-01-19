import 'package:expensetracker/screens/add_category/blocs/create_category_bloc/create_category_bloc.dart';
import 'package:expensetracker/screens/add_category/blocs/create_category_bloc/create_category_event.dart';
import 'package:expensetracker/screens/add_category/blocs/create_category_bloc/create_category_state.dart';
import 'package:expensetracker/screens/add_expense/views/widget/categoriesIcon.dart';
import 'package:expensetracker/src/models/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:uuid/uuid.dart';

Future getCategoryCreation(BuildContext context) {
  return showDialog(
      context: context,
      builder: (ctx) {
        bool isExpanded = false;
        String iconSelected = '';
        TextEditingController categoryNameController = TextEditingController();
        TextEditingController categoryIconController = TextEditingController();
        TextEditingController categoryColorController = TextEditingController();
        bool isLoading = false;
        Color categoryColor = Colors.white;
        Category category = Category.empty;

        return BlocProvider.value(
          value: context.read<CreateCategoryBloc>(),
          child: StatefulBuilder(
            builder: (context, setState) {
              return BlocListener<CreateCategoryBloc, CreateCategoryState>(
                listener: (context, state) => {
                  if (state is CreateCategorySuccess)
                    {
                      Navigator.pop(ctx, category),
                    }
                  else if (state is CreateCategoryLoading)
                    {
                      setState(() {
                        isLoading = true;
                      })
                    }
                  else if (state is CreateCategoryFailure)
                    {
                      setState(() {
                        isLoading = false;
                      })
                    }
                },
                child: AlertDialog(
                  title: Center(child: Text('Create a category')),
                  content: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: categoryNameController,
                            textAlignVertical: TextAlignVertical.center,
                            // readOnly: true,
                      
                            decoration: InputDecoration(
                                isDense: true,
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Category Name',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none)),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            onTap: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                            controller: categoryIconController,
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
                                      ? BorderRadius.vertical(
                                          top: Radius.circular(12),
                                        )
                                      : BorderRadius.circular(12),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          isExpanded
                              ? Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(12),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                mainAxisSpacing: 5,
                                                crossAxisSpacing: 5),
                                        itemCount: myCategoriesIcons.length,
                                        itemBuilder: (context, int i) {
                                          return GestureDetector(
                                            onTap: () {
                                              setState(
                                                () {
                                                  iconSelected =
                                                      myCategoriesIcons[i];
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 3,
                                                    color: iconSelected ==
                                                            myCategoriesIcons[i]
                                                        ? Colors.green
                                                        : Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/icons/${myCategoriesIcons[i]}.png'),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: categoryColorController,
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12))),
                                              child: Text(
                                                'Save Color',
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  });
                            },
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
                          ),
                          SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            height: kToolbarHeight,
                            child: isLoading == true
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : TextButton(
                                    onPressed: () {
                                      // isLoading = true;
                                      // create category store logic
                                      setState(() {
                                        category.categoryId = Uuid().v1();
                                        category.name =
                                            categoryNameController.text;
                                        category.icon = iconSelected;
                                        // ignore: deprecated_member_use
                                        category.color = categoryColor.value;
                                      });
                                      context
                                          .read<CreateCategoryBloc>()
                                          .add(CreateCategory(category));
                                    },
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12))),
                                    child: Text(
                                      'Save Category',
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.white),
                                    ),
                                  ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      });
}
