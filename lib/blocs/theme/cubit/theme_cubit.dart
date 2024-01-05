import 'package:apexive/theme/theme_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeLight());

  toggleThemeState() {
    if (state is ThemeLight) {
      return emit(ThemeDark());
    }
    return emit(ThemeLight());
  }
}
