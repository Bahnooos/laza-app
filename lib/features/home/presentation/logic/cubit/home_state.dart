// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

@immutable
sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeCategoriesSuccess<T> extends HomeState {
  final T? data;
  HomeCategoriesSuccess(this.data);
}

class HomeCategoriesError extends HomeState {
  final String? errorMessage;

  HomeCategoriesError({required this.errorMessage});
}

class HomeProductsSuccess<T> extends HomeState {
  final T? data;
  final bool hasReachedMax;

  HomeProductsSuccess({required this.data, required this.hasReachedMax});
}

class HomeProductsError extends HomeState {
  final String? errorMessage;

  HomeProductsError({required this.errorMessage});
}
