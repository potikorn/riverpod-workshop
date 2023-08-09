// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeController =
    StateNotifierProvider.autoDispose<HomeScreenState, int>((ref) {
  return HomeScreenState();
});

class HomeScreenState extends StateNotifier<int> {
  HomeScreenState([state]) : super(state ?? 0);

  void setSelectedIndex(currentIndex) {
    state = currentIndex;
  }
}
