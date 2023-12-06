import 'package:bloc_tutorail/model/form_status.dart';
import 'package:bloc_tutorail/model/user_model.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserListState extends Equatable {
  UserListState({
    required this.error,
    required this.status,
    required this.users,
    required this.statusText,
  });
  final FormStatus status;
  final String error;
  final String statusText;
  List<UserModel> users;

  @override
  List<Object?> get props => [users, error, error, statusText];

  UserListState copyWith({
    List<UserModel>? users,
    FormStatus? status,
    String? statusText,
    String? error,
  }) =>
      UserListState(
          status: status ?? this.status,
          statusText: statusText ?? this.statusText,
          users: users ?? this.users,
          error: error ?? this.error);
}

// class UserListInitial extends UserListState {
//   UserListInitial({required List<UserModel> users}) : super(users: users);
//   // UserListBloc():super(UserListInitial(users: []));
// }

// class UserListUpdated extends UserListState {
//   UserListUpdated({required List<UserModel> users}) : super(users: users);
//   // emit(UserListUpdated(user:state.users));
// }
