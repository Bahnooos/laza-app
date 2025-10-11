import 'package:flutter/material.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}

final class LoginSuccess<T> extends LoginState {
  final T? data;

  LoginSuccess({required this.data});
}

final class LoginError extends LoginState {
  final String? errorMessage;

  LoginError({required this.errorMessage});
}
