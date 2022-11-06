import 'package:flutter/foundation.dart';

import '../generated/app_exception.dart';

class ErrorLogger {
  void logError(Object error, StackTrace? stackTrace) {
    debugPrint('$error, $stackTrace');
  }

  void logAppException(AppException exception) {
    debugPrint('$exception');
  }
}
