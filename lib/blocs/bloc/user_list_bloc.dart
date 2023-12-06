import 'package:bloc/bloc.dart';
import 'package:bloc_tutorail/blocs/bloc/user_list_event.dart';
import 'package:bloc_tutorail/blocs/bloc/user_list_state.dart';
import 'package:bloc_tutorail/model/form_status.dart';
import 'package:bloc_tutorail/model/user_model.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  UserListBloc()
      : super(UserListState(
            users: [], error: '', status: FormStatus.pure, statusText: '')) {
    on<AddUser>(_addUser);
    on<DeleteUser>(_deleteUser);
    on<UpdateUser>(_updateUser);
    on<getUser>(_getUser);
  }

  _addUser(AddUser event, Emitter<UserListState> emit) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: 'Adding ...',
      ),
    );
    await Future.delayed(const Duration(seconds: 2));
    emit(
      state.copyWith(
          status: FormStatus.success,
          statusText: 'Done !!!',
          users: [...state.users, event.newUser]),
    );
  }

  _deleteUser(DeleteUser event, Emitter<UserListState> emit) async {
    List<UserModel> currentUser = state.users;

    emit(
        state.copyWith(status: FormStatus.loading, statusText: 'Delating ...'));
    await Future.delayed(
      const Duration(seconds: 2),
    );
    currentUser.removeWhere(
      (element) => element.id == event.id,
    );
    emit(state.copyWith(
      status: FormStatus.success,
      statusText: 'Done !!!',
      users: currentUser,
    ));
  }

  _updateUser(UpdateUser event, Emitter<UserListState> emit) async {
    List<UserModel> currentUser = state.users;
    emit(
        state.copyWith(status: FormStatus.loading, statusText: 'Updating ...'));
    await Future.delayed(const Duration(seconds: 2));
    for (int i = 0; i < state.users.length; i++) {
      if (event.user.id == currentUser[i].id) {
        currentUser[i] = event.user;
      }
    }
    emit(state.copyWith(
        status: FormStatus.success,
        statusText: 'Done !!!',
        users: currentUser));
  }

  _getUser(getUser event, Emitter<UserListState> emit) async {
    emit(
        state.copyWith(status: FormStatus.loading, statusText: 'Fetching ...'));
    await Future.delayed(
      const Duration(seconds: 2),
    );

    emit(state
        .copyWith(status: FormStatus.success, statusText: 'Done !!!', users: [
      UserModel(email: 'ok', name: 'fnefe', id: 1),
      UserModel(email: 'ol', name: 'fnefe', id: 2),
      UserModel(email: 'po', name: 'fnefe', id: 3),
      UserModel(email: 'mo', name: 'fnefe', id: 4),
      UserModel(email: 'ik', name: 'fnefe', id: 5),
      UserModel(email: 'ko', name: 'fnefe', id: 6),
    ]));
  }
}
