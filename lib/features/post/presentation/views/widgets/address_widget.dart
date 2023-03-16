import 'package:car_club/core/utils/styles.dart';
import 'package:car_club/features/post/data/models/location_model.dart';
import 'package:car_club/features/post/presentation/model_views/address_cubit/address_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/widgets/progress.dart';

class AddressWidget extends StatefulWidget {
  const AddressWidget({Key? key}) : super(key: key);

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  var selectOne = false;
  LocationModel? _locationModel;
  @override
  Widget build(BuildContext context) {
    final addressData = BlocProvider.of<AddressCubit>(context);
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Helper.normalAppBar(
            context: context,
            title: 'Address',
            backgroundColor: whiteColor,
            color: blackColor,
            fontSize: 14,
            iconSize: 18,
            elevation: 1,
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                if (!selectOne)
                  BlocBuilder<AddressCubit, AddressState>(
                    builder: (context, state) {
                      if (state is MyLocationSuccess) {
                        return SizedBox(
                          width: double.infinity,
                          height: 150,
                          child: GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: CameraPosition(
                              zoom: 9.4746,
                              target: LatLng(
                                addressData.getLocationModel!.latitude,
                                addressData.getLocationModel!.longitude,
                              ),
                            ),
                            markers: {
                              Marker(
                                markerId: const MarkerId('m1'),
                                position: LatLng(
                                  addressData.getLocationModel!.latitude,
                                  addressData.getLocationModel!.longitude,
                                ),
                              ),
                            },
                          ),
                        );
                      } else if (state is MyLocationFailure) {
                        return SizedBox(
                          width: double.infinity,
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.triangleExclamation,
                                size: 40,
                                color: Colors.red[100],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Failed to display your location on map!',
                                style:
                                    Styles.title13.copyWith(color: Colors.grey),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      } else {
                        return SizedBox(
                          width: double.infinity,
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                FontAwesomeIcons.locationDot,
                                size: 40,
                                color: greyColor,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'No address is selected yet!',
                                style:
                                    Styles.title13.copyWith(color: Colors.grey),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                if (selectOne)
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: BlocConsumer<AddressCubit, AddressState>(
                      listener: (context, state) {
                        if (state is MyLocationSuccess) {
                          _locationModel = addressData.getLocationModel;
                        }
                      },
                      builder: (context, state) {
                        return GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: const CameraPosition(
                            zoom: 9.4746,
                            target: LatLng(
                              37.422,
                              -122.084,
                            ),
                          ),
                          markers: _locationModel == null
                              ? {}
                              : {
                                  Marker(
                                    markerId: const MarkerId('m3'),
                                    position: LatLng(
                                      _locationModel!.latitude,
                                      _locationModel!.longitude,
                                    ),
                                  ),
                                },
                          onTap: (value) async {
                            await addressData.selectMyLocation(value);
                          },
                        );
                      },
                    ),
                  ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    BlocBuilder<AddressCubit, AddressState>(
                      builder: (context, state) {
                        return Expanded(
                          child: NeumorphicButton(
                            onPressed: () async {
                              setState(() {
                                selectOne = false;
                              });
                              await addressData.getMyLocation();
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (state is MyLocationLoading)
                                  Progress.circleProgress(color: babyBlue),
                                Text(
                                  state is MyLocationLoading
                                      ? '  Waiting...'
                                      : 'My location',
                                  textAlign: TextAlign.center,
                                  style:
                                      Styles.title14.copyWith(color: babyBlue),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: NeumorphicButton(
                        onPressed: () {
                          setState(() {
                            selectOne = true;
                          });
                        },
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        style:
                            const NeumorphicStyle(color: mintGreen, depth: 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Select one',
                              textAlign: TextAlign.center,
                              style:
                                  Styles.title14.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
