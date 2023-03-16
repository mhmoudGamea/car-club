import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'number_of_owners_state.dart';

class NumberOfOwnersCubit extends Cubit<NumberOfOwnersState> {
  NumberOfOwnersCubit() : super(NumberOfOwnersInitial());

  static const List<String> _noOfOwners = ['1', '2', '3', '4', '+4'];

  List<String> get getNoOfOwners {
    return _noOfOwners;
  }

  String? _number;

  String? get getNumber {
    return _number;
  }

  set setNumber(String? number) {
    _number = number;
    emit(NumberOfOwnersSelected());
  }
}
