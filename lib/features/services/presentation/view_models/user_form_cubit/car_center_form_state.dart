part of 'car_center_form_cubit.dart';

@immutable
abstract class CarCenterFormState {}

class UserFormInitial extends CarCenterFormState {}

class PostLoading extends CarCenterFormState {}

class PostAddedSuccess extends CarCenterFormState {}

class PostAddedFailure extends CarCenterFormState {}

class SuccessFridayState extends CarCenterFormState{}
class SuccessSaturdayState extends CarCenterFormState{}
class SuccessSundayState extends CarCenterFormState{}
class SuccessMondayState extends CarCenterFormState{}
class SuccessTuesdayState extends CarCenterFormState{}
class SuccessWednesdayState extends CarCenterFormState{}
class SuccessThursdayState extends CarCenterFormState{}
