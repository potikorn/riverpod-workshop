// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:riverpod_guide/application/cart/cart_provider.dart';
import 'package:riverpod_guide/application/home/home_controller.dart';
import 'package:riverpod_guide/presentation/product/screens/products_screen.dart';
import 'package:riverpod_guide/presentation/settings/screens/settings_screen.dart';
import '../../cart/screens/cart_screen.dart';

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
      1 => "/${CartScreen.path}",
      2 => "/${SettingScreen.path}",
      0 || _ => "/${ProductsScreen.path}",
    };
    context.go(path);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(homeController);
    return Scaffold(
      appBar: AppBar(
        title: Text("app_name".tr()),
        centerTitle: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 32.0,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(
                  Icons.shopping_cart,
                  size: 32.0,
                ),
                Consumer(
                  builder: (
                    BuildContext context,
                    WidgetRef ref,
                    Widget? child,
                  ) {
                    final checkoutItemsCount = ref.watch(
                      cartStateNotifierProvider.select(
                        (value) => value.cart.count,
                      ),
                    );
                    return checkoutItemsCount != 0
                        ? Positioned(
                            right: 0.0,
                            child: Badge(
                              label: Text(
                                checkoutItemsCount.toRadixString(10),
                              ),
                            ),
                          )
                        : const SizedBox();
                  },
                ),
              ],
            ),
            label: "Cart",
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 32.0,
            ),
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
