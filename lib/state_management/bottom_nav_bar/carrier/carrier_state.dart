part of 'carrier_cubit.dart';

sealed class CarrierState extends Equatable {
  const CarrierState();
}

final class CarrierInitial extends CarrierState {
  @override
  List<Object> get props => [];
}
