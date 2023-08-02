import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../di.dart';
import '../../../logic/auth/user_info/user_info_bloc.dart';
import '../../../logic/auth/user_info/user_info_state.dart';
import '../../../packages/cache/locale_storage.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/text_theme.dart';
import '../../locations/locations_screen.dart';

import '../../../logic/auth/update_user/update_user_bloc.dart';
import '../../../logic/global/addresses/addresses_bloc.dart';
import '../../../shared/localization/trans.dart';
import '../../widgets/action_dialog.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoBloc, UserInfoState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (_) => BlocProvider(
                create: (context) => Di.updateUserBloc,
                child: Builder(builder: (context) {
                  return LocationsScreen(onChanged: (value) {
                    ActionDialog(
                      title: Tr.get.warning_Your_cart_will_be_deleted,
                      approveAction: Tr.get.yes_message,
                      cancelAction: Tr.get.no_message,
                      onApproveClick: () {
                        final update = UpdateUserBloc.of(context);
                        AddressesBloc.of(context).onAddressSelected(value);
                        update.update_address(value?.id);
                        Navigator.of(context).pop();
                      },
                      onCancelClick: () {
                        Navigator.pop(context);
                      },
                    ).show<void>(context);
                  });
                }),
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
            );
          },
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.location_on_rounded, color: KColors.of(context).accentColor, size: 19),
                  const SizedBox(width: 4),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 120),
                    child: Text(
                      KStorage.i.getUserInfo?.data?.address?.detailedAddress ?? '',
                      style: KTextStyle.of(context).body3,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 140, child: Divider(thickness: .7, height: 1, color: Colors.white)),
            ],
          ),
        );
      },
    );
  }
}
