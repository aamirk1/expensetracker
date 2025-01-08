import 'package:expensetracker/screens/add_category/views/add_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class InputCategoryField extends StatelessWidget {
   InputCategoryField({super.key, required this.categoryController});
TextEditingController categoryController;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
                textAlignVertical: TextAlignVertical.center,
                readOnly: true,
                onTap: () {},
                controller: categoryController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      FontAwesomeIcons.list,
                      size: 16,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) {
                              return AddCategory(); // Create an instance of AddCategory
                            },
                          );
                          // showDialog(
                          //     context: context,
                          //     builder: (ctx) {
                          //       bool isExpanded = false;
                          //       return StatefulBuilder(
                          //         builder: (context, setState) {
                          //           return AlertDialog(
                          //             title: Center(
                          //                 child: Text('Create a category')),
                          //             content: SizedBox(
                          //               width:
                          //                   MediaQuery.of(context).size.width,
                          //               child: Column(
                          //                 mainAxisSize: MainAxisSize.min,
                          //                 children: [
                          //                   TextFormField(
                          //                     // controller: dateController,
                          //                     textAlignVertical:
                          //                         TextAlignVertical.center,
                          //                     // readOnly: true,

                          //                     decoration: InputDecoration(
                          //                         isDense: true,
                          //                         filled: true,
                          //                         fillColor: Colors.white,
                          //                         hintText: 'Name',
                          //                         border: OutlineInputBorder(
                          //                             borderRadius:
                          //                                 BorderRadius.circular(
                          //                                     12),
                          //                             borderSide:
                          //                                 BorderSide.none)),
                          //                   ),
                          //                   SizedBox(
                          //                     height: 16,
                          //                   ),
                          //                   TextFormField(
                          //                     onTap: () {
                          //                       setState(() {
                          //                         isExpanded = !isExpanded;
                          //                       });
                          //                     },
                          //                     // controller: dateController,
                          //                     textAlignVertical:
                          //                         TextAlignVertical.center,
                          //                     readOnly: true,
                          //                     decoration: InputDecoration(
                          //                       isDense: true,
                          //                       filled: true,
                          //                       fillColor: Colors.white,
                          //                       suffixIcon: Icon(
                          //                         CupertinoIcons.chevron_down,
                          //                         size: 12,
                          //                       ),
                          //                       hintText: 'Icon',
                          //                       border: OutlineInputBorder(
                          //                           borderRadius: isExpanded
                          //                               ? BorderRadius.vertical(
                          //                                   top:
                          //                                       Radius.circular(
                          //                                           12),
                          //                                 )
                          //                               : BorderRadius.circular(
                          //                                   12),
                          //                           borderSide:
                          //                               BorderSide.none),
                          //                     ),
                          //                   ),
                          //                   isExpanded
                          //                       ? Container(
                          //                           width:
                          //                               MediaQuery.of(context)
                          //                                   .size
                          //                                   .width,
                          //                           height: 200,
                          //                           decoration: BoxDecoration(
                          //                             color: Colors.white,
                          //                             borderRadius:
                          //                                 BorderRadius.vertical(
                          //                               bottom:
                          //                                   Radius.circular(12),
                          //                             ),
                          //                           ),
                          //                           child: Padding(
                          //                             padding:
                          //                                 const EdgeInsets.all(
                          //                                     8.0),
                          //                             child: GridView.builder(
                          //                                 gridDelegate:
                          //                                     SliverGridDelegateWithFixedCrossAxisCount(
                          //                                         crossAxisCount:
                          //                                             3,
                          //                                         mainAxisSpacing:
                          //                                             5,
                          //                                         crossAxisSpacing:
                          //                                             5),
                          //                                 itemCount:
                          //                                     myCategoriesIcons
                          //                                         .length,
                          //                                 itemBuilder:
                          //                                     (context, int i) {
                          //                                   return GestureDetector(
                          //                                     onTap: () {
                          //                                       setState(
                          //                                         () {
                          //                                           iconSelected =
                          //                                               myCategoriesIcons[
                          //                                                   i];
                          //                                         },
                          //                                       );
                          //                                     },
                          //                                     child: Container(
                          //                                       width: 50,
                          //                                       height: 50,
                          //                                       decoration:
                          //                                           BoxDecoration(
                          //                                         border: Border.all(
                          //                                             width: 3,
                          //                                             color: iconSelected ==
                          //                                                     myCategoriesIcons[
                          //                                                         i]
                          //                                                 ? Colors
                          //                                                     .green
                          //                                                 : Colors
                          //                                                     .grey),
                          //                                         borderRadius:
                          //                                             BorderRadius
                          //                                                 .circular(
                          //                                                     12),
                          //                                         image:
                          //                                             DecorationImage(
                          //                                           image: AssetImage(
                          //                                               'assets/icons/${myCategoriesIcons[i]}.png'),
                          //                                         ),
                          //                                       ),
                          //                                     ),
                          //                                   );
                          //                                 }),
                          //                           ),
                          //                         )
                          //                       : Container(),
                          //                   SizedBox(
                          //                     height: 16,
                          //                   ),
                          //                   TextFormField(
                          //                     onTap: () {
                          //                       ColorPicker(
                          //                         pickerColor: Colors.blue,
                          //                         onColorChanged:
                          //                             (Color value) {},
                          //                       );
                          //                     },
                          //                     // controller: dateController,
                          //                     textAlignVertical:
                          //                         TextAlignVertical.center,
                          //                     readOnly: true,

                          //                     decoration: InputDecoration(
                          //                         isDense: true,
                          //                         filled: true,
                          //                         fillColor: Colors.white,
                          //                         hintText: 'Color',
                          //                         border: OutlineInputBorder(
                          //                             borderRadius:
                          //                                 BorderRadius.circular(
                          //                                     12),
                          //                             borderSide:
                          //                                 BorderSide.none)),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //           );
                          //         },
                          //       );
                          //     });
                        },
                        icon: Icon(
                          FontAwesomeIcons.plus,
                          size: 16,
                          color: Colors.grey,
                        )),
                    hintText: 'Category',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none)),
              )
             ;
  }
}