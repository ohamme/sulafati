import 'package:intl/intl.dart';

import '../constants/app_constants.dart';

class CurrencyFormatter {
  CurrencyFormatter._();

  static final NumberFormat _numberFormat = NumberFormat.decimalPattern(
    'en_US',
  );

  static String format(num amount) {
    return "${_numberFormat.format(amount)} ${AppConstants.currency}";
  }
}
