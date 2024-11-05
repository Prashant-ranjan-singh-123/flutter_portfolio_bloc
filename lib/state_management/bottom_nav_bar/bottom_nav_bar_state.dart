part of 'bottom_nav_bar_cubit.dart';

sealed class BottomNavBarState extends Equatable {
  const BottomNavBarState();
}

final class BottomNavBarInitial extends BottomNavBarState {
  int currectPage;
  BottomNavBarInitial({required this.currectPage});

  BottomNavBarInitial copyWith({
    int? currectPage,
  }) {
    return BottomNavBarInitial(currectPage: currectPage ?? this.currectPage);
  }

  @override
  List<Object> get props => [currectPage];
}
