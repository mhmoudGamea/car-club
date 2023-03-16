import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assets.dart';

part 'brand_state.dart';

class BrandCubit extends Cubit<BrandState> {
  BrandCubit() : super(BrandInitial());

  final Map<String, dynamic> brands = {
    'Audi': audi,
    'BMW': bmw,
    'BYD': byd,
    'Chery': chery,
    'Toyota': toyota,
    'Chevrolet': chevrolet,
    'Citroen': citroen,
    'Fiat': fiat,
    'Ford': ford,
    'HAVAL': haval,
    'Honda': honda,
    'Hyundai': hyundai,
    'Jeep': jeep,
    'JETOUR': jetour,
    'Kia': kia,
    'Lada': lada,
    'Mazda': mazda,
    'Mercedes': mercedes,
    'MG': mg,
    'MiniCooper': miniCooper,
    'Mitsubishi': mitsubishi,
    'Nissan': nissan,
    'Opel': opel,
    'Peugeot': peugeot,
    'Proton': proton,
    'Renault': renault,
    'Seat': seat,
    'Skoda': skoda,
    'Subaru': subaru,
    'Suzuki': suzuki,
    'Volkswagen': vw,
    'Volvo': volvo,
  };

  String? _brandName;

  set setBrandName(String? brandName) {
    _brandName = brandName;
    selectWhichBrand();
    emit(BrandNameSelected());
  }

  // the actual name of this brand
  String? get getBrandName {
    return _brandName;
  }

  // start model

  Map<String, List<String>> audiModels = {
    audi: ['A3', 'A4', 'Q2', 'Q3'],
  };

  Map<String, List<String>> bmwModels = {
    bmw: [
      '520i',
      '525',
      '528',
      '528i',
      '530',
      '530i',
      'x1',
      'x2',
      'x3',
      'x4',
      'x5'
    ]
  };

  Map<String, List<String>> bydModels = {
    byd: ['F3']
  };

  List<String> _modelValues = [];
  List<String> get getModelValues {
    return _modelValues;
  }

  void getModelsInfo(Map<String, List<String>> brand) {
    // this method get only brand logo & model values when brand is selected
    for (var element in brand.values) {
      _modelValues = [...element];
    }
    emit(BrandModelsShow());
  }

  void selectWhichBrand() {
    switch (_brandName) {
      case 'Audi':
        {
          getModelsInfo(audiModels);
        }
        break;

      case 'BMW':
        {
          getModelsInfo(bmwModels);
        }
        break;
      case 'BYD':
        {
          getModelsInfo(bydModels);
        }
        break;
      default:
        break;
    }
  }

  // Map<String, dynamic> cheryModels = {
  //   'Arizo 5': chery,
  //   'Tigo Pro7': chery,
  //   'Tigo': chery,
  //   'Tigo 3': chery,
  //   'Tigo 7': chery,
  //   'Tigo 8': chery,
  // };
  // Map<String, dynamic> chevroletModels = {
  //   'Avio': chevrolet,
  //   'Captiva': chevrolet,
  //   'Cross': chevrolet,
  //   'Lanos': chevrolet,
  //   'Optra': chevrolet,
  // };
  // Map<String, dynamic> citroenModels = {
  //   'Air Cross C5': citroen,
  //   'C elysee': citroen,
  // };
  // Map<String, dynamic> fiatModels = {
  //   '500': fiat,
  //   '500 X': fiat,
  //   'Pontoo': fiat,
  //   'tipo': fiat,
  // };
  // Map<String, dynamic> fordModels = {
  //   'Eco Sport': ford,
  //   'Vista': ford,
  //   'Focous': ford,
  // };
}
