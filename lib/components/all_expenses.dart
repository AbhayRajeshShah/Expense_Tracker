import './expense_card.dart';
import '../constants/category_const.dart';

List<ExpenseCard> getRecentExpenses(List expenses, int start, int end) {
  expenses = expenses.reversed.toList();
  List<ExpenseCard> recentExpenses = [];
  for (int i = start; i < end; i++) {
    recentExpenses.add(ExpenseCard(
      expenseDesc: expenses[i]['desc'],
      colour: colorList[expenses[i]['categoryIndex']],
      date: expenses[i]['date'],
      price: expenses[i]['price'],
      categoryName: categoryNames[expenses[i]['categoryIndex']],
    ));
  }
  return recentExpenses;
}
