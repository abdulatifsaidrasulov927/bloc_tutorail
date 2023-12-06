import 'package:bloc_tutorail/blocs/bloc/user_list_bloc.dart';
import 'package:bloc_tutorail/blocs/bloc/user_list_event.dart';
import 'package:bloc_tutorail/blocs/bloc/user_list_state.dart';
import 'package:bloc_tutorail/model/form_status.dart';
import 'package:bloc_tutorail/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Crud'),
      ),
      backgroundColor: Colors.yellow,
      body: Stack(
        children: [
          BlocConsumer<UserListBloc, UserListState>(
            builder: (context, state) {
              return ListView(
                children: [
                  ...List.generate(state.users.length, (index) {
                    UserModel userModel = state.users[index];
                    return ListTile(
                      title: Text(
                        '${userModel.id}',
                      ),
                    );
                  })
                ],
              );
            },
            listener: (context, state) {},
          ),
          Visibility(
            visible: context.watch<UserListBloc>().state.status ==
                FormStatus.loading,
            child: const Align(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
      floatingActionButton: Row(children: [
        FloatingActionButton(
          onPressed: () {
            BlocProvider.of<UserListBloc>(context).add(AddUser(
                newUser: UserModel(email: 'iegiue', name: 'ifefne', id: 6)));
          },
          heroTag: 'add',
          child: const Icon(Icons.add),
        ),
      ]),
    );
  }
}
