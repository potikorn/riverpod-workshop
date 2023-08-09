// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

ThemeData buildLightTheme() {
  var baseTheme = ThemeData.light(useMaterial3: true);
  return baseTheme.copyWith(
    textTheme: GoogleFonts.kanitTextTheme(baseTheme.textTheme),
  );
}
