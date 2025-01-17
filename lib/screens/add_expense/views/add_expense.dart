import 'package:expensetracker/screens/add_category/blocs/get_category_bloc/get_categories_bloc.dart';
import 'package:expensetracker/screens/add_category/blocs/get_category_bloc/get_categories_state.dart';
import 'package:expensetracker/screens/add_expense/views/category_creation.dart';
import 'package:expensetracker/screens/add_expense/views/widget/input_amount_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectDate = DateTime.now();

  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          automaticallyImplyLeading: false,
        ),
        body: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
          builder: (context,  state) {
             if (state is GetCategoriesSuccess) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Add Expenses',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  InputAmountField(
                    expenseController: expenseController,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Column(
                    children: [
                      TextFormField(
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
                              onPressed: () async {
                                var test = await getCategoryCreation(context);
                                print(test);
                                setState(() {
                                  state.categories.insert(0, test);
                                });
                                // showDialog(
                                //   context: context,
                                //   builder: (ctx) {
                                //     return BlocProvider.value(
                                //         value: context.read<CreateCategoryBloc>(),
                                //         child:
                                //             AddCategory()); // Create an instance of AddCategory
                                //   },
                                // );
                              },
                              icon: Icon(
                                FontAwesomeIcons.plus,
                                size: 16,
                                color: Colors.grey,
                              )),
                          hintText: 'Category',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(12)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(bottom: Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:  ListView.builder(
                                itemCount: state.categories.length,
                                itemBuilder: (context, int i) {
                                  print('heee ${state.categories[i].color}');
                                  return Card(
                                    child: ListTile(
                                      leading: Image.asset(
                                        'assets/icons/${state.categories[i].icon}.png',
                                        scale: 1.5,
                                      ),
                                      title: Text(state.categories[i].name),
                                      tileColor: Color(state.categories[i].color),
                                      // tileColor: Color(state.categories[i].color),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  );
                                },
                              ),
                        ),
                        
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: dateController,
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
                          dateController.text =
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
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: kToolbarHeight,
                    child: TextButton(
                      onPressed: () {},
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
              ),
            );
            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
          }
        ),
      ),
    );
  }
}
