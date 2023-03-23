import 'package:flutter/material.dart';

import '../../../../../core/widgets/search_filter_box.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(height: 10),
          const SearchFilterBox(),
          const SizedBox(height: 15),
          Expanded(
            child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 15 / 22,
                ),
                itemBuilder: (context, index) =>
                    Container()), //const CarBoxItem()),
          ),
        ],
      ),
    );
  }
}
