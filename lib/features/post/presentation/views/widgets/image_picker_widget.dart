import 'dart:io';

import 'package:car_club/core/constants.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:galleryimage/galleryimage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/styles.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;
  void pickMyImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Helper.normalAppBar(
            context: context,
            title: 'Upload Images',
            backgroundColor: Colors.white,
            elevation: 1,
            color: Colors.black,
            fontSize: 14,
            iconSize: 18,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                // picked image container
                Stack(
                  children: [
                    SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: FittedBox(
                        child: _image == null
                            ? const Icon(
                                FontAwesomeIcons.solidImage,
                                color: greyColor,
                              )
                            : Image.file(
                                _image!,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    if (_image != null)
                      Positioned(
                        top: 5,
                        right: 0,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(
                            FontAwesomeIcons.xmark,
                            size: 18,
                            // color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _image = null;
                            });
                          },
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GalleryImage(
                    imageUrls: const [
                      'https://www.pngitem.com/pimgs/m/281-2817796_mini-cooper-png-transparent-mini-cooper-images-mini.png',
                      'https://www.topgear.es/sites/topgear.es/public/dc/fotos/Mini-Cooper_5P_2015_C01.jpg',
                      'https://www.pngplay.com/wp-content/uploads/7/Mini-Cooper-Transparent-Images.png',
                      'https://m.media-amazon.com/images/I/61Pmfmo4mhL.jpg',
                    ],
                    numOfShowImages: 3,
                  ),
                ),
                const SizedBox(height: 10),
                if (_image != null) const SizedBox(height: 10),
                if (_image != null)
                  Row(
                    children: [
                      Expanded(
                        child: NeumorphicButton(
                          onPressed: pickMyImage,
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          style:
                              const NeumorphicStyle(color: mintGreen, depth: 1),
                          child: Text(
                            'Save',
                            textAlign: TextAlign.center,
                            style: Styles.title14.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: NeumorphicButton(
                          onPressed: pickMyImage,
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          style: const NeumorphicStyle(
                              color: Colors.red, depth: 1),
                          child: Text(
                            'Cancel',
                            textAlign: TextAlign.center,
                            style: Styles.title14.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: NeumorphicButton(
                        onPressed: pickMyImage,
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        style: const NeumorphicStyle(
                            color: Color(0xff0abde3), depth: 1),
                        child: Text(
                          'Upload Image',
                          textAlign: TextAlign.center,
                          style: Styles.title14.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
