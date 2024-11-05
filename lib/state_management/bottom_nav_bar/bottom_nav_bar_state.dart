part of 'bottom_nav_bar_cubit.dart';

sealed class BottomNavBarState extends Equatable {
  const BottomNavBarState();
}

final class BottomNavBarInitial extends BottomNavBarState {
  @override
  List<Object> get props => [];
}
