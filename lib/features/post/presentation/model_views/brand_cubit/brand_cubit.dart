import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/assets.dart';

part 'brand_state.dart';

class BrandCubit extends Cubit<BrandState> {
  BrandCubit() : super(BrandInitial());

  final Map<String, dynamic> brands = {
    'BMW': bmwLogo,
    'Land Rover': landRoverLogo,
    'Citroen': citroenLogo,
    'Ford': fordLogo,
    'Mini Cooper': miniLogo,
    'Mitsubishi': mitsubishiLogo,
    'Skoda': skodaLogo,
    'Subaru': subaruLogo,
    'Tesla': teslaLogo,
  };

  String? _brandName;

  set setBrandName(String? brandName) {
    _brandName = brandName;
    emit(BrandNameSelected());
  }

  String? get getBrandName {
    return _brandName;
  }

  // text field part

  final _brandController = TextEditingController();

  TextEditingController get getBrandController {
    return _brandController;
  }
}
