import 'package:expense_tracker/screens/all_items.dart';
import 'package:flutter/material.dart';
import './addItem.dart';
import '../utils/data.dart';
import '../components/all_expenses.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const id = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Map<dynamic, dynamic> expenses = {'expenses': [], 'total': 0};

  @override
  Widget build(BuildContext context) {
    readJson().then((value) {
      if (mounted) {
        setState(() {
          expenses = value;
        });
      }
    });
    return Scaffold(
      floatingActionButton: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, AddExpense.id);
        },
        child: Container(
          width: 72.0,
          height: 72.0,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: const Color(0x22ffffff),
              borderRadius: BorderRadius.circular(999)),
          child: const Center(
            child: Text(
              '+',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'DASHBOARD',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(
                width: 0,
                height: 48.0,
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48.0),
                  color: const Color(0xFF34D399),
                ),
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage('images/hero.png'),
                      height: 177.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'THIS MONTH',
                          style: TextStyle(
                              color: Color(0xffffffff), fontSize: 12.0),
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          children: [
                            const Icon(
                              Icons.currency_rupee,
                              color: Color(0xFF000000),
                              size: 36.0,
                            ),
                            Text(
                              expenses['total'].toString(),
                              style: const TextStyle(
                                  fontSize: 32.0, color: Colors.black),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 36.0,
              ),
              (expenses['expenses'].isNotEmpty
                  ? Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'RECENT PURCHASES',
                                style: TextStyle(
                                    color: Color(0xFF9CA3AF), fontSize: 14.0),
                              ),
                              MaterialButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, AllExpenses.id);
                                  },
                                  child: const Text(
                                    'VIEW ALL',
                                    style: TextStyle(
                                      color: Color(0xFF9CA3AF),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Column(
                          children: getRecentExpenses(
                              expenses['expenses'],
                              0,
                              (expenses['expenses'].length > 2
                                  ? 2
                                  : expenses['expenses'].length)),
                        ),
                      ],
                    )
                  : const Expanded(
                      child: Center(
                          child: Text(
                        'No Expenses Yet',
                        style:
                            TextStyle(color: Color(0xFF999999), fontSize: 18.0),
                      )),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
