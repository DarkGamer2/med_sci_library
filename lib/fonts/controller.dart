import 'package:flutter/material.dart';

class FontSizeController {
  static final ValueNotifier<double> fontSize = ValueNotifier(18.0);

  static void setFontSize(String sizeLabel) {
    switch (sizeLabel) {
      case 'Extra Small':
        fontSize.value = 12.0;
        break;
      case 'Small':
        fontSize.value = 14.0;
        break;
      case 'Medium':
        fontSize.value = 18.0;
        break;
      case 'Large':
        fontSize.value = 24.0;
        break;
      case 'Extra Large':
        fontSize.value = 30.0;
        break;
      default:
        fontSize.value = 18.0;
    }
  }
}
