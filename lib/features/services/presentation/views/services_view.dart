import 'package:flutter/material.dart';

import 'widgets/services_view_body.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({Key? key}) : super(key: key);
  static const rn = '/ServicesView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ServicesViewBody());
  }
}
