import 'package:car_club/core/utils/helper.dart';
import 'package:car_club/core/utils/styles.dart';
import 'package:car_club/features/post/presentation/model_views/number_of_owner_cubit/number_of_owners_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants.dart';

class NumberOfOwnersWidget extends StatelessWidget {
  const NumberOfOwnersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noOfOwnersData = BlocProvider.of<NumberOfOwnersCubit>(context);
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
                    noOfOwnersData.setNumber =
                        noOfOwnersData.getNoOfOwners[index];
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
                    noOfOwnersData.getNoOfOwners[index],
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
