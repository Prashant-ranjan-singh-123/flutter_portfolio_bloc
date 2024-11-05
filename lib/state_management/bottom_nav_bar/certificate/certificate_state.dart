part of 'certificate_cubit.dart';

sealed class CertificateState extends Equatable {
  const CertificateState();
}

final class CertificateInitial extends CertificateState {
  @override
  List<Object> get props => [];
}
