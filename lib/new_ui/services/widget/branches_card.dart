import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/branch/branch_model.dart';
import '../../../packages/extensions.dart';
import '../../../logic/cart/cart_bloc.dart';
import '../../../logic/company/company_by_id/company_bloc_by_id.dart';
import '../../../logic/company/company_by_id/company_state_by_id.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../views/widgets/avatar_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BranchesCard extends StatelessWidget {
  const BranchesCard({Key? key, required this.data,}) : super(key: key);
  final BranchData data;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyBlocById, CompanyStateById>(
  builder: (context, state) {
    return RadioListTile<BranchData>(
      title: Text(
        data.addressId?.cityId?.name?.value ?? '',
        style: KTextStyle.of(context).black_grey_bold.S(1.4),
      ),
      subtitle: Text(data.addressId?.detailedAddress ?? '', style: KTextStyle.of(context).black_grey),
      value: data,
      groupValue: CompanyBlocById.of(context).selectedBranch ?? BranchData(),
      onChanged:  (value) {
      CompanyBlocById.of(context).onSelectBranch(value);
      CartBloc.of(context).onSelectBranch(value);


      },
      secondary: AvatarWidget(
        icon: Icons.location_on,
        onTap: () async {
          final String lat = data.addressId?.latitude ?? '';
          final String lng = data.addressId?.longitude ?? '';
          String url = "google.navigation:q=$lat,$lng";

          await launchUrlString(url);
        },
      ),
    );
  },
);
  }
}
