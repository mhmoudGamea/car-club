import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/car_model.dart';
import '../../../data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewCars() async {
    emit(HomeLoading());
    var result = await homeRepo.fetchNewCars();
    result.fold(
      (failure) => emit(HomeFailure(failure.errMsg)),
      (books) => emit(HomeSuccess(books)),
    );
  }
}
