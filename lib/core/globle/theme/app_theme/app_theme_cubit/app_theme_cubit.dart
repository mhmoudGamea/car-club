import 'package:bloc/bloc.dart';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:meta/meta.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitial());
  static AppThemeCubit get(context) => BlocProvider.of(context);
   bool isDark = false;
   void changeAppMode(){
     isDark = ! isDark;
     emit(AppChangeModeState());
   }
}
