import 'package:car_club/core/widgets/custom_neumorphic_button.dart';
import 'package:car_club/features/post/presentation/model_views/brand_cubit/brand_cubit.dart';
import 'package:car_club/features/post/presentation/model_views/exterior_color_cubit/exterior_color_cubit.dart';
import 'package:car_club/features/post/presentation/model_views/fuel_cubit/fuel_cubit.dart';
import 'package:car_club/features/post/presentation/model_views/interior_color_cubit/interior_color_cubit.dart';
import 'package:car_club/features/post/presentation/model_views/transmission_cubit/transmission_cubit.dart';
import 'package:car_club/features/post/presentation/model_views/year_cubit/year_cubit.dart';
import 'package:car_club/features/post/presentation/views/widgets/brand_widget.dart';
import 'package:car_club/features/post/presentation/views/widgets/exterior_color_widget.dart';
import 'package:car_club/features/post/presentation/views/widgets/fuel_widget.dart';
import 'package:car_club/features/post/presentation/views/widgets/image_picker_widget.dart';
import 'package:car_club/features/post/presentation/views/widgets/interior_color_widget.dart';
import 'package:car_club/features/post/presentation/views/widgets/text_filed_widget.dart';
import 'package:car_club/features/post/presentation/views/widgets/transmission_widget.dart';
import 'package:car_club/features/post/presentation/views/widgets/year_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/constants.dart';
import '../../model_views/vehicle_type_cubit/vehicle_type_cubit.dart';
import 'vehicle_type_widget.dart';

class PostViewBody extends StatefulWidget {
  const PostViewBody({Key? key}) : super(key: key);

  @override
  State<PostViewBody> createState() => _PostViewBodyState();
}

class _PostViewBodyState extends State<PostViewBody> {
  final _brandsController = TextEditingController();
  final _yearController = TextEditingController();
  final _priceController = TextEditingController();
  final _fuelController = TextEditingController();
  final _transmissionController = TextEditingController();
  final _mileagesController = TextEditingController();
  final _exteriorColorController = TextEditingController();
  final _interiorColorController = TextEditingController();
  final _vehicleTypeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final brandData = BlocProvider.of<BrandCubit>(context);
    final yearData = BlocProvider.of<YearCubit>(context);
    final fuelData = BlocProvider.of<FuelCubit>(context);
    final transmissionData = BlocProvider.of<TransmissionCubit>(context);
    final exteriorColorData = BlocProvider.of<ExteriorColorCubit>(context);
    final interiorColorData = BlocProvider.of<InteriorColorCubit>(context);
    final vehicleTypeData = BlocProvider.of<VehicleTypeCubit>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      // first main column
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              // second main column
              child: Column(
                children: [
                  // brand text field
                  GestureDetector(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => BlocProvider.value(
                          value: brandData, child: const BrandWidget()),
                    ),
                    child: BlocListener<BrandCubit, BrandState>(
                      listener: (context, state) {
                        if (state is BrandNameSelected) {
                          _brandsController.text = brandData.getBrandName!;
                        }
                      },
                      child: TextFiledWidget(
                        isEnabled: false,
                        controller: _brandsController,
                        label: 'Car brand*',
                        prefixIcon: const Icon(
                          FontAwesomeIcons.car,
                          size: 18,
                          color: greyColor,
                        ),
                      ),
                    ),
                  ),
                  // year text field
                  GestureDetector(
                    onTap: () {
                      yearData.calculateNumberOfYears();
                      showDialog(
                        context: context,
                        builder: (context) => BlocProvider<YearCubit>.value(
                          value: yearData,
                          child: const YearWidget(),
                        ),
                      );
                    },
                    child: BlocListener<YearCubit, YearState>(
                      listener: (context, state) {
                        if (state is YearSelected) {
                          _yearController.text =
                              yearData.getManufactureYear.toString();
                        }
                      },
                      child: TextFiledWidget(
                        isEnabled: false,
                        controller: _yearController,
                        label: 'Year*',
                        type: TextInputType.number,
                        prefixIcon: const Icon(
                          FontAwesomeIcons.calendarDay,
                          size: 18,
                          color: babyBlue,
                        ),
                      ),
                    ),
                  ),
                  // price text field
                  TextFiledWidget(
                    controller: _priceController,
                    label: 'Price*',
                    type: TextInputType.number,
                    prefixIcon: const Icon(
                      FontAwesomeIcons.sackDollar,
                      size: 18,
                      color: mintGreen,
                    ),
                  ),
                  // fuel text field
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => BlocProvider<FuelCubit>.value(
                          value: fuelData,
                          child: const FuelWidget(),
                        ),
                      );
                    },
                    child: BlocListener<FuelCubit, FuelState>(
                      listener: (context, state) {
                        if (state is FuelSelected) {
                          _fuelController.text = fuelData.getFuelType!;
                        }
                      },
                      child: TextFiledWidget(
                        isEnabled: false,
                        controller: _fuelController,
                        label: 'Fuel*',
                        prefixIcon: const Icon(
                          FontAwesomeIcons.gasPump,
                          size: 18,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  // transmission text field
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            BlocProvider<TransmissionCubit>.value(
                          value: transmissionData,
                          child: const TransmissionWidget(),
                        ),
                      );
                    },
                    child: BlocListener<TransmissionCubit, TransmissionState>(
                      listener: (context, state) {
                        if (state is TransmissionSelected) {
                          _transmissionController.text =
                              transmissionData.getTransmissionType!;
                        }
                      },
                      child: TextFiledWidget(
                        isEnabled: false,
                        controller: _transmissionController,
                        label: 'Transmission*',
                        prefixIcon: const Icon(
                          FontAwesomeIcons.gears,
                          size: 18,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ),
                  // mileages text field
                  TextFiledWidget(
                    controller: _mileagesController,
                    label: 'Mileages*',
                    type: TextInputType.number,
                    prefixIcon: const Icon(
                      FontAwesomeIcons.route,
                      size: 18,
                      color: Color(0xff4a69bd),
                    ),
                  ),
                  // exterior color text field
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            BlocProvider<ExteriorColorCubit>.value(
                          value: exteriorColorData,
                          child: const ExteriorColorWidget(),
                        ),
                      );
                    },
                    child: BlocListener<ExteriorColorCubit, ExteriorColorState>(
                      listener: (context, state) {
                        if (state is ExteriorColorSelected) {
                          _exteriorColorController.text =
                              exteriorColorData.getExteriorColor!;
                        }
                      },
                      child: TextFiledWidget(
                        isEnabled: false,
                        controller: _exteriorColorController,
                        label: 'Exterior color*',
                        prefixIcon: const Icon(
                          FontAwesomeIcons.brush,
                          size: 18,
                          color: Color(0xffD980FA),
                        ),
                      ),
                    ),
                  ),
                  // interior color text field
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            BlocProvider<InteriorColorCubit>.value(
                          value: interiorColorData,
                          child: const InteriorColorWidget(),
                        ),
                      );
                    },
                    child: BlocListener<InteriorColorCubit, InteriorColorState>(
                      listener: (context, state) {
                        if (state is InteriorColorSelected) {
                          _interiorColorController.text =
                              interiorColorData.getInteriorColor!;
                        }
                      },
                      child: TextFiledWidget(
                        isEnabled: false,
                        controller: _interiorColorController,
                        label: 'Interior color*',
                        prefixIcon: const Icon(
                          FontAwesomeIcons.brush,
                          size: 18,
                          color: Color(0xffC4E538),
                        ),
                      ),
                    ),
                  ),
                  // vehicle attribute text field
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            BlocProvider<VehicleTypeCubit>.value(
                          value: vehicleTypeData,
                          child: const VehicleTypeWidget(),
                        ),
                      );
                    },
                    child: BlocListener<VehicleTypeCubit, VehicleTypeState>(
                      listener: (context, state) {
                        if (state is VehicleTypeSelected) {
                          _vehicleTypeController.text =
                              vehicleTypeData.getVehicleType!;
                        }
                      },
                      child: TextFiledWidget(
                        isEnabled: false,
                        controller: _vehicleTypeController,
                        label: 'Vehicle type*',
                        prefixIcon: const Icon(
                          FontAwesomeIcons.truck,
                          size: 18,
                          color: Color(0xffaaa69d),
                        ),
                      ),
                    ),
                  ),
                  // description text field
                  TextFiledWidget(
                    controller: _mileagesController,
                    label: 'Description',
                    prefixIcon: const Icon(
                      FontAwesomeIcons.notesMedical,
                      size: 18,
                      color: Color(0xff009432),
                    ),
                    maxLines: 3,
                    maxLength: 150,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          CustomNeumorphicButton(
            text: 'Upload Image',
            backgroundColor: babyBlue,
            textColor: Colors.white,
            onPress: () {
              showDialog(
                  context: context,
                  builder: (context) => const ImagePickerWidget());
            },
          ),
          const SizedBox(height: 10),
          CustomNeumorphicButton(
            text: 'Save',
            backgroundColor: mintGreen,
            textColor: Colors.white,
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
