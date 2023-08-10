// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:riverpod_guide/application/home/home_controller.dart';
import 'package:riverpod_guide/presentation/product/screens/products_screen.dart';
import 'package:riverpod_guide/presentation/settings/screens/settings_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
    required this.child,
  });

  static String named = "home";
  static String path = "/";

  final Widget child;

  void _onTap(
    BuildContext context, {
    required int index,
    required WidgetRef ref,
  }) {
    ref.read(homeController.notifier).setSelectedIndex(index);
    final path = switch (index) {
      0 => "/${ProductsScreen.path}",
      1 => "/${SettingScreen.path}",
      _ => "/${ProductsScreen.path}",
    };
    context.go(path);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(homeController);
    return Scaffold(
      appBar: AppBar(title: const Text("Main App")),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (currentIndex) => _onTap(
          context,
          index: currentIndex,
          ref: ref,
        ),
      ),
      body: child,
    );
  }
}
