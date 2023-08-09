// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:riverpod_guide/application/home/home_controller.dart';
import 'package:riverpod_guide/presentation/product/screens/products_screen.dart';
import 'package:riverpod_guide/presentation/settings/screens/settings_screen.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  static String named = "home";
  static String path = "/";

  final pages = [
    const ProductsScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(homeController);
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
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
        onTap: (currentIndex) {
          ref.read(homeController.notifier).setSelectedIndex(currentIndex);
        },
      ),
      body: pages.elementAt(selectedIndex),
    );
  }
}
