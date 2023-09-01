import 'package:flutter/services.dart';

String? validateEmptyField(String? value, String error) {
  if (value == null) return null;
  return value.isEmpty ? error : null;
}

String? validateEmailField(String? value, String error) {
  if (value == null) return null;
  if (value.isEmpty) return error;
  final regExp = RegExp(
      r"^([0-9a-zA-Z]([\+\-_\.][0-9a-zA-Z]+)*)+@(([0-9a-zA-Z][-\w]*[0-9a-zA-Z]*\.)+[a-zA-Z0-9]{2,17})$");
  if (!regExp.hasMatch(value)) return 'El formato ingresado es inválido.';
  return value.isEmpty ? error : null;
}

String? validateEmptyFieldWithLength(String? value, int min, int max, String error) {
  if (value == null) return null;
  return value.isEmpty
      ? error
      : (value.length >= min && value.length <= max)
          ? null
          : "La longitud requerida del campo debe tener mínimo $min caracteres y máximo $max caracteres";
}

String? validateEmptyFieldWithRegex({
  String? value,
  required int min,
  required int max,
  String? error,
  String? regex,
}) {
  if (value == null) return null;

  if (regex != null && regex.isNotEmpty) {
    final regExp = RegExp(regex);
    if (!regExp.hasMatch(value)) return error;
  }

  return value.isEmpty
      ? error
      : (value.length >= min && value.length <= max)
          ? null
          : "La longitud requerida del campo debe tener mínimo $min caracteres y máximo $max caracteres";
}

String? validateEmptyReferralField(String? value, int min, int max, String error) {
  if (value == null) return null;
  if (value.isEmpty) return null;
  final regExp = RegExp(r'(^[0-9A-Z]{0,15}$)');
  if (!regExp.hasMatch(value)) return 'El formato ingresado es inválido.';

  return (value.length >= min && value.length <= max) ? null : error;
}

String? validatePhoneNumber(String? value, int min, int max, String error) {
  if (value == null) return null;
  if (value.isEmpty) return null;
  final regExp = RegExp(r'(^[0-9]{0,15}$)');
  if (!regExp.hasMatch(value)) return 'El número de teléfono es inválido.';

  return (value.length >= min && value.length <= max) ? null : error;
}

String? validateEmptyRfc(String? value, int min, int max, String error) {
  if (value == null) return null;
  if (value.isEmpty) return error;
  final regExp = RegExp(
      r'^([A-ZÑ&]{3,4}) ?(?:- ?)?(\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])) ?(?:- ?)?([A-Z\d]{2})([A\d])$');
  if (!regExp.hasMatch(value)) return 'El formato ingresado es inválido.';

  return (value.length >= min && value.length <= max) ? null : error;
}

class NumericalRangeFormatter extends TextInputFormatter {
  final int min;
  final int max;

  NumericalRangeFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '') {
      return newValue;
    } else if (int.parse(newValue.text) < min) {
      return const TextEditingValue().copyWith(text: min.toString());
    } else {
      return int.parse(newValue.text) > max ? oldValue : newValue;
    }
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class OnlyLettersAndNumbersFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final hasMatch = RegExp(r'^[A-Za-z0-9]+$').hasMatch(newValue.text);
    if (!hasMatch) {
      return TextEditingValue(
        text: oldValue.text,
        selection: oldValue.selection,
      );
    }
    return TextEditingValue(
      text: newValue.text,
      selection: newValue.selection,
    );
  }
}

class OnlyNumbersFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final hasMatch = RegExp(r'^[0-9]+$').hasMatch(newValue.text);
    if (!hasMatch) {
      return TextEditingValue(
        text: oldValue.text,
        selection: oldValue.selection,
      );
    }
    return TextEditingValue(
      text: newValue.text,
      selection: newValue.selection,
    );
  }
}

class WalletBalanceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final hasMatch = RegExp(r'^[0-9]+$').hasMatch(newValue.text);
    if (!hasMatch) {
      return TextEditingValue(
        text: newValue.text.isEmpty ? newValue.text : oldValue.text,
        selection: newValue.text.isEmpty ? newValue.selection : oldValue.selection,
      );
    }
    return TextEditingValue(
      text: newValue.text,
      selection: newValue.selection,
    );
  }
}

class WalletBalanceWithdollarsFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final hasMatch = RegExp(r'^[0-9$]+$').hasMatch(newValue.text);
    if (!hasMatch) {
      return TextEditingValue(
        text: newValue.text.isEmpty ? newValue.text : oldValue.text,
        selection: newValue.text.isEmpty ? newValue.selection : oldValue.selection,
      );
    }
    return TextEditingValue(
      text: newValue.text,
      selection: newValue.selection,
    );
  }
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}
