import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/helper.dart';
import '../../data/repos/post_repo_impl.dart';
import '../view_models/address_cubit/address_cubit.dart';
import '../view_models/upload_image_cubit/upload_image_cubit.dart';
import '../view_models/user_form_cubit/car_center_form_cubit.dart';
import 'widgets/add_car_center_form_body.dart';

class AddCarCenter extends StatelessWidget {
  const AddCarCenter({Key? key}) : super(key: key);
  static const rn = '/AddCarCenter';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CarCenterFormCubit(PostRepoImpl())),
        BlocProvider(create: (context) => AddressCubit()),
        BlocProvider(create: (context) => UploadImageCubit()),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: Helper.normalAppBar(
          context: context,
          title: 'Add Car Center',
          backgroundColor: Colors.white,
          color: Colors.black,
          elevation: 1,
        ),
        body: const AddCarCenterBody(),
      ),
    );
  }
}
