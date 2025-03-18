import 'package:equatable/equatable.dart';
// import 'package:flutter/foundation.dart';

abstract class AuthState extends Equatable{
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState{
  final String token;

  Authenticated({required this.token});

  @override
  List<Object> get props => [token];

}

class Unautheticated extends AuthState {
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure({required this.message});

  @override
  List<Object> get props => [message];
}