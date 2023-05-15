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
    'MiniCooper': mini,
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
    byd: [
      'F0',
      'F3',
      'Flyer',
      'L3',
      'S5',
    ]
  };
  Map<String, List<String>> cheryModels = {
    chery: ['Arizo 5', 'Tigo', 'Tigo 3', 'Tigo Pro7', 'Tigo 8'],
  };
  Map<String, List<String>> chevroletModels = {
    chevrolet: ['Avio', 'Captiva', 'Cross', 'Lanos', 'Optra'],
  };
  Map<String, List<String>> toyotaModels = {
    toyota: [
      'Avanza',
      'Corolla',
      'Corona',
      'Hilux',
      'Fortuner',
      'Yaris',
    ],
  };
  Map<String, List<String>> citroenModels = {
    citroen: [
      'Air Cross C5',
      'C Elysee',
      'Berlingo',
      'Jumpy',
      'Oltcit',
      'Picasso',
      'Zara',
    ],
  };
  Map<String, List<String>> fiatModels = {
    fiat: ['500', '500 X', 'Pontoo', 'tipo'],
  };
  Map<String, List<String>> fordModels = {
    ford: ['Eco Sport', 'Vista', 'Focous'], // Fista ??
  };
  Map<String, List<String>> havalModels = {
    haval: ['H9', 'Jolion'],
  };
  Map<String, List<String>> hondaModels = {
    honda: [
      'City',
      'Civic',
      'Integra',
      'Jazz',
      'MRV',
      'Prelude',
      'Stream',
    ],
  };
  Map<String, List<String>> hyundaiModels = {
    hyundai: [
      'Accent',
      'Accent HCi',
      'Accent RB',
      'Atos',
      'Creta',
      'Elantra',
      'Elantra AD',
      'Elantra CN7',
      'Elantra HD',
      'Elantra MD',
      'Getz',
      'Grand I10',
      'I10',
      'IX 35',
      'Matrix',
      'Tucson',
      'Verna',
    ],
  };
  Map<String, List<String>> jeepModels = {
    jeep: [
      'Grand Cherokee',
      'Renegade',
      'Wrangler',
      'Commander',
      'Compass',
      'Liberty',
      'Patriot',
      'Wings',
    ],
  };
  Map<String, List<String>> jetourModels = {
    jetour: ['X70', 'X95'],
  };
  Map<String, List<String>> kiaModels = {
    kia: [
      'Carens',
      'Ceed',
      'Cerato',
      'Grand Cerato',
      'Pegas',
      'Picanto',
      'Rio',
      'Soul',
      'Sportage',
      'Spectra',
      'Xceed',
    ],
  };
  Map<String, List<String>> ladaModels = {
    lada: [
      'Granta',
      'Aleko',
      'Kalina',
      'Largus',
      'Niva',
      'Oka',
      'Samara',
    ],
  };
  Map<String, List<String>> mazdaModels = {
    mazda: [
      'Familia',
      'Miata',
      'CX 3',
      'CX 9',
      'M2',
      'M3',
      'Mx6',
    ],
  };
  Map<String, List<String>> mercedesModels = {
    mercedes: [
      'E230',
      'E280',
      'A180',
      'A200',
      'B200',
      'C180',
      'C200',
      'CLA 180',
      'Gla 200',
    ],
  };
  Map<String, List<String>> mgModels = {
    mg: ['HS', 'MG 5', 'RX5', 'ZS'],
  };
  Map<String, List<String>> miniCooperModels = {
    mini: ['Copper', 'Copper s', 'Countryman', 'Countryman S'],
  };
  Map<String, List<String>> mitsubishiModels = {
    mitsubishi: [
      'Eclipse',
      'Lancer',
      'Attrage',
      'Colt',
      'Galant',
      'GT 3000',
      'L200',
      'Mirage',
      'Montero',
      'Nativa',
      'Outlander',
      'Pajero',
      'Vr4',
      'Xpander',
    ],
  };
  Map<String, List<String>> nissanModels = {
    nissan: [
      'Juke',
      'Qashqai',
      'Sentra',
      'Sunny',
      'Tiida',
    ],
  };
  Map<String, List<String>> opelModels = {
    opel: [
      'Astra',
      'Corsa',
      'Crossland',
      'Grand land',
      'Insignia',
    ],
  };
  Map<String, List<String>> peugeotModels = {
    peugeot: [
      '2008',
      '208',
      '3008',
      '301',
      '5008',
      '508',
    ],
  };
  Map<String, List<String>> protonModels = {
    proton: [
      'Saga',
      'Exora',
      'Gen 2',
      'Persona',
      'Preve',
      'Waja',
      'Wira',
    ],
  };
  Map<String, List<String>> renaultModels = {
    renault: [
      'Duster',
      'Kadjar',
      'Logan',
      'Megane',
      'Sandero',
      'Sandero Stepway',
    ],
  };
  Map<String, List<String>> seatModels = {
    seat: [
      'Arona',
      'Ateca',
      'Ibiza',
      'Leon',
      'Tarraco',
      'Toledo',
    ],
  };
  Map<String, List<String>> skodaModels = {
    skoda: [
      'kodiaq',
      'Octavia',
      'Octavia A7',
      'Octavia A8',
      'Superb',
    ],
  };
  Map<String, List<String>> subaruModels = {
    subaru: [
      'XV',
      'BRZ',
      'Forerter',
      'Imperza',
      'Legacy',
      'Outback',
    ],
  };
  Map<String, List<String>> suzukiModels = {
    suzuki: [
      'Alto',
      'Baleno',
      'Celerio',
      'Ciaz',
      'Dzire',
      'Swift',
    ],
  };
  Map<String, List<String>> vwModels = {
    vw: ['Golf', 'Jetta', 'Passat', 'Tiguan'],
  };
  Map<String, List<String>> volvoModels = {
    volvo: [
      'C30',
      'C70',
      'S60',
      'S70',
      'V60',
      'V40',
      'XC 40',
      'XC 60',
    ],
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
      case 'Chery':
        {
          getModelsInfo(cheryModels);
        }
        break;
      case 'Toyota':
        {
          getModelsInfo(toyotaModels);
        }
        break;
      case 'Chevrolet':
        {
          getModelsInfo(chevroletModels);
        }
        break;
      case 'Citroen':
        {
          getModelsInfo(citroenModels);
        }
        break;
      case 'Fiat':
        {
          getModelsInfo(fiatModels);
        }
        break;
      case 'Ford':
        {
          getModelsInfo(fordModels);
        }
        break;
      case 'HAVAL':
        {
          getModelsInfo(havalModels);
        }
        break;
      case 'Honda':
        {
          getModelsInfo(hondaModels);
        }
        break;
      case 'Hyundai':
        {
          getModelsInfo(hyundaiModels);
        }
        break;
      case 'Jeep':
        {
          getModelsInfo(jeepModels);
        }
        break;
      case 'JETOUR':
        {
          getModelsInfo(jetourModels);
        }
        break;
      case 'Kia':
        {
          getModelsInfo(kiaModels);
        }
        break;
      case 'Lada':
        {
          getModelsInfo(ladaModels);
        }
        break;
      case 'Mazda':
        {
          getModelsInfo(mazdaModels);
        }
        break;
      case 'Mercedes':
        {
          getModelsInfo(mercedesModels);
        }
        break;
      case 'MG':
        {
          getModelsInfo(mgModels);
        }
        break;
      case 'MiniCooper':
        {
          getModelsInfo(miniCooperModels);
        }
        break;
      case 'Mitsubishi':
        {
          getModelsInfo(mitsubishiModels);
        }
        break;
      case 'Nissan':
        {
          getModelsInfo(nissanModels);
        }
        break;
      case 'Opel':
        {
          getModelsInfo(opelModels);
        }
        break;
      case 'Peugeot':
        {
          getModelsInfo(peugeotModels);
        }
        break;
      case 'Proton':
        {
          getModelsInfo(protonModels);
        }
        break;
      case 'Renault':
        {
          getModelsInfo(renaultModels);
        }
        break;
      case 'Seat':
        {
          getModelsInfo(seatModels);
        }
        break;
      case 'Skoda':
        {
          getModelsInfo(skodaModels);
        }
        break;
      case 'Subaru':
        {
          getModelsInfo(subaruModels);
        }
        break;
      case 'Suzuki':
        {
          getModelsInfo(suzukiModels);
        }
        break;
      case 'Volkswagen':
        {
          getModelsInfo(vwModels);
        }
        break;
      case 'Volvo':
        {
          getModelsInfo(volvoModels);
        }
        break;
      default:
        break;
    }
  }
}
