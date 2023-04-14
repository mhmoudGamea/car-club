import 'dart:collection';

import 'package:car_club/core/constants.dart';
import 'package:car_club/features/services/presentation/view_models/services_cubit/car_centers_states.dart';
import 'package:car_club/features/services/presentation/view_models/services_cubit/services_cubit.dart';
import 'package:car_club/features/services/presentation/views/add_car_center_form.dart';
import 'package:car_club/features/services/presentation/views/car_centers_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class ServicesViewBody extends StatefulWidget {
  const ServicesViewBody({Key? key}) : super(key: key);

  @override
  State<ServicesViewBody> createState() => _ServicesViewBodyState();
}

class _ServicesViewBodyState extends State<ServicesViewBody> {
  var markers = HashSet<Marker>();
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => CarCenterCubit()..getCarCenters() ,
      child: BlocBuilder<CarCenterCubit,CarCentersStates>(
        builder:(context, state) {
          if(state is GetCarCentersLoading){
            return const Center(child: CircularProgressIndicator());

          }else if(state is GetCarCentersSuccess){
            print("number of centers :: ${state.carCenters.length}");
            return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  GoogleMap(
                    initialCameraPosition: const CameraPosition(target: LatLng(30.5476041, 31.0084369), zoom: 10),
                    markers: markers,
                    onMapCreated: (controller) {
                      setState(() {
                        for (int i = 0 ; i<state.carCenters.length;i++) {
                          markers.add(
                              Marker(
                                  markerId: MarkerId("$i"),
                                  position: LatLng(state.carCenters[i].latitude, state.carCenters[i].longitude),
                                  infoWindow: InfoWindow(
                                title: state.carCenters[i].name,
                                snippet: state.carCenters[i].address,
                                onTap: () {

                                  // go to Car Center Details
                                  // GoRouter.of(context).push(CarCenterDetails.rn);

                                },
                              )
                              )
                          );
                        }

                      });
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: mintGreen
                          ),
                          child: MaterialButton(
                            child: const Text("Show Car Centers"),
                            onPressed: (){
                              GoRouter.of(context).push(CarCentersView.rn);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: babyBlue
                          ),
                          child: MaterialButton(
                            child: const Text("ADD Car Center"),
                            onPressed: (){
                              GoRouter.of(context).push(AddCarCenter.rn);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                    ],
                  )
                ],

              );

          }else if(state is GetCarCentersFailure){

            return Center(
              widthFactor: 10,
                child: Text(
                state.error.toString(),
              maxLines: 1,
            ));

          }else{
            return const Text('');
          }
        },
      ),
    );
  }
}
