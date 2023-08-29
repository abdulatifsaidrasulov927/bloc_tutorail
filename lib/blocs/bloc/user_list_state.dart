part of 'user_list_bloc.dart';

abstract class UserListState {
  List<UserModel> users;
  UserListState({
    required this.users,
  });
}

class UserListInitial extends UserListState {
  UserListInitial({required List<UserModel> users}) : super(users: users);
}

class UserListUpdated extends UserListState {
  UserListUpdated({required List<UserModel> users}) : super(users: users);
}
