import 'package:car_club/core/constants.dart';
import 'package:car_club/core/error/failure.dart';
import 'package:car_club/core/widgets/progress.dart';
import 'package:car_club/features/post/presentation/model_views/upload_image_cubit/upload_image_cubit.dart';
import 'package:car_club/features/post/presentation/views/widgets/uploaded_image_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/styles.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uploadImage = BlocProvider.of<UploadImageCubit>(context);
    return BlocBuilder<UploadImageCubit, UploadImageState>(
      builder: (context, state) {
        //print(state);
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Helper.normalAppBar(
                context: context,
                title: 'Upload Images',
                backgroundColor: Colors.white,
                elevation: 1,
                color: Colors.black,
                fontSize: 14,
                iconSize: 18,
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    // picked image container
                    Stack(
                      children: [
                        SizedBox(
                          height: 120,
                          width: double.infinity,
                          child: FittedBox(
                            child: uploadImage.getPickedImage == null
                                ? const Icon(
                                    FontAwesomeIcons.solidImage,
                                    color: greyColor,
                                  )
                                : Image.file(
                                    uploadImage.getPickedImage!,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        if (uploadImage.getPickedImage != null)
                          Positioned(
                            top: 5,
                            right: 0,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              icon: const Icon(
                                FontAwesomeIcons.xmark,
                                size: 18,
                                // color: Colors.white,
                              ),
                              onPressed: uploadImage.deletePickedImage,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    if (uploadImage.getUploadedUrls.isNotEmpty)
                      BlocBuilder<UploadImageCubit, UploadImageState>(
                        builder: (context, state) {
                          return Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.all(10),
                            height: 97,
                            decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
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
                            ),
                          );
                        },
                      ),
                    if (uploadImage.getPickedImage != null)
                      const SizedBox(height: 10),
                    if (uploadImage.getPickedImage != null)
                      Row(
                        children: [
                          Expanded(
                            child: NeumorphicButton(
                              // onPressed: uploadImage.uploadImageToFireStorage,
                              onPressed: uploadImage.uploadImageToFireStorage,
                              padding: const EdgeInsets.symmetric(vertical: 13),
                              style: const NeumorphicStyle(
                                  color: mintGreen, depth: 1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (state is UploadImageLoading)
                                    Progress.circleProgress(),
                                  Text(
                                    state is UploadImageLoading
                                        ? '  Waiting...'
                                        : 'Save',
                                    textAlign: TextAlign.center,
                                    style: Styles.title14
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: NeumorphicButton(
                              onPressed: () {
                                // uploadImage.delete();
                              },
                              padding: const EdgeInsets.symmetric(vertical: 13),
                              style: const NeumorphicStyle(
                                  color: Colors.red, depth: 1),
                              child: Text(
                                'Cancel',
                                textAlign: TextAlign.center,
                                style: Styles.title14
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: NeumorphicButton(
                            onPressed: () async {
                              try {
                                await uploadImage.pickMyImage();
                              } catch (error) {
                                Helper.showCustomToast(
                                    context: context,
                                    bgColor: Colors.amber,
                                    icon: FontAwesomeIcons.triangleExclamation,
                                    msg: error.toString());
                              }
                            },
                            padding: const EdgeInsets.symmetric(vertical: 13),
                            style: NeumorphicStyle(
                                color: state is MaxNumberOfUploadedImages
                                    ? const Color(0xff0abde3).withOpacity(0.3)
                                    : const Color(0xff0abde3),
                                depth: 1),
                            child: Text(
                              'Upload Image',
                              textAlign: TextAlign.center,
                              style:
                                  Styles.title14.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
