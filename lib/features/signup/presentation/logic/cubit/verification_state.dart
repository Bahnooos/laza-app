// ignore_for_file: public_member_api_docs, sort_constructors_first
sealed class VerificationState {}

class VerificationInitialState extends VerificationState {}

class VerificationLoading extends VerificationState {}

class VerificationSuccess<T> extends VerificationState {
  T? data;
  VerificationSuccess({this.data});
}

class VerificationError extends VerificationState {
  final String? errorMessage;

  VerificationError({required this.errorMessage});
}
