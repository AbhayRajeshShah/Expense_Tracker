String parsedDate() {
  DateTime date = DateTime.parse(DateTime.now().toString());
  String parsedDate = '${date.day}-${date.month}-${date.year}';
  return parsedDate;
}
