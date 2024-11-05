part of 'onboard_cubit.dart';

sealed class OnboardState extends Equatable {
  const OnboardState();
}

final class OnboardInitial extends OnboardState {
  bool isLast = false;
  bool isFirst = true;
  OnboardInitial({required this.isLast, required this.isFirst});

  OnboardInitial copyWith({
    bool? isLast,
    bool? isFirst,
  }) {
    return OnboardInitial(
      isFirst: isFirst ?? this.isFirst,
      isLast: isLast ?? this.isLast,
    );
  }

  @override
  List<Object> get props => [isLast, isFirst];
}

final class WaitingState extends OnboardState{
  @override
  List<Object?> get props => [];
}
