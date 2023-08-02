import 'package:flutter/material.dart';
import '../../../data/models/services/services_model.dart';
import '../../../packages/dynamic_ui/view/dui_feature_view.dart';
import '../../../packages/dynamic_ui/view/dui_view_test.dart';
import '../../../packages/dynamic_ui/view/dynamic_helper/dynamic_helper.dart';
import '../../../shared/theme/logger.dart';
import '../../widgets/appbar.dart';
import '../../widgets/new_bg_img.dart';

class FilteredServicesView extends StatelessWidget {
  const FilteredServicesView({super.key, required this.servicesData});
  final ServicesData servicesData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(),
      body: BgImg(
        child: DynamicFeatureView(
          get_url: '',
          post_url: '',
          initFields: all_fields,
          postMapType: DuiPostMapType.answerCollection,
          onConfirm: (values) {
            printMap(values);
            return values..addAll({"additional": 'data'});
          },
        ),
      ),
    );
  }
}
