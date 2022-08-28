import 'package:intl/intl.dart';

String rupiahFormat(int price) {
  return NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(price);
}
