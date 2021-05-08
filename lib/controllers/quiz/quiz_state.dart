import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod_quiz/models/question_model.dart';
import 'package:meta/meta.dart';

enum QuizStatus { initial, correct, incorrect, complete }

class QuizState extends Equatable {
  final String selectedAnswer;
  final List<Question> correct;
  final List<Question> incorrect;
  final QuizStatus status;

  bool get answered =>
      status == QuizStatus.incorrect || status == QuizStatus.correct;

  const QuizState({
    @required this.selectedAnswer,
    @required this.correct,
    @required this.incorrect,
    @required this.status,
  });

  @override
  List<Object> get props => [
        selectedAnswer,
        correct,
        incorrect,
        status,
      ];

  QuizState copyWith({
    String selectedAnswer,
    List<Question> correct,
    List<Question> incorrect,
    QuizStatus status,
  }) {
    return QuizState(
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
      correct: correct ?? this.correct,
      incorrect: incorrect ?? this.incorrect,
      status: status ?? this.status,
    );
  }
}
