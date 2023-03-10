import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';


class DefaultTextField extends StatelessWidget {
  DefaultTextField({
    super.key,
    this.hintText,
    this.obscureText = false,
    this.onChanged,
    this.suffix,
    this.controller,
    this.validate,
  });
  Function(String)? onChanged;
  bool? obscureText;
  String? hintText;
  Widget? suffix ;
  Function(String)? validate;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
          child: TextFormField(
            controller: controller,
            cursorColor: Colors.white,
            obscureText: obscureText!,
            onChanged: onChanged,
            validator: (value) {
                validate;
              if(value!.isEmpty)
              {
                return '$hintText must be not empty';
              }
              return null;
            },

            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: secondaryLoginColor
                )
              ),
              filled: true,
              fillColor: const Color(0xff64636A),
              suffixIcon:suffix ,

              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              hintText: hintText,
              contentPadding:  const EdgeInsets.only(top: 16,bottom: 16,left: 23),
              hintStyle:const  TextStyle(color: Color(0xffE2E2E2)),
            ),
          ),
        ),
      // ),
    );
  }
}
