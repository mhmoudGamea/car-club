import 'package:car_club/features/post/presentation/model_views/interior_color_cubit/interior_color_cubit.dart';
import 'package:car_club/features/post/presentation/model_views/upload_image_cubit/upload_image_cubit.dart';
import 'package:car_club/features/post/presentation/model_views/vehicle_type_cubit/vehicle_type_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/helper.dart';
import '../model_views/brand_cubit/brand_cubit.dart';
import '../model_views/exterior_color_cubit/exterior_color_cubit.dart';
import '../model_views/fuel_cubit/fuel_cubit.dart';
import '../model_views/transmission_cubit/transmission_cubit.dart';
import '../model_views/year_cubit/year_cubit.dart';
import 'widgets/post_view_body.dart';

class PostView extends StatelessWidget {
  static const rn = '/postView';
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BrandCubit()),
        BlocProvider(create: (context) => YearCubit()),
        BlocProvider(create: (context) => FuelCubit()),
        BlocProvider(create: (context) => TransmissionCubit()),
        BlocProvider(create: (context) => ExteriorColorCubit()),
        BlocProvider(create: (context) => InteriorColorCubit()),
        BlocProvider(create: (context) => VehicleTypeCubit()),
        BlocProvider(create: (context) => UploadImageCubit()),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: Helper.normalAppBar(
          context: context,
          title: 'Create Post',
          backgroundColor: Colors.white,
          color: Colors.black,
          elevation: 1,
        ),
        body: PostViewBody(),
      ),
    );
  }
}
