import 'package:flutter/material.dart';

import '../../../../../core/widgets/search_filter_box.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: const [
          SizedBox(height: 10),
          SearchFilterBox(),
          SizedBox(height: 15),
          // Expanded(
          //   child: ListView.separated(
          //     physics: const BouncingScrollPhysics(),
          //     itemCount: 4,
          //     separatorBuilder: (context, index) => const SizedBox(height: 15),
          //     itemBuilder: (context, index) => GestureDetector(
          //       onTap: () {
          //         GoRouter.of(context).push(HomeViewDetails.rn);
          //       },
          //       child: const CarItemBox(),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
