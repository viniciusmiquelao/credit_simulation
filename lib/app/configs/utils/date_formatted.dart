import 'package:intl/intl.dart';

String dateFormatted(DateTime value) {
  final formatter = DateFormat.yMd('pt_BR');
  return formatter.format(value);
}
