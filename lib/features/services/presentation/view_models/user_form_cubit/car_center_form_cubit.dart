import 'package:car_club/core/constants.dart';
import 'package:car_club/core/utils/helper.dart';
import 'package:car_club/features/services/data/models/car_center_model.dart';
import 'package:car_club/features/services/data/models/opening_times.dart';
import 'package:car_club/features/services/presentation/view_models/address_cubit/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../data/repos/post_repo.dart';
import '../../views/car_centers_view.dart';
import '../../views/widgets/confirmation_widget.dart';
import '../upload_image_cubit/upload_image_cubit.dart';

part 'car_center_form_state.dart';

class CarCenterFormCubit extends Cubit<CarCenterFormState> {
  // car data
  final PostRepo postRepo;
  CarCenterFormCubit(this.postRepo) : super(UserFormInitial());

  late final TimeOfDay openHour ;
  void setOpenHour(TimeOfDay openHour) {
    this.openHour=openHour;
  }
  late final TimeOfDay closeHour ;
  void setCloseHour(TimeOfDay closeHour) {
    this.closeHour=closeHour;
  }
  TimeOfDay getOpenHour() {
    return openHour;
  }
  TimeOfDay getCloseHour() {
    return closeHour;
  }


  final TextEditingController closeHourController = TextEditingController();
  TextEditingController get getCloseHourController {
    return closeHourController;
  }
  final TextEditingController openHourController = TextEditingController();
  TextEditingController get getOpenHourController {
    return openHourController;
  }

  final _nameController = TextEditingController();
  TextEditingController get getName {
    return _nameController;
  }

  final _priceController = TextEditingController();
  TextEditingController get getPrice {
    return _priceController;
  }

  final _numberOfOwnerController = TextEditingController();
  TextEditingController get getNoOfOwners {
    return _numberOfOwnerController;
  }

  final _descriptionController = TextEditingController();
  TextEditingController get getDescription {
    return _descriptionController;
  }

  // user data

  final _addressController = TextEditingController();
  TextEditingController get getAddress {
    return _addressController;
  }

  final _phoneController = TextEditingController();
  TextEditingController get getUserPhone {
    return _phoneController;
  }










  bool delivery = false;
  Future<void> deliveryIsAvailable(bool value) async {
    delivery = value;
    emit(SuccessFridayState());
  }

  bool credit = false;
  Future<void> acceptCreditCard(bool value) async {
    credit = value;
    emit(SuccessFridayState());
  }

  bool offers = false;
  Future<void> acceptOffers(bool value) async {
    offers = value;
    emit(SuccessFridayState());
  }


  bool friday = false;
  Future<void> openFriday(bool value) async {
    friday = value;
    emit(SuccessFridayState());
  }

  bool saturday = false;
  Future<void> openSaturday(bool value) async {
    saturday = value;
    emit(SuccessSaturdayState());
  }

  bool sunday = false;
  Future<void> openSunday(bool value) async {
    sunday = value;
    emit(SuccessSundayState());
  }

  bool monday = false;
  Future<void> openMonday(bool value) async {
    monday = value;
    emit(SuccessMondayState());
  }

  bool thursday = false;
  Future<void> openThursday(bool value) async {
    thursday = value;
    emit(SuccessThursdayState());
  }

  bool wednesday = false;
  Future<void> openWednesday(bool value) async {
    wednesday = value;
    emit(SuccessWednesdayState());
  }

  bool tuesday = false;
  Future<void> openTuesday(bool value) async {
    tuesday = value;
    emit(SuccessTuesdayState());
  }

  final _phone2Controller = TextEditingController();
  TextEditingController get getUserPhone2 {
    return _phone2Controller;
  }

  late CarCenterModel _carCenterModel;
  late OpeningTimes openingTimes;
  Future<void> addCarCenter(List<String> images, BuildContext context) async {
    emit(PostLoading());
    openingTimes = OpeningTimes(
      // localCloseHour: getCloseHour(),
      // localOpenHour: getOpenHour(),
      openHour: getOpenHourController.text,
      closeHour: getCloseHourController.text,
      wednesday: wednesday,
      tuesday: tuesday,
      friday: friday,
      monday: monday,
      saturday: saturday,
      sunday: sunday,
      thursday: thursday,
    );
    _carCenterModel = CarCenterModel(
      delivery: delivery,
      isOpen: true,
      credit: credit,
        offers: offers,
        uId: uId,
        date: DateTime.now().toIso8601String(),
        name: getName.text,
        description: getDescription.text,
        address: getAddress.text,
        distance: AddressCubit.getLocationModel!.distance,
        time: AddressCubit.calculateDistanceTime(
          AddressCubit.getLocationModel!.distance,
        ),
        phone: getUserPhone.text,
        phone2: getUserPhone2.text,
        openingTimes: openingTimes,
        images: images,
        latitude: AddressCubit.getLocationModel!.latitude,
        longitude: AddressCubit.getLocationModel!.longitude);
    try {
      await postRepo.addNewCarCenter(uId, _carCenterModel.toMap());
      emit(PostAddedSuccess());

      Helper.showCustomToast(
        context: context,
        bgColor: mintGreen,
        icon: FontAwesomeIcons.circleCheck,
        msg: 'Car Center added successfully.',
      );

      GoRouter.of(context).push(CarCentersView.rn);
    } catch (error) {
      emit(PostAddedFailure());
    }
  }

  void showConfirmationBox(
    BuildContext context,
    UploadImageCubit uploadedImages,
    CarCenterFormCubit userFormCubit,
  ) {
    showDialog(
      context: context,
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider<UploadImageCubit>.value(
            value: uploadedImages,
          ),
          BlocProvider<CarCenterFormCubit>.value(value: userFormCubit)
        ],
        child: const ConfirmationWidget(),
      ),
    );
  }

  Future<void> validate(
      {required GlobalKey<FormState> formKey,
      required BuildContext context,
      required UploadImageCubit uploadedImages,
      required CarCenterFormCubit userFormCubit}) async {
    if (formKey.currentState!.validate()) {
      if (uploadedImages.getUploadedUrls.isNotEmpty) {
        // show confirmation box
        showConfirmationBox(context, uploadedImages, userFormCubit);
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
