import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final accentColorProvider = Provider<Color>((ref) {
  // In real app fetch from user profile or remote config
  return Colors.blue;
});

ThemeData buildTheme(Color accent) {
  final base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(primary: accent),
    textTheme: GoogleFonts.figtreeTextTheme(base.textTheme).apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
    ),
  );
}
