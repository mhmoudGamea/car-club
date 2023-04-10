import 'package:flutter/material.dart';

class ItemViewBody extends StatelessWidget {
  const ItemViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 400,
            width: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  image: AssetImage('assets/images/service_1.jpg'), fit: BoxFit.cover),
              // shape: BoxShape.circle,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: const [
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('assets/images/service_1.jpg'),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Test Text',
                  style: TextStyle(fontSize: 22, color: Colors.grey),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children:[ Container(

                    width: 125,
                    height: 65,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 5, color: Colors.white10),
                      color: const Color(0xffc9c9c9),
                    ),
                  ),
                    const Text("10 KM")
                  ],


                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children:[ Container(

                    width: 125,
                    height: 65,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 5, color: Colors.white10),
                      color: const Color(0xffc9c9c9),
                    ),
                  ),
                    const Text("40 Minute")
                  ],


                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children:[ Container(

                    width: 125,
                    height: 65,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 5, color: Colors.white10),
                      color: const Color(0xffc9c9c9),
                    ),
                  ),
                    const Text("Open")
                  ],


                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}