part of 'theme_cubit.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState.initial() = _Initial;
  const factory ThemeState.themeModeChanged({required bool isDark}) =
      _ThemeModeChangedState;
  const factory ThemeState.languageChanged() = _LanguageChangedState;
}
