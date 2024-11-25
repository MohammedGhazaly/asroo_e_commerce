import 'package:asroo_ecommerce/core/services/shared_pref/pref_keys.dart';
import 'package:asroo_ecommerce/core/services/shared_pref/shared_pref_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState.initial());
  bool isDark = true;
  Future<void> changeAppTheme({bool? themeMode}) async {
    if (themeMode != null) {
      print("HERE");
      isDark = themeMode;
      emit(ThemeState.themeModeChanged(isDark: isDark));
    } else {
      isDark = !isDark;
      await SharedPrefService.instance.setBoolean(PrefKeys.temeMode, isDark);
      emit(ThemeState.themeModeChanged(isDark: isDark));
    }
  }

  // String langauge= "en";
  // Future<void> changeAppLanguage({String? langaugeInput}) async {
  //   if (langaugeInput != null) {

  //     langauge = langaugeInput;
  //     emit(const ThemeState.languageChanged());
  //   } else {
  //     langauge = langaugeInput;
  //     await SharedPrefService.instance.setBoolean(PrefKeys., isDark);
  //     emit(ThemeState.themeModeChanged(isDark: isDark));
  //   }
  // }
  void languageChanged() {
    emit(ThemeState.languageChanged());
  }
}
