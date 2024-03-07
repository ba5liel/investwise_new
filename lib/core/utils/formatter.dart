import 'package:intl/intl.dart';

class AppFormatter {
  static String formatValidationErrorMessage(
      String title, Map<String, dynamic> error) {
    final errorMessage = StringBuffer();

    errorMessage.write('${title.toUpperCase()}:\n');

    error.forEach((field, messages) {
      if (messages is List) {
        for (final message in messages) {
          errorMessage.write('- $message\n');
        }
      } else if (messages is String) {
        errorMessage.write('- $messages\n');
      }
    });

    return errorMessage.toString();
  }

  static String formatCurrency(double price) {
    final format =
        NumberFormat.currency(locale: "en_US", symbol: "\$", decimalDigits: 2);
    return format.format(price);
  }
}
