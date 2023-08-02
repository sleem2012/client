import 'package:flutter/material.dart';
import '../../../data/models/services/services_model.dart';
import '../../widgets/comming_soon_widget.dart';
import '../widgets/search_field.dart';
import '../../widgets/appbar.dart';
import 'package:get/get.dart';

import 'filter_dialog.dart';

class PlaneScreen extends StatelessWidget {
  const PlaneScreen({Key? key, required this.servicesData}) : super(key: key);
  final ServicesData servicesData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(title: servicesData.name ?? ''),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.dialog(const PlaneFilterDialog());
              },
              child: KSearchBar(
                enabled: false,
                onSearch: (p0) {},
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            //if no product
            const ComingSoonWidget()
          ],
        ),
      ),
    );
  }
}
