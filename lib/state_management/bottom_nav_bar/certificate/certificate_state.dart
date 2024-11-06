part of 'certificate_cubit.dart';

sealed class CertificateState extends Equatable {
  const CertificateState();
}

final class CertificateInitial extends CertificateState {
  String currentCategory;
  CertificateInitial({required this.currentCategory});

  @override
  List<Object> get props => [currentCategory];
}
