import 'package:dictionary/states/dictionary_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final Dio _dio = Dio();

  DictionaryCubit() : super(DictionaryInitial());

  Future<void> search(String word) async {
    emit(DictionaryLoading());
    try {
      final response = await _dio.get(
        "https://api.dictionaryapi.dev/api/v2/entries/en/$word",
      );
      final data = response.data[0];
      final meaning =
          data["meanings"][0]["definitions"][0]["definition"] ??
          "No meaning found";
      final example =
          data["meanings"][0]["definitions"][0]["example"] ??
          "No example available yet.";
      emit(DictionarySuccess(word, meaning, example));
    } catch (e) {
      emit(DictionaryFailure("Word not found"));
    }
  }
}

List<String> favorite = [];

void addToFavorites(String word) {
  if (!favorite.contains(word)) {
    favorite.add(word);
  }
}