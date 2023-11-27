// import 'package:bloc_tutorail/blocs/bloc/user_list_bloc.dart';
// import 'package:bloc_tutorail/ui/home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// void main() {
//   runApp(const App());
// }

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//         providers: [BlocProvider(create: (context) => UserListBloc())],
//         child: const MyApp());
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Hodisalar
enum CounterEvent { increment, decrement }

// Holatlar
class CounterState {
  final int count;
  CounterState(this.count);
}

// Bloc
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event == CounterEvent.increment) {
      yield CounterState(state.count + 1);
    } else if (event == CounterEvent.decrement) {
      yield CounterState(state.count - 1);
    }
  }
}

// Foydalanuvchi Interfeysi
class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc bloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text('Soni: ${state.count}');
              },
            ),
            ElevatedButton(
              onPressed: () {
                bloc.add(CounterEvent.increment);
              },
              child: Text('Qoshish'),
            ),
            ElevatedButton(
              onPressed: () {
                bloc.add(CounterEvent.decrement);
              },
              child: Text('Ayrish'),
            ),
          ],
        ),
      ),
    );
  }
}
