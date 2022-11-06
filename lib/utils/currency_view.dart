import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final currencyFormatterProvider = Provider<NumberFormat>((ref) {
  return NumberFormat.currency(locale: "en_US", symbol: "₹");
});
