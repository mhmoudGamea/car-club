import 'package:car_club/core/widgets/custom_neumorphic_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../view_models/address_cubit/address_cubit.dart';
import '../../view_models/upload_image_cubit/upload_image_cubit.dart';
import '../../view_models/user_form_cubit/car_center_form_cubit.dart';
import 'address_widget.dart';
import 'image_picker_widget.dart';
import 'text_filed_widget.dart';
import 'uploaded_image_builder.dart';

class AddCarCenterBody extends StatefulWidget {
  const AddCarCenterBody({Key? key}) : super(key: key);

  @override
  State<AddCarCenterBody> createState() => _PostViewBodyState();
}

class _PostViewBodyState extends State<AddCarCenterBody> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final userFormData = BlocProvider.of<CarCenterFormCubit>(context);
    final addressData = BlocProvider.of<AddressCubit>(context);
    final uploadImageData = BlocProvider.of<UploadImageCubit>(context);
    return BlocBuilder<CarCenterFormCubit, CarCenterFormState>(
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
                        TextFiledWidget(
                          controller: userFormData.getName,
                          label: 'Car Center*',
                          type: TextInputType.name,
                          prefixIcon: const Icon(
                            FontAwesomeIcons.gears,
                            size: 18,
                            color: mintGreen,
                          ),
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
                                    AddressCubit.getLocationModel!.address;
                              }
                            },
                            child: TextFiledWidget(
                              controller: userFormData.getAddress,
                              label: 'Address*',
                              validate: (p0) {
                                if(p0 == null || p0.isEmpty){
                                  return 'Address is required';
                                }else{
                                  return null;
                                }
                              },
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
                        // user phone 1 text field
                        TextFiledWidget(
                          controller: userFormData.getUserPhone,
                          label: 'Phone 1',
                          prefixIcon: const Icon(
                            FontAwesomeIcons.phone,
                            size: 18,
                            color: Color(0xffcc8e35),
                          ),
                          type: TextInputType.number,
                        ),
                        // user phone 2 text field
                        TextFiledWidget(
                          controller: userFormData.getUserPhone2,
                          label: 'Phone 2',
                          prefixIcon: const Icon(
                            FontAwesomeIcons.phone,
                            size: 18,
                            color: Color(0xffcc8e35),
                          ),
                          type: TextInputType.number,
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
                              'you can describe reasons for be good for car owners.',
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
                        const SizedBox(height: 30),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: const [
                             Icon(
                               FontAwesomeIcons.clock,
                               size: 20,
                             ),
                             SizedBox(
                               width: 5,
                             ),
                             Text(
                               "Opening Times",
                               // style: Styles.titleLarge,
                               style: Styles.title16,
                             ),
                           ],
                         ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: Checkbox(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            activeColor: secondaryLoginColor,
                                            value: userFormData.friday,
                                            onChanged: (value) {
                                              userFormData.openFriday(value!);
                                            },
                                            checkColor: whiteColor,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Text(
                                          "Friday",
                                          style: Styles.title15.copyWith(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: Checkbox(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            activeColor: secondaryLoginColor,
                                            value: userFormData.saturday,
                                            onChanged: (value) {
                                              userFormData.openSaturday(value!);
                                            },
                                            checkColor: whiteColor,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Text(
                                          "saturday",
                                          style: Styles.title15.copyWith(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: Checkbox(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            activeColor: secondaryLoginColor,
                                            value: userFormData.sunday,
                                            onChanged: (value) {
                                              userFormData.openSunday(value!);
                                            },
                                            checkColor: whiteColor,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Text(
                                          "Sunday",
                                          style: Styles.title15.copyWith(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: Checkbox(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            activeColor: secondaryLoginColor,
                                            value: userFormData.monday,
                                            onChanged: (value) {
                                              userFormData.openMonday(value!);
                                            },
                                            checkColor: whiteColor,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                         Text(
                                          "Monday",
                                          style: Styles.title15.copyWith(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: Checkbox(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            activeColor: secondaryLoginColor,
                                            value: userFormData.tuesday,
                                            onChanged: (value) {
                                              userFormData.openTuesday(value!);
                                            },
                                            checkColor: whiteColor,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                         Text(
                                          "tuesday",
                                          style: Styles.title15.copyWith(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: Checkbox(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            activeColor: secondaryLoginColor,
                                            value: userFormData.thursday,
                                            onChanged: (value) {
                                              userFormData.openThursday(value!);
                                            },
                                            checkColor: whiteColor,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                         Text(
                                          "thursday",
                                          style: Styles.title15.copyWith(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: Checkbox(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            activeColor: secondaryLoginColor,
                                            value: userFormData.wednesday,
                                            onChanged: (value) {
                                              userFormData
                                                  .openWednesday(value!);
                                            },
                                            checkColor: whiteColor,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                         Text(
                                          "wednesday",
                                          style: Styles.title15.copyWith(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Opening Hour",
                                      style: TextStyle(color: mintGreen),
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        errorBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.red
                                            )
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.red
                                            )
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: babyBlue)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: mintGreen)),
                                      ),
                                      controller: userFormData.getOpenHour,
                                      onTap: () {
                                        showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now())
                                            .then((value) => {
                                                  userFormData
                                                          .getOpenHour.text =
                                                      value!.format(context)
                                                });
                                      },
                                      validator: (value) {
                                        if(value!.isEmpty){
                                          return "Open Hour is required";
                                        }else{
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "Close Hour",
                                      style: TextStyle(color: mintGreen),
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty) {
                                          return 'Close Hour is required';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.red
                                            )
                                        ),
                                        errorBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.red
                                            )
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: babyBlue)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: mintGreen)),
                                      ),
                                      controller: userFormData.getCloseHour,
                                      onTap: () {
                                        showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now())
                                            .then((value) => {
                                                  userFormData
                                                          .getCloseHour.text =
                                                      value!.format(context)
                                                });
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        const SizedBox(height: 10),
                        Container(
                          height: 1,
                          color: greyColor,
                        ),
                        const SizedBox(height: 10,),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: Checkbox(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                      activeColor: secondaryLoginColor,
                                      value: userFormData.credit,
                                      onChanged: (value) {
                                        userFormData.acceptCreditCard(value!);
                                      },
                                      checkColor: whiteColor,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Accept Credit Cards",
                                    style: Styles.title15.copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: Checkbox(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                      activeColor: secondaryLoginColor,
                                      value: userFormData.offers,
                                      onChanged: (value) {
                                        userFormData.acceptOffers(value!);
                                      },
                                      checkColor: whiteColor,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Accept discounts",
                                    style: Styles.title15.copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: Checkbox(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            activeColor: secondaryLoginColor,
                                            value: userFormData.friday,
                                            onChanged: (value) {
                                              userFormData.openFriday(value!);
                                            },
                                            checkColor: whiteColor,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Text(
                                          "Friday",
                                          style: Styles.title16
                                              .copyWith(color: babyBlue),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: Checkbox(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            activeColor: secondaryLoginColor,
                                            value: userFormData.saturday,
                                            onChanged: (value) {
                                              userFormData.openSaturday(value!);
                                            },
                                            checkColor: whiteColor,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Text(
                                          "saturday",
                                          style: Styles.title16
                                              .copyWith(color: babyBlue),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: Checkbox(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            activeColor: secondaryLoginColor,
                                            value: userFormData.sunday,
                                            onChanged: (value) {
                                              userFormData.openSunday(value!);
                                            },
                                            checkColor: whiteColor,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Text(
                                          "Sunday",
                                          style: Styles.title16
                                              .copyWith(color: babyBlue),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: Checkbox(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            activeColor: secondaryLoginColor,
                                            value: userFormData.monday,
                                            onChanged: (value) {
                                              userFormData.openMonday(value!);
                                            },
                                            checkColor: whiteColor,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Text(
                                          "Monday",
                                          style: Styles.title16
                                              .copyWith(color: babyBlue),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: Checkbox(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            activeColor: secondaryLoginColor,
                                            value: userFormData.tuesday,
                                            onChanged: (value) {
                                              userFormData.openTuesday(value!);
                                            },
                                            checkColor: whiteColor,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Text(
                                          "tuesday",
                                          style: Styles.title16
                                              .copyWith(color: babyBlue),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: Checkbox(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            activeColor: secondaryLoginColor,
                                            value: userFormData.thursday,
                                            onChanged: (value) {
                                              userFormData.openThursday(value!);
                                            },
                                            checkColor: whiteColor,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Text(
                                          "thursday",
                                          style: Styles.title16
                                              .copyWith(color: babyBlue),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: Checkbox(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            activeColor: secondaryLoginColor,
                                            value: userFormData.wednesday,
                                            onChanged: (value) {
                                              userFormData
                                                  .openWednesday(value!);
                                            },
                                            checkColor: whiteColor,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Text(
                                          "wednesday",
                                          style: Styles.title16
                                              .copyWith(color: babyBlue),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Opening Hour",
                                      style: TextStyle(color: mintGreen),
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: babyBlue)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: mintGreen)),
                                      ),
                                      controller: userFormData.getOpenHour,
                                      onTap: () {
                                        showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now())
                                            .then((value) => {
                                                  userFormData
                                                          .getOpenHour.text =
                                                      value!.format(context)
                                                });
                                      },
                                      validator: (value) {
                                        if(value!.isEmpty){
                                          return "field is required";
                                        }else{
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "Close Hour",
                                      style: TextStyle(color: mintGreen),
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty) {
                                          return 'Field is required';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: babyBlue)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: mintGreen)),
                                      ),
                                      controller: userFormData.getCloseHour,
                                      onTap: () {
                                        showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now())
                                            .then((value) => {
                                                  userFormData
                                                          .getCloseHour.text =
                                                      value!.format(context)
                                                });
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

*/