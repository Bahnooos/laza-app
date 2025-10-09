// ignore_for_file: public_member_api_docs, sort_constructors_first
sealed class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState<T> extends SignUpState {
  final T? data;
  SignUpSuccessState({required this.data});
}

class SignUpErrorState extends SignUpState {
  final String? message;

  SignUpErrorState({required this.message});
}
