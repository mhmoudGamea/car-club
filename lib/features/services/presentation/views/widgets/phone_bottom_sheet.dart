import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/styles.dart';

class ShowPhoneSheet extends StatelessWidget {
  const ShowPhoneSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        right: 15.0,
        left: 15.0,
        bottom: 15.0,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      height:210,
      child: Column(
        children: [
          Container(
            height: 8,
            width: 70,
            decoration: BoxDecoration(
                color: greyColor, borderRadius: BorderRadius.circular(10)),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const CircleAvatar(
                radius: 16,
                backgroundColor: mintGreen,
                child: Icon(FontAwesomeIcons.phone,color: whiteColor,size: 18,),
              ),
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: (MediaQuery.of(context).size.width / 3) * 2,
                child:  Text(
                  'Select a number to a call',
                  style: Styles.title16.copyWith(fontSize: 18),
                  maxLines: 2,
                  softWrap: true,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: (MediaQuery.of(context).size.width / 3),
                  child: Text(
                    '01129547302 ',
                    style: Styles.title16
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
                const Spacer(),
                Container(
                  height: 36,
                  // width: ((MediaQuery.of(context).size.width)/4)*3.6,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: mintGreen),
                  child: ElevatedButton(
                    child: const Text("Call", style: Styles.title16),
                    onPressed: () async {
                      final Uri phoneUri =Uri(scheme: "tel", path: "01129547302");
                      try {
                        if (await canLaunchUrl(phoneUri)) {
                          await launchUrl(phoneUri);
                        }
                      } catch (error) {
                        Helper.showCustomToast(
                          context: context,
                          bgColor: Colors.red,
                          icon: FontAwesomeIcons.x,
                          msg: "incorrect..try again please ",
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: (MediaQuery.of(context).size.width / 3),
                  child: Text(
                    '01226929816 ',
                    style: Styles.title16
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
                const Spacer(),
                Container(
                  height: 36,
                  // width: ((MediaQuery.of(context).size.width)/4)*3.6,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: mintGreen),
                  child: ElevatedButton(
                    child: const Text("Call", style: Styles.title16),
                    onPressed: () async {
                      final Uri phoneUri =Uri(scheme: "tel", path: "01226929816");
                      try {
                        if (await canLaunchUrl(phoneUri)) {
                          await launchUrl(phoneUri);
                        }
                      } catch (error) {
                        Helper.showCustomToast(
                          context: context,
                          bgColor: Colors.red,
                          icon: FontAwesomeIcons.x,
                          msg: "incorrect..try again please ",
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
