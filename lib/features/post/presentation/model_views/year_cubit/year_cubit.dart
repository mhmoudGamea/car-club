import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'year_state.dart';

class YearCubit extends Cubit<YearState> {
  YearCubit() : super(YearInitial());

  final List<int> _manufacturingYears = [];

  void calculateNumberOfYears() {
    var currentYear = int.parse(DateFormat.y().format(DateTime.now()));
    for (var i = 2010; i <= currentYear; i++) {
      _manufacturingYears.add(i);
    }
  }

  List<int> get getManufacturingYears {
    return _manufacturingYears;
  }

  int? _manufactureYear;

  set setManufactureYear(int year) {
    _manufactureYear = year;
    emit(YearSelected());
  }

  int? get getManufactureYear {
    return _manufactureYear;
  }
}
