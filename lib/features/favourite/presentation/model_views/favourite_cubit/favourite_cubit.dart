import 'package:car_club/features/post/data/models/post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());

  // CollectionReference postsCollectionRF =
  //     FirebaseFirestore.instance.collection(collectionName);

  // List<PostModel> _favList = [];

  // List<PostModel> get getFavList {
  //   return _favList;
  // }

  // Future<void> getFavourites() async {
  //   emit(FavouriteLoading());

  //   postsCollectionRF.snapshots().listen((event) async {
  //     // usersPosts > get all documents
  //     for (var doc in event.docs) {
  //       if (doc['favourites'].contains(uId)) {
  //         _favList.add(PostModel.fromFireStore(doc));
  //       }
  //     }
  //     emit(AddedToFavouriteSuccess(favs: _favList));
  //     _favList = [];
  //   }, onError: (error) {
  //     emit(FavouriteFailure(error: error));
  //   });
  // }
}
