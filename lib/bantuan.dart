import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

String formatDateFromString(String date) {
  initializeDateFormatting();
  DateTime dateFormat = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
  return DateFormat('EEEE, dd MMMM yyyy hh:mm:ss', 'id_ID').format(dateFormat);
}

String formatDateFromDateTime(DateTime date) {
  initializeDateFormatting();
  return DateFormat('EEEE, dd MMMM yyyy hh:mm:ss', 'id_ID').format(date);
}

String formatDateYMDFromDateTime(DateTime date) {
  initializeDateFormatting();
  return DateFormat('yyyy-MM-dd hh:mm:ss', 'id_ID').format(date);
}
