import 'package:intl/intl.dart';

String moneyFormatted(double value) {
  final formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
  return formatter.format(value);
}
