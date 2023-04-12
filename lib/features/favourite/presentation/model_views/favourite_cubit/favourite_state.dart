part of 'favourite_cubit.dart';

@immutable
abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class AddedToFavouriteSuccess extends FavouriteState {
  final List<PostModel> favs;
  AddedToFavouriteSuccess({required this.favs});
}

class FavouriteFailure extends FavouriteState {
  final String error;
  FavouriteFailure({required this.error});
}
