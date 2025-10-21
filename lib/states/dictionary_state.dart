abstract class DictionaryState {}

class DictionaryInitial extends DictionaryState {}

class DictionaryLoading extends DictionaryState {}

class DictionarySuccess extends DictionaryState {
  final String word;
  final String meaning;
  final String example;

  DictionarySuccess(this.word, this.meaning, this.example);
}

class DictionaryFailure extends DictionaryState {
  final String message;

  DictionaryFailure(this.message);
}