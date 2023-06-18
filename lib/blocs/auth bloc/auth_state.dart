// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class SwiftAccessStates extends Equatable {
  const SwiftAccessStates();
}

class AuthInitialState extends SwiftAccessStates {
  @override
  List<Object?> get props => [];
}

class AuthLoadingState extends SwiftAccessStates {
  @override
  List<Object?> get props => [];
}

class AuthenticatedState extends SwiftAccessStates {
  @override
  List<Object?> get props => [];
}
class AuthLoadedState extends SwiftAccessStates {
  @override
  List<Object?> get props => [];
}
class LencoLoadedState extends SwiftAccessStates {
  @override
  List<Object?> get props => [];
}
class SignedUpState extends SwiftAccessStates {
  @override
  List<Object?> get props => [];
}

class SignedOutState extends SwiftAccessStates {
  @override
  List<Object?> get props => [];
}
// class EmailVerifiedState extends SasereAuthState {
//   @override
//   List<Object?> get props => [];
// }
// class EmailNotVerifiedState extends SasereAuthState {
//   @override
//   List<Object?> get props => [];
// }
class PasswordLinkSentState extends SwiftAccessStates {
  final String message;
  const PasswordLinkSentState({
    required this.message,
  });
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends SwiftAccessStates {
  final Users users;
  const UserLoadedState({
    required this.users,
  });
  @override
  List<Object?> get props => [users];
}

class UserUpdatedState extends SwiftAccessStates {
  @override
  List<Object?> get props => [];
}

class AuthErrorsState extends SwiftAccessStates {
  final String error;
  const AuthErrorsState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}
