import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/addItem.dart';
import 'screens/all_items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: const Color(0xFF000000)),
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => const Home(),
        AddExpense.id: (context) => const AddExpense(),
        AllExpenses.id: (context) => const AllExpenses()
      },
    );
  }
}
