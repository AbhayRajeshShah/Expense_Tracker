import 'package:flutter/material.dart';
import '../components/all_expenses.dart';
import '../utils/data.dart';
import 'package:pie_chart/pie_chart.dart';
import '../constants/category_const.dart';

class AllExpenses extends StatefulWidget {
  const AllExpenses({super.key});
  static const id = 'all';
  @override
  State<AllExpenses> createState() => _AllExpensesState();
}

class _AllExpensesState extends State<AllExpenses> {
  Map expenses = {'expenses': [], 'total': 0};
  Map<String, double> categories = {};
  bool loaded = false;
  @override
  Widget build(BuildContext context) {
    readJson().then((value) {
      if (mounted) {
        setState(() {
          expenses = value;
          for (int i = 0; i < categoryNames.length; i++) {
            categories[categoryNames[i]] = categoryTotal(expenses['expenses']
                .where((e) => e['categoryIndex'] == i)
                .toList());
          }
          loaded = true;
        });
      }
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: (loaded
              ? Column(
                  children: [
                    PieChart(
                      dataMap: categories,
                      colorList: colorList,
                      chartRadius: MediaQuery.of(context).size.width / 1.5,
                      legendOptions: const LegendOptions(
                        legendPosition: LegendPosition.bottom,
                        showLegendsInRow: true,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Center(
                      child: Text('ALL EXPENSES'),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Expanded(
                      child: ListView(
                        children: getRecentExpenses(expenses['expenses'], 0,
                            expenses['expenses'].length),
                      ),
                    ),
                  ],
                )
              : const Text('Loading ...')),
        ),
      ),
    );
  }
}

double categoryTotal(List category) {
  num total = 0;
  for (int i = 0; i < category.length; i++) {
    total += category[i]['price'];
  }
  return total.toDouble();
}
