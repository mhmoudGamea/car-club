import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'form_state.dart';

class FormCubit extends Cubit<FormState> {
  FormCubit() : super(FormInitial());
}
