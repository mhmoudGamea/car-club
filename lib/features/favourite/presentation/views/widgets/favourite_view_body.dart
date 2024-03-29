import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/constants.dart';
import 'new_grid_view.dart';
import 'used_grid_view.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TabBar(
                  enableFeedback: true,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: mintGreen.withOpacity(0.7),
                  ),
                  indicatorColor: mintGreen,
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            FontAwesomeIcons.car,
                            size: 20,
                            color: blackColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'New Cars',
                            style: TextStyle(color: blackColor),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          FontAwesomeIcons.retweet,
                          size: 20,
                          color: blackColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Used Cars',
                          style: TextStyle(color: blackColor),
                        ),
                      ],
                    )),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.only(top: 10),
          child: TabBarView(
            children: [
              NewGridView(),
              UsedGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
