part of 'language_cubit.dart';

class LanguageState extends Equatable {
  const LanguageState({
    required this.language,
  });

  final Locale language;

  LanguageState copyWith({
    Locale? language,
  }) {
    return LanguageState(
      language: language ?? this.language,
    );
  }

  @override
  List<Object> get props => [
        language,
      ];
}
