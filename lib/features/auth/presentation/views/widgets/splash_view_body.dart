import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../auth_view.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(logo),
            width: 166,
            height: 166,
          ),
          const SizedBox(height: 202),
          const Text(
            'just drive comfortable and elegancy',
            style: Styles.authCustomTitle,
          ),
          const SizedBox(height: 21,),
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: 55,
            width: 304,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: secondaryLoginColor)
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Center(
                    child: Text(
                      'Have a Look!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  width: 35,
                  color: secondaryLoginColor,
                  child: IconButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const AuthenticationView();
                      },));
                    },
                    icon: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
