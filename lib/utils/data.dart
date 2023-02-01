import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  return File('${await _localPath}/expenses.json');
}

Future<Map> readJson() async {
  File file = await _localFile;
  if (await file.exists()) {
    return jsonDecode(await file.readAsString());
  } else {
    file.writeAsString(jsonEncode({'expenses': [], 'total': 0}));
    return {'expenses': []};
  }
}

Future<void> writeJson(Map expense) async {
  File file = await _localFile;
  Map<dynamic, dynamic> cData = await readJson();
  cData['expenses'].add(expense);
  cData['total'] += expense['price'];
  file.writeAsString(jsonEncode(cData));
}
