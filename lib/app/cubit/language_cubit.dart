import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit(Locale locale) : super(LanguageState(language: locale));

  Future<void> changeLanguage(Locale locale) async {
    emit(state.copyWith(language: locale));
  }
}
