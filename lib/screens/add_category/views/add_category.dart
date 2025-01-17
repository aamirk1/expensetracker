// import 'package:expensetracker/screens/add_category/blocs/create_category_bloc/create_category_bloc.dart';
// import 'package:expensetracker/screens/add_category/blocs/create_category_bloc/create_category_event.dart';
// import 'package:expensetracker/screens/add_category/blocs/create_category_bloc/create_category_state.dart';
// import 'package:expensetracker/screens/add_category/views/widget/categoriesIcon.dart';
// import 'package:expensetracker/screens/add_category/views/widget/colorFormField.dart';
// import 'package:expensetracker/screens/add_category/views/widget/nameFormField.dart';
// import 'package:expensetracker/src/models/category.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:uuid/uuid.dart';

// class AddCategory extends StatefulWidget {
//   const AddCategory({super.key});

//   @override
//   _AddCategoryState createState() => _AddCategoryState();
// }

// class _AddCategoryState extends State<AddCategory> {
 
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: context.read<CreateCategoryBloc>(),
//       child: BlocListener<CreateCategoryBloc, CreateCategoryState>(
//         listener: (context, state) => {
//           if (state is CreateCategorySuccess)
//             {
//               Navigator.pop(context),
//             }
//           else if (state is CreateCategoryLoading)
//             {
//               setState(() {
//                 isLoading == true;
//               })
//             }
//         },
//         child: StatefulBuilder(builder: (context, setState) {
//           return AlertDialog(
//             title: Center(child: Text('Create a category')),
//             content: _buildDialogContent(),
//           );
//         }),
//       ),
//     );
//   }

//   Widget _buildDialogContent() {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           NameFormField(
//             categoryNameController: categoryNameController,
//           ),
//           SizedBox(height: 2),
//           _buildIconFormField(),
//           isExpanded ? _buildIconGrid() : Container(),
//           SizedBox(height: 2),
//           ColorFormField(
//             categoryColorController: categoryColorController,
//             categoryColor: categoryColor,
//           ),
//           SizedBox(height: 16),
//           SizedBox(
//             width: double.infinity,
//             height: kToolbarHeight,
//             child: isLoading == true
//                 ? Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 : TextButton(
//                     onPressed: () {
//                       setState(() {
//                         // isLoading = true;
//                         // create category store logic
//                       category.categoryId = Uuid().v1();
//                       category.name = categoryNameController.text;
//                       category.icon = iconSelected;
//                       // ignore: deprecated_member_use
//                       category.color = categoryColor.value;
//                       });
                      
//                       context
//                           .read<CreateCategoryBloc>()
//                           .add(CreateCategory(category));
                         
//                     },
//                     style: TextButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12))),
//                     child: Text(
//                       'Save Category',
//                       style: TextStyle(fontSize: 22, color: Colors.white),
//                     ),
//                   ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildIconFormField() {
//     return TextFormField(
//       controller: categoryColorController,
//       onTap: () {
//         setState(() {
//           isExpanded = !isExpanded;
//         });
//       },
//       // controller: dateController,
//       textAlignVertical: TextAlignVertical.center,
//       readOnly: true,
//       decoration: InputDecoration(
//         isDense: true,
//         filled: true,
//         fillColor: Colors.white,
//         suffixIcon: Icon(
//           CupertinoIcons.chevron_down,
//           size: 12,
//         ),
//         hintText: 'Icon',
//         border: OutlineInputBorder(
//           borderRadius: isExpanded
//               ? BorderRadius.vertical(top: Radius.circular(12))
//               : BorderRadius.circular(12),
//           borderSide: BorderSide.none,
//         ),
//       ),
//     );
//   }

//   Widget _buildIconGrid() {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: 200,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//             mainAxisSpacing: 5,
//             crossAxisSpacing: 5,
//           ),
//           itemCount: myCategoriesIcons.length,
//           itemBuilder: (context, int i) {
//             return GestureDetector(
//               onTap: () {
//                 setState(() {
//                   iconSelected = myCategoriesIcons[i];
//                 });
//               },
//               child: Container(
//                 width: 50,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     width: 3,
//                     color: iconSelected == myCategoriesIcons[i]
//                         ? Colors.green
//                         : Colors.grey,
//                   ),
//                   borderRadius: BorderRadius.circular(12),
//                   image: DecorationImage(
//                     image:
//                         AssetImage('assets/icons/${myCategoriesIcons[i]}.png'),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
