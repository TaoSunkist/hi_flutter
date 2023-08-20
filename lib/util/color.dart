import 'package:flutter/material.dart';

const MaterialColor materialColors = MaterialColor(0xFFB388FF, {
  50: Color(0xFFE7D9FC),
  100: Color(0xFFD1BDF8),
  200: Color(0xFFBDA2F5),
  300: Color(0xFFA78BF1),
  400: Color(0xFF9366EC),
  500: Color(0xFF7E41E6),
  600: Color(0xFF733BDF),
  700: Color(0xFF6834D9),
  800: Color(0xFF5D2DD3),
  900: Color(0xFF4B20C9),
});

MaterialColor materialColor =
    MaterialColor(materialColors.shade900.value, const <int, Color>{50: const Color(0xff123233)});
