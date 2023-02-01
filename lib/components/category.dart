import 'package:expense_tracker/constants/category_const.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category(
      {super.key,
      required this.onPressed,
      required this.categoryIcon,
      required this.colorIndex,
      required this.cIndex});
  final Function onPressed;
  final Icon categoryIcon;
  final int colorIndex;
  final int cIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      height: 84.0,
      width: 84.0,
      child: MaterialButton(
        onPressed: (() {
          onPressed();
        }),
        color: cIndex != colorIndex
            ? const Color(0x22FFFFFF)
            : colorList[colorIndex],
        focusColor: colorList[colorIndex],
        child: Center(child: categoryIcon),
      ),
    );
  }
}
