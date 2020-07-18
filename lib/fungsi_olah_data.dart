import 'package:shared_preferences/shared_preferences.dart';

Future<void> simpanData(String key, List<String> value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setStringList(key, value);
}

Future<List<String>> ambilData(String key) async {
  final prefs = await SharedPreferences.getInstance();
  final List<String> valueList = prefs.getStringList(key ?? []);
  return valueList;
}

Future<void> hapusData(String key) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(key);
}