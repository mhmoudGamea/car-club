import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class CoverAndProfile extends StatelessWidget {
  const CoverAndProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      margin: EdgeInsets.zero,
      child: SizedBox(
        height: 205,
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            Stack(
              children: [
                Container(
                    height: 150,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: Image.asset(
                      cover,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 150,
                    )),
              ],
            ),
            Positioned(
              bottom: 5,
              child: Stack(
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(55),
                        border: Border.all(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            width: 2.5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withAlpha(130),
                            spreadRadius: 1,
                            blurRadius: 3,
                          )
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(55),
                      child: Image.asset(
                        profile,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 150,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
