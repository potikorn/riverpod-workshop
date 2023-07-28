import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_guide/application/router/app_routes.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      routerConfig: getRoutes(ref),
    );
  }
}

ThemeData _buildTheme() {
  var baseTheme = ThemeData.light(useMaterial3: true);
  return baseTheme.copyWith(
    textTheme: GoogleFonts.kanitTextTheme(baseTheme.textTheme),
  );
}
