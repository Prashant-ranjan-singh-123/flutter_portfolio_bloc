part of 'onboard_cubit.dart';

sealed class OnboardState extends Equatable {
  const OnboardState();
}

final class OnboardInitial extends OnboardState {
  @override
  List<Object> get props => [];
}
