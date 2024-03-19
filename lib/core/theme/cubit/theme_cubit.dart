import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mywebsite/core/theme/cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(isLightThemeOn: false));
  void updateTheme(bool value) => emit(ThemeState(isLightThemeOn: value));
}
