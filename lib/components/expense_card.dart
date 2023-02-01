import 'package:expense_tracker/constants/category_const.dart';
import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard(
      {super.key,
      required this.expenseDesc,
      required this.colour,
      required this.date,
      required this.price,
      required this.categoryName});

  final String expenseDesc;
  final Color colour;
  final String date;
  final String categoryName;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            stops: const [0.96, 0.96],
            colors: [const Color(0x22FFFFFF), colour]),
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expenseDesc.toUpperCase(),
                style: const TextStyle(fontSize: 18.0),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                categoryName,
                style:
                    const TextStyle(color: Color(0xFF9CA3AF), fontSize: 12.0),
              ),
              const SizedBox(
                height: 6.0,
              ),
              Text(
                date,
                style:
                    const TextStyle(color: Color(0xFF9CA3AF), fontSize: 12.0),
              ),
            ],
          ),
          Text(
            '- $price',
            style: const TextStyle(fontSize: 24.0),
          )
        ],
      ),
    );
  }
}
