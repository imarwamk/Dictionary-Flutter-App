import 'package:dictionary/controller/dictionary_cubit.dart';
import 'package:dictionary/views/dictionary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';





class DictionaryApp extends StatelessWidget {
  const DictionaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => DictionaryCubit(),
        child: const DictionaryScreen(),
      ),
    );
  }
}


