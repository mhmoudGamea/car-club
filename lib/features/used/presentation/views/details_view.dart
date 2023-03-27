import 'package:car_club/features/post/data/models/post_model.dart';
import 'package:flutter/material.dart';
import 'widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  static const rn = '/detailsView';
  final PostModel model;
  const DetailsView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: DetailsViewBody(model: model)),
    );
  }
}
