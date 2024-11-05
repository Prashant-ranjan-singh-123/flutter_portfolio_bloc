part of 'about_me_cubit.dart';

sealed class AboutMeState extends Equatable {
  const AboutMeState();
}

final class AboutMeInitial extends AboutMeState {
  @override
  List<Object> get props => [];
}
