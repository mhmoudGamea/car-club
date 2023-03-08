import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/styles.dart';
import '../../model_views/interior_color_cubit/interior_color_cubit.dart';
import 'dialog_text_field_widget.dart';

class InteriorColorWidget extends StatelessWidget {
  const InteriorColorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final interiorColor = BlocProvider.of<InteriorColorCubit>(context);
    List<String> colorName = interiorColor.interiorColorList.entries
        .map((item) => item.key)
        .toList();
    List<dynamic> colorStyle = interiorColor.interiorColorList.entries
        .map((item) => item.value)
        .toList();
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Helper.normalAppBar(
            context: context,
            title: 'Exterior color',
            backgroundColor: whiteColor,
            color: blackColor,
            fontSize: 14,
            iconSize: 18,
            elevation: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            child: Column(
              children: [
                SizedBox(
                  height: 35,
                  child: ListView.separated(
                    padding: const EdgeInsets.only(bottom: 5),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: colorName.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 15),
                    itemBuilder: (context, index) => NeumorphicButton(
                      onPressed: () {
                        // print(colorName[index]);
                        interiorColor.setInteriorColor = colorName[index];
                        GoRouter.of(context).pop();
                      },
                      style: NeumorphicStyle(
                        color: colorStyle[index],
                        depth: 1,
                        boxShape: const NeumorphicBoxShape.circle(),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 13,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                FittedBox(
                  child: Text(
                    'or you can type the color',
                    style: Styles.title13.copyWith(color: Colors.black),
                  ),
                ),
                DialogTextFieldWidget(
                  cursorColor: const Color(0xffC4E538),
                  controller: interiorColor.getInteriorColorController,
                  label: 'Exterior color',
                  borderColor: const Color(0xffC4E538),
                  onPress: () {
                    interiorColor.getInteriorColorController.text = '';
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: NeumorphicButton(
                        onPressed: () {
                          // print(exteriorColor.getExteriorColorController.text);
                          interiorColor.setInteriorColor =
                              interiorColor.getInteriorColorController.text;
                          interiorColor.getInteriorColorController.text = '';
                          GoRouter.of(context).pop();
                        },
                        style: const NeumorphicStyle(
                          color: Color(0xffC4E538),
                          depth: 1,
                        ),
                        child: Text(
                          'Done',
                          style: Styles.title14.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
