import 'package:car_club/core/utils/styles.dart';
import 'package:car_club/features/post/presentation/model_views/upload_image_cubit/upload_image_cubit.dart';
import 'package:car_club/features/post/presentation/model_views/user_form_cubit/user_form_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/widgets/progress.dart';

class ConfirmationWidget extends StatelessWidget {
  const ConfirmationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uploadImageData = BlocProvider.of<UploadImageCubit>(context);
    final userData = BlocProvider.of<UserFormCubit>(context);
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: whiteColor,
            title: Text(
              'Confirm',
              style: Styles.title16.copyWith(color: blackColor),
            ),
            elevation: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Text(
                  'Are you shure that you want to save this data ?',
                  style: Styles.title14.copyWith(color: blackColor),
                ),
                const SizedBox(height: 15),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      uploadImageData.getUploadedUrls[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    userData.getBrand.text,
                  ),
                  subtitle: Text(
                    userData.getPrice.text,
                    style: Styles.title13.copyWith(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 15),
                BlocBuilder<UserFormCubit, UserFormState>(
                  builder: (context, state) {
                    return Row(
                      children: [
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
                        const SizedBox(width: 10),
                        Expanded(
                          child: NeumorphicButton(
                            onPressed: () {
                              userData.addPost(
                                  uploadImageData.getUploadedUrls, context);
                            },
                            padding: const EdgeInsets.symmetric(vertical: 13),
                            style: const NeumorphicStyle(
                                color: mintGreen, depth: 1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (state is PostLoading)
                                  Progress.circleProgress(color: Colors.white),
                                Text(
                                  state is PostLoading
                                      ? '  Waiting...'
                                      : 'Confirm',
                                  textAlign: TextAlign.center,
                                  style: Styles.title14
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
