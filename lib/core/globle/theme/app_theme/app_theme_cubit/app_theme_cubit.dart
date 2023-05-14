import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitial());
  // static AppThemeCubit get(context) => BlocProvider.of(context);
  var _isDark = false;
  bool get getDark {
    return _isDark;
  }

  void changeAppMode() {
    _isDark = !_isDark;
    emit(AppChangeModeState());
  }
}
