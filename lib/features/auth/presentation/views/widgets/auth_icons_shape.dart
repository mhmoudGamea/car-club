import 'package:flutter/material.dart';

Widget iconShape({required String image,required Function() onTap})
{
  return InkWell(
    onTap: onTap,
    child: Container(
        width: 63,
        height: 63,
        alignment: Alignment.center,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xff64636A))
        ),
        child:Image(
            width: 25,
            height: 25,
            image: AssetImage(image)
        )
    ),
  );
}