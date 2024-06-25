import 'package:flutter/material.dart';

ThemeData theme(Brightness brightness) {
  final colors = ColorScheme.fromSeed(
    seedColor: Colors.blueAccent,
    brightness: brightness,
  );
  return ThemeData(
    brightness: brightness,
    colorScheme: colors,
    scaffoldBackgroundColor: colors.surface,
    useMaterial3: true,
  );
}