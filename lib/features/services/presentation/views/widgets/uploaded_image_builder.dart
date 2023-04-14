
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/upload_image_cubit/upload_image_cubit.dart';

class UploadedImageBuilder extends StatelessWidget {
  final UploadImageCubit uploadImage;
  const UploadedImageBuilder({Key? key, required this.uploadImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final uploadImage = BlocProvider.of<UploadImageCubit>(context);
    return BlocBuilder<UploadImageCubit, UploadImageState>(
      builder: (context, state) {
        return GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: uploadImage.getUploadedUrls.length,
          itemBuilder: (context, index) => Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                uploadImage.getUploadedUrls[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}

class ImageItem extends StatelessWidget {
  const ImageItem({
    super.key,
    required this.uploadImage,
  });

  final File uploadImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.file(
          uploadImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
