import 'package:expense_tracker/constants/category_const.dart';
import 'package:flutter/material.dart';
import '../components/category.dart';
import '../utils/data.dart';
import '../constants/functions.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});
  static const id = 'addExpense';
  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  String productdesc = '';
  int categoryIndex = 0;
  late int price;
  List<Expanded> categoryList(int start, int end) {
    List<Expanded> temp = [];
    for (int i = start; i < end; i++) {
      temp.add(
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(16.0),
            child: Category(
              categoryIcon: Icon(
                iconsList[i],
                size: 24,
              ),
              cIndex: categoryIndex,
              colorIndex: i,
              onPressed: () {
                setState(() {
                  categoryIndex = i;
                });
              },
            ),
          ),
        ),
      );
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48.0),
                  color: const Color(0x22FFFFFF),
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) => setState(() {
                    productdesc = value;
                  }),
                  style: const TextStyle(height: 1.5, fontSize: 18.0),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Expense Description'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.currency_rupee,
                    size: 125.0,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(height: 2.25, fontSize: 32.0),
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(),
                        ),
                        onChanged: (value) => setState(() {
                          price = int.parse(value);
                        }),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Wrap(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: categoryList(0, 3),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      children: categoryList(3, iconsList.length),
                    )
                  ]),
                  const SizedBox(
                    height: 32.0,
                  ),
                ],
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(100.0)),
                clipBehavior: Clip.hardEdge,
                child: MaterialButton(
                  onPressed: () {
                    writeJson({
                      'date': parsedDate(),
                      'price': price,
                      'desc': productdesc,
                      'categoryIndex': categoryIndex
                    });
                    Navigator.pushNamed(context, 'home');
                  },
                  color: colorList[ColorDescs.blue.index],
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: const Center(
                      child: Text(
                    'ADD',
                    style: TextStyle(color: Color(0xFF333333)),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
