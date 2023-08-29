part of 'user_list_bloc.dart';

@immutable
sealed class UserListEvent {}

class AddUser extends UserListEvent {
  final UserModel user;
  //  userListBloc(context).add(AddUser(user :user));
  AddUser({
    required this.user,
  });
}

class DeleteUser extends UserListEvent {
  final UserModel user;
  DeleteUser({
    required this.user,
  });
}

class UpdateUser extends UserListEvent {
  final UserModel user;
  UpdateUser({
    required this.user,
  });
}
