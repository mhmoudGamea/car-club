import 'dart:io';

import 'package:dartz/dartz.dart';

abstract class ReviewRepo{
  Future<Either<void, File>> pickReviewImage({required context});

  Future<Either<void,String>> uploadReviewImage({required File image});

  Future<void> addReview({required String uId,required Map<String, dynamic> review,required String centerDoc});


}