part of 'app_drawer_cubit.dart';

sealed class AppDrawerState extends Equatable {
  const AppDrawerState();
}

final class AppDrawerInitial extends AppDrawerState {
  @override
  List<Object> get props => [];
}
