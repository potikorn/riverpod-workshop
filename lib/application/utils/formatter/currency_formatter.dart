import 'package:currency_formatter/currency_formatter.dart';

class CurrencyFormatUtils {
  static String formatInUSD(dynamic amount) {
    return CurrencyFormatter.format(
      amount,
      CurrencyFormatterSettings.usd,
      enforceDecimals: true,
    );
  }
}
