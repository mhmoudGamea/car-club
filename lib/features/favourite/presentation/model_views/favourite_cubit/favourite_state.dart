part of 'favourite_cubit.dart';

@immutable
abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class AddedToFavourite extends FavouriteState {
  final List<PostModel> favs;
  AddedToFavourite({required this.favs});
}

class RemovedFromFavourite extends FavouriteState {}
