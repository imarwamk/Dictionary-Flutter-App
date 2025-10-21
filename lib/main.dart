import 'package:dictionary/controller/dictionary_cubit.dart';
import 'package:dictionary/views/dictionary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ناخذ نسخه من الشيرد بريفيرنسس
  sharedPreferences = await SharedPreferences.getInstance();
  bool isDarkMode = false;

  runApp(
    BlocProvider(
      create: (create) => DictionaryCubit(),
      child: MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: DictionaryScreen(),
      ),
    ),
  );
}
