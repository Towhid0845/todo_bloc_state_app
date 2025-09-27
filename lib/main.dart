
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/todo_bloc.dart';
import 'bloc/todo_state.dart';
import 'screens/todo_home_page.dart'; 

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoBloc(),
      child: BlocSelector<TodoBloc, TodoState, bool>(
        selector: (state) => state.isDarkMode, // only listen to theme change
        builder: (context, isDarkMode) {
          return MaterialApp(
            title: 'ToDo App',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: const TodoHomePage(),
          );
        },
      ),
    );
  }
}
