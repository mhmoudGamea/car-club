import 'package:car_club/core/constants.dart';
import 'package:car_club/core/widgets/progress.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/styles.dart';
import '../../view_models/upload_image_cubit/upload_image_cubit.dart';
import 'uploaded_image_builder.dart';

class ImagePickerWidget extends StatelessWidget {
  final UploadImageCubit uploadImage;
  const ImagePickerWidget({Key? key, required this.uploadImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final uploadImage = BlocProvider.of<UploadImageCubit>(context);
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
                            child:
                                UploadedImageBuilder(uploadImage: uploadImage),
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
                                    Progress.circleProgress(
                                        color: Colors.white),
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
                              style: NeumorphicStyle(
                                color: Colors.white,
                                depth: 0.5,
                                border: NeumorphicBorder(
                                  width: 1,
                                  color: Colors.grey[200],
                                ),
                              ),
                              child: Text(
                                'Cancel',
                                textAlign: TextAlign.center,
                                style: Styles.title14.copyWith(
                                  color: Colors.red,
                                ),
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
                              uploadImage.getUploadedUrls.isNotEmpty
                                  ? 'Upload more images'
                                  : 'Upload image',
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
