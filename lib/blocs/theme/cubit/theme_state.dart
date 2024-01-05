part of 'theme_cubit.dart';

sealed class ThemeState extends Equatable {
  final ThemeMode themeMode;
  final ThemeData themeData;
  final List<Color> gradient;
  const ThemeState(
      {required this.themeData,
      required this.themeMode,
      required this.gradient});

  @override
  List<Object> get props => [];
}

final class ThemeLight extends ThemeState {
  ThemeLight()
      : super(
            themeData: ThemePallete.lightTheme,
            themeMode: ThemeMode.light,
            gradient: ThemePallete.lightGradient);
}

final class ThemeDark extends ThemeState {
  ThemeDark()
      : super(
            themeData: ThemePallete.darkTheme,
            themeMode: ThemeMode.dark,
            gradient: ThemePallete.darkGradient);
}
