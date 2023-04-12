import 'package:car_club/core/constants.dart';
import 'package:car_club/features/used/presentation/views/widgets/used_car_map_box.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../post/data/models/post_model.dart';
import 'used_car_color_box.dart';
import 'used_car_dates_box.dart';
import 'used_car_image_box.dart';
import 'used_car_option_box.dart';

class DetailsViewBody extends StatelessWidget {
  final PostModel model;
  const DetailsViewBody({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                // DetailsAppBar(model: model),
                Helper.normalAppBar(
                  context: context,
                  title: model.brand,
                  backgroundColor: whiteColor,
                  elevation: 1,
                  iconSize: 20,
                ),
                const SizedBox(height: 1),
                UsedCarImageBox(images: model.images),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      UsedCarOptionBox(car: model),
                      const SizedBox(height: 15),
                      UsedCarColorBox(car: model),
                      const SizedBox(height: 15),
                      UsedCarDatesBox(car: model),
                      const SizedBox(height: 15),
                      UsedCarMapBox(ownerAddress: model.address),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: BoxDecoration(
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                color: greyColor.withOpacity(0.7),
                offset: const Offset(0, -2),
                blurRadius: 2,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: NeumorphicButton(
                  onPressed: () {},
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  style: NeumorphicStyle(
                    color: whiteColor,
                    depth: 0.5,
                    border: NeumorphicBorder(
                      width: 1,
                      color: Colors.grey[200],
                    ),
                  ),
                  child: Text(
                    'Chat',
                    textAlign: TextAlign.center,
                    style: Styles.title15.copyWith(color: blackColor),
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              Expanded(
                child: NeumorphicButton(
                  onPressed: () {},
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  style: const NeumorphicStyle(
                    color: mintGreen,
                    depth: 0.5,
                  ),
                  child: Text(
                    'Call',
                    textAlign: TextAlign.center,
                    style: Styles.title15.copyWith(color: whiteColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
