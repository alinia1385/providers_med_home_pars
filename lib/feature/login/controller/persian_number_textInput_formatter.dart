import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PersianNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;
    if (newText.isNotEmpty) {
      String formattedValue = '';
      for (int i = 0; i < newText.length; i++) {
        switch (newText[i]) {
          case '0':
            formattedValue += '۰';
            break;
          case '1':
            formattedValue += '۱';
            break;
          case '2':
            formattedValue += '۲';
            break;
          case '3':
            formattedValue += '۳';
            break;
          case '4':
            formattedValue += '۴';
            break;
          case '5':
            formattedValue += '۵';
            break;
          case '6':
            formattedValue += '۶';
            break;
          case '7':
            formattedValue += '۷';
            break;
          case '8':
            formattedValue += '۸';
            break;
          case '9':
            formattedValue += '۹';
            break;
          default:
            formattedValue += newText[i];
            break;
        }
      }
      return newValue.copyWith(text: formattedValue);
    }
    return newValue;
  }
}
