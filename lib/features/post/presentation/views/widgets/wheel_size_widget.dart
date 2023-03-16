import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/styles.dart';
import '../../model_views/wheel_size_cubit/wheel_size_cubit.dart';

class WheelSizeWidget extends StatelessWidget {
  const WheelSizeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wheelSizeData = BlocProvider.of<WheelSizeCubit>(context);
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Helper.normalAppBar(
            context: context,
            title: 'No. of owners',
            backgroundColor: whiteColor,
            color: blackColor,
            fontSize: 14,
            iconSize: 18,
            elevation: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                5,
                (index) => NeumorphicButton(
                  onPressed: () {
                    // print(wheelSizeData.getWheelSize[index]);
                    wheelSizeData.setSize = wheelSizeData.getWheelSize[index];
                    GoRouter.of(context).pop();
                  },
                  style: NeumorphicStyle(
                    color: const Color(0xff7ed6df),
                    depth: 1,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(5)),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text(
                    wheelSizeData.getWheelSize[index],
                    style: Styles.title14.copyWith(color: whiteColor),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
