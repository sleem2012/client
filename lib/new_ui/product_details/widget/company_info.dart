import 'package:flutter/material.dart';
import '../../../data/models/user_info/user_model.dart';
import '../../../shared/theme/helper.dart';

import '../../../shared/theme/text_theme.dart';

class CompanyInfoWidget extends StatelessWidget {
  const CompanyInfoWidget({
    Key? key,
    required this.company,
  }) : super(key: key);
  final UserCompany company;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          CircleAvatar(foregroundImage: NetworkImage(company.logo?.s256px ?? dummyNetLogo)),
          const SizedBox(width: 10),
          Expanded(child: Text(company.name?.value ?? '', style: KTextStyle.of(context).boldTitle1)),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
