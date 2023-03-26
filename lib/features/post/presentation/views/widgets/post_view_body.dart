import 'package:car_club/core/widgets/custom_neumorphic_button.dart';
import 'package:car_club/features/post/presentation/model_views/address_cubit/address_cubit.dart';
import 'package:car_club/features/post/presentation/model_views/brand_cubit/brand_cubit.dart';
import 'package:car_club/features/post/presentation/model_views/exterior_color_cubit/exterior_color_cubit.dart';
import 'package:car_club/features/post/presentation/model_views/fuel_cubit/fuel_cubit.dart';
import 'package:car_club/features/post/presentation/model_views/interior_color_cubit/interior_color_cubit.dart';
import 'package:car_club/features/post/presentation/model_views/number_of_owner_cubit/number_of_owners_cubit.dart';
import 'package:car_club/features/post/presentation/model_views/transmission_cubit/transmission_cubit.dart';
import 'package:car_club/features/post/presentation/model_views/upload_image_cubit/upload_image_cubit.dart';
import 'package:car_club/features/post/presentation/model_views/user_form_cubit/user_form_cubit.dart';
import 'package:car_club/features/post/presentation/model_views/wheel_size_cubit/wheel_size_cubit.dart';
import 'package:car_club/features/post/presentation/model_views/year_cubit/year_cubit.dart';
import 'package:car_club/features/post/presentation/views/widgets/address_widget.dart';
import 'package:car_club/features/post/presentation/views/widgets/brand_widget.dart';
import 'package:car_club/features/post/presentation/views/widgets/exterior_color_widget.dart';
import 'package:car_club/features/post/presentation/views/widgets/fuel_widget.dart';
import 'package:car_club/features/post/presentation/views/widgets/image_picker_widget.dart';
import 'package:car_club/features/post/presentation/views/widgets/interior_color_widget.dart';
import 'package:car_club/features/post/presentation/views/widgets/text_filed_widget.dart';
import 'package:car_club/features/post/presentation/views/widgets/transmission_widget.dart';
import 'package:car_club/features/post/presentation/views/widgets/wheel_size_widget.dart';
import 'package:car_club/features/post/presentation/views/widgets/year_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../model_views/vehicle_type_cubit/vehicle_type_cubit.dart';
import 'number_of_owners_widget.dart';
import 'uploaded_image_builder.dart';
import 'vehicle_type_widget.dart';

class PostViewBody extends StatefulWidget {
  const PostViewBody({Key? key}) : super(key: key);

  @override
  State<PostViewBody> createState() => _PostViewBodyState();
}

class _PostViewBodyState extends State<PostViewBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userFormData = BlocProvider.of<UserFormCubit>(context);
    final brandData = BlocProvider.of<BrandCubit>(context);
    final yearData = BlocProvider.of<YearCubit>(context);
    final fuelData = BlocProvider.of<FuelCubit>(context);
    final transmissionData = BlocProvider.of<TransmissionCubit>(context);
    final exteriorColorData = BlocProvider.of<ExteriorColorCubit>(context);
    final interiorColorData = BlocProvider.of<InteriorColorCubit>(context);
    final vehicleTypeData = BlocProvider.of<VehicleTypeCubit>(context);
    final numberOfOwnerData = BlocProvider.of<NumberOfOwnersCubit>(context);
    final wheelSizeData = BlocProvider.of<WheelSizeCubit>(context);
    final addressData = BlocProvider.of<AddressCubit>(context);
    final uploadImageData = BlocProvider.of<UploadImageCubit>(context);

    return BlocBuilder<UserFormCubit, UserFormState>(
      builder: (context, state) {
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
                  child: Form(
                    key: _formKey,
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
                                userFormData.getBrand.text =
                                    brandData.getBrandName!;
                              }
                            },
                            child: TextFiledWidget(
                              isEnabled: false,
                              controller: userFormData.getBrand,
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
                              builder: (context) =>
                                  BlocProvider<YearCubit>.value(
                                value: yearData,
                                child: const YearWidget(),
                              ),
                            );
                          },
                          child: BlocListener<YearCubit, YearState>(
                            listener: (context, state) {
                              if (state is YearSelected) {
                                userFormData.getYear.text =
                                    yearData.getManufactureYear.toString();
                              }
                            },
                            child: TextFiledWidget(
                              isEnabled: false,
                              controller: userFormData.getYear,
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
                          controller: userFormData.getPrice,
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
                              builder: (context) =>
                                  BlocProvider<FuelCubit>.value(
                                value: fuelData,
                                child: const FuelWidget(),
                              ),
                            );
                          },
                          child: BlocListener<FuelCubit, FuelState>(
                            listener: (context, state) {
                              if (state is FuelSelected) {
                                userFormData.getFuel.text =
                                    fuelData.getFuelType!;
                              }
                            },
                            child: TextFiledWidget(
                              isEnabled: false,
                              controller: userFormData.getFuel,
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
                          child: BlocListener<TransmissionCubit,
                              TransmissionState>(
                            listener: (context, state) {
                              if (state is TransmissionSelected) {
                                userFormData.getTransmission.text =
                                    transmissionData.getTransmissionType!;
                              }
                            },
                            child: TextFiledWidget(
                              isEnabled: false,
                              controller: userFormData.getTransmission,
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
                          controller: userFormData.getMileage,
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
                          child: BlocListener<ExteriorColorCubit,
                              ExteriorColorState>(
                            listener: (context, state) {
                              if (state is ExteriorColorSelected) {
                                userFormData.getExteriorColor.text =
                                    exteriorColorData.getExteriorColor!;
                              }
                            },
                            child: TextFiledWidget(
                              isEnabled: false,
                              controller: userFormData.getExteriorColor,
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
                          child: BlocListener<InteriorColorCubit,
                              InteriorColorState>(
                            listener: (context, state) {
                              if (state is InteriorColorSelected) {
                                userFormData.getInteriorColor.text =
                                    interiorColorData.getInteriorColor!;
                              }
                            },
                            child: TextFiledWidget(
                              isEnabled: false,
                              controller: userFormData.getInteriorColor,
                              label: 'Interior color*',
                              prefixIcon: const Icon(
                                FontAwesomeIcons.brush,
                                size: 18,
                                color: Color(0xffC4E538),
                              ),
                            ),
                          ),
                        ),
                        // vehicle type text field
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
                          child:
                              BlocListener<VehicleTypeCubit, VehicleTypeState>(
                            listener: (context, state) {
                              if (state is VehicleTypeSelected) {
                                userFormData.getVehicleType.text =
                                    vehicleTypeData.getVehicleType!;
                              }
                            },
                            child: TextFiledWidget(
                              isEnabled: false,
                              controller: userFormData.getVehicleType,
                              label: 'Vehicle type*',
                              prefixIcon: const Icon(
                                FontAwesomeIcons.truck,
                                size: 18,
                                color: Color(0xffaaa69d),
                              ),
                            ),
                          ),
                        ),
                        // number of owners text field
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  BlocProvider<NumberOfOwnersCubit>.value(
                                value: numberOfOwnerData,
                                child: const NumberOfOwnersWidget(),
                              ),
                            );
                          },
                          child: BlocListener<NumberOfOwnersCubit,
                              NumberOfOwnersState>(
                            listener: (context, state) {
                              if (state is NumberOfOwnersSelected) {
                                userFormData.getNoOfOwners.text =
                                    numberOfOwnerData.getNumber!;
                              }
                            },
                            child: TextFiledWidget(
                              isEnabled: false,
                              controller: userFormData.getNoOfOwners,
                              label: 'No. of owners*',
                              prefixIcon: const Icon(
                                FontAwesomeIcons.users,
                                size: 18,
                                color: Color(0xff7ed6df),
                              ),
                            ),
                          ),
                        ),
                        // wheel size text field
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  BlocProvider<WheelSizeCubit>.value(
                                value: wheelSizeData,
                                child: const WheelSizeWidget(),
                              ),
                            );
                          },
                          child: BlocListener<WheelSizeCubit, WheelSizeState>(
                            listener: (context, state) {
                              if (state is WheelSizeSelected) {
                                userFormData.getWheelSize.text =
                                    wheelSizeData.getSize!;
                              }
                            },
                            child: TextFiledWidget(
                              isEnabled: false,
                              controller: userFormData.getWheelSize,
                              label: 'Wheels size*',
                              prefixIcon: const Icon(
                                FontAwesomeIcons.circle,
                                size: 18,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        ),
                        // description text field
                        TextFiledWidget(
                          controller: userFormData.getDescription,
                          label: 'Description*',
                          prefixIcon: const Icon(
                            FontAwesomeIcons.notesMedical,
                            size: 18,
                            color: Color(0xff009432),
                          ),
                          maxLines: 3,
                          maxLength: 150,
                          helper:
                              'you can include features, or reason for sell.',
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Field is required';
                            }
                            if (value.length < 30) {
                              return 'Need at least 30 character';
                            }
                            return null;
                          },
                        ),
                        // address text field
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  BlocProvider<AddressCubit>.value(
                                value: addressData,
                                child: const AddressWidget(),
                              ),
                            );
                          },
                          child: BlocListener<AddressCubit, AddressState>(
                            listener: (context, state) {
                              if (state is MyLocationSuccess) {
                                userFormData.getAddress.text =
                                    addressData.getLocationModel!.address;
                              }
                            },
                            child: TextFiledWidget(
                              controller: userFormData.getAddress,
                              label: 'Address*',
                              isEnabled: false,
                              prefixIcon: const Icon(
                                FontAwesomeIcons.locationDot,
                                size: 18,
                                color: Color(0xffd35400),
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ),
                        // user phone text field
                        TextFiledWidget(
                          controller: userFormData.getUserPhone,
                          label: 'Phone*',
                          prefixIcon: const Icon(
                            FontAwesomeIcons.phone,
                            size: 18,
                            color: Color(0xffcc8e35),
                          ),
                          type: TextInputType.number,
                        ),
                        // uploaded image section
                        if (uploadImageData.getUploadedUrls.isNotEmpty)
                          BlocBuilder<UploadImageCubit, UploadImageState>(
                            builder: (context, state) {
                              return Container(
                                margin: const EdgeInsets.only(top: 10),
                                padding: const EdgeInsets.all(10),
                                height: 120,
                                decoration: BoxDecoration(
                                  color: greyColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: UploadedImageBuilder(
                                    uploadImage: uploadImageData),
                              );
                            },
                          ),
                        // upload image button
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: CustomNeumorphicButton(
                                text: 'Upload Image',
                                backgroundColor: greyColor,
                                textColor: whiteColor,
                                onPress: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        BlocProvider<UploadImageCubit>.value(
                                      value: uploadImageData,
                                      child: ImagePickerWidget(
                                          uploadImage: uploadImageData),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              NeumorphicButton(
                // onPressed: validate the form,
                onPressed: () async {
                  await userFormData.validate(
                    formKey: _formKey,
                    context: context,
                    uploadedImages: uploadImageData,
                    userFormCubit: userFormData,
                  );
                },
                padding: const EdgeInsets.symmetric(vertical: 13),
                style: const NeumorphicStyle(color: mintGreen, depth: 1),
                child: Text(
                  'Next',
                  textAlign: TextAlign.center,
                  style: Styles.title15.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/*


NeumorphicButton(
                // onPressed: save the whole form,
                onPressed: () async {
                  await userFormData.validate(
                    formKey: _formKey,
                    context: context,
                    uploadedImages: uploadImageData,
                  );
                },
                padding: const EdgeInsets.symmetric(vertical: 13),
                style: const NeumorphicStyle(color: mintGreen, depth: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (state is PostLoading) Progress.circleProgress(),
                    Text(
                      state is PostLoading ? '  Waiting...' : 'Save',
                      textAlign: TextAlign.center,
                      style: Styles.title15.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
*/
