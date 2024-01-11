part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

class SignUpRequired extends SignUpEvent {
  final MyUser user;
  final String password;
  final String role;

  const SignUpRequired({
    required this.user,
    required this.password,
    required this.role,
  });
}
