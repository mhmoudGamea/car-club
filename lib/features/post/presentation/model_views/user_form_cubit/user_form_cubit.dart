import 'package:car_club/core/utils/helper.dart';
import 'package:car_club/features/post/data/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: unnecessary_import
import 'package:meta/meta.dart';

import '../../../data/repos/post_repo.dart';
import '../upload_image_cubit/upload_image_cubit.dart';

part 'user_form_state.dart';

class UserFormCubit extends Cubit<UserFormState> {
  final PostRepo postRepo;
  UserFormCubit(this.postRepo) : super(UserFormInitial());

  final _brandsController = TextEditingController();
  TextEditingController get getBrand {
    return _brandsController;
  }

  final _yearController = TextEditingController();
  TextEditingController get getYear {
    return _yearController;
  }

  final _priceController = TextEditingController();
  TextEditingController get getPrice {
    return _priceController;
  }

  final _fuelController = TextEditingController();
  TextEditingController get getFuel {
    return _fuelController;
  }

  final _transmissionController = TextEditingController();
  TextEditingController get getTransmission {
    return _transmissionController;
  }

  final _mileagesController = TextEditingController();
  TextEditingController get getMileage {
    return _mileagesController;
  }

  final _exteriorColorController = TextEditingController();
  TextEditingController get getExteriorColor {
    return _exteriorColorController;
  }

  final _interiorColorController = TextEditingController();
  TextEditingController get getInteriorColor {
    return _interiorColorController;
  }

  final _vehicleTypeController = TextEditingController();
  TextEditingController get getVehicleType {
    return _vehicleTypeController;
  }

  final _numberOfOwnerController = TextEditingController();
  TextEditingController get getNoOfOwners {
    return _numberOfOwnerController;
  }

  final _descriptionController = TextEditingController();
  TextEditingController get getDescription {
    return _descriptionController;
  }

  final _addressController = TextEditingController();
  TextEditingController get getAddress {
    return _addressController;
  }

  late PostModel _postModel;

  Future<void> addPost() async {
    emit(PostLoading());
    _postModel = PostModel(
      brand: getBrand.text,
      manufacturingYear: getYear.text,
      price: double.parse(getPrice.text),
      fuel: getFuel.text,
      transmission: getTransmission.text,
      mileage: double.parse(getMileage.text),
      exColor: getExteriorColor.text,
      inColor: getInteriorColor.text,
      vehicleType: getVehicleType.text,
      noOfOwners: getNoOfOwners.text,
      description: getDescription.text,
      address: getAddress.text,
    );
    try {
      await postRepo.addNewPost(
          'yyTbyyKO9xREWQjg4aXIM2thJWp1', _postModel.toJson());
      emit(PostAddedSuccess());
    } catch (error) {
      emit(PostAddedFailure());
    }
  }

  Future<void> validate(
      {required GlobalKey<FormState> formKey,
      required BuildContext context,
      required UploadImageCubit uploadedImages}) async {
    if (formKey.currentState!.validate()) {
      if (uploadedImages.getUploadedUrls.isNotEmpty) {
        addPost();
      } else {
        // snackbar if doesn't upload images
        Helper.showCustomToast(
          context: context,
          bgColor: Colors.amber,
          icon: FontAwesomeIcons.triangleExclamation,
          msg: 'please upload some images first.',
        );
      }
    } else {
      // snackbar if doesn't complete any text field
      Helper.showCustomToast(
        context: context,
        bgColor: Colors.red,
        icon: FontAwesomeIcons.triangleExclamation,
        msg: 'please complete required fields.',
      );
    }
  }
}
