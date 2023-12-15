part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object?> get props => [];
}

class SignInRequired extends SignInEvent {
  final String email;
  final String password;

  const SignInRequired({
    required this.email,
    required this.password,
  });
}

class SignOutRequired extends SignInEvent {
  const SignOutRequired();
}
