import 'package:bloc_tutorail/model/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserListEvent extends Equatable {}

class AddUser extends UserListEvent {
  final UserModel newUser;
  AddUser({
    required this.newUser,
  });

  @override
  List<Object?> get props => [newUser];
}

class DeleteUser extends UserListEvent {
  final int id;
  DeleteUser({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}

class UpdateUser extends UserListEvent {
  final UserModel user;
  UpdateUser({
    required this.user,
  });

  @override
  List<Object?> get props => [user];
}

class getUser extends UserListEvent {
  @override
  List<Object?> get props => [];
}
