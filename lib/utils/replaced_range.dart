import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../generated/addon/alert_dialogs.dart';
import 'app_exception.dart';

extension StringHardcoded on String {
  String get hardcoded => this;
}

extension AppExceptionDetails on AppException {
  AppExceptionData get details {
    return when(
      // Auth
      emailAlreadyInUse: () => AppExceptionData(
        'email-already-in-use',
        'Email already in use'.hardcoded,
      ),
      weakPassword: () => AppExceptionData(
        'weak-password',
        'Password is too weak'.hardcoded,
      ),
      wrongPassword: () => AppExceptionData(
        'wrong-password',
        'Wrong password'.hardcoded,
      ),
      userNotFound: () => AppExceptionData(
        'user-not-found',
        'User not found'.hardcoded,
      ),
      // Orders
      parseOrderFailure: (status) => AppExceptionData(
        'parse-order-failure',
        'Could not parse order status: $status'.hardcoded,
      ),
    );
  }
}

extension AsyncValueUI on AsyncValue {
  void showAlertDialogOnError(BuildContext context) {
    if (!isRefreshing && hasError) {
      final message = _errorMessage(error);
      showExceptionAlertDialog(
        context: context,
        title: 'Error'.hardcoded,
        exception: message,
      );
    }
  }

  String _errorMessage(Object? error) {
    if (error is AppException) {
      return error.details.message;
    } else {
      return error.toString();
    }
  }
}
