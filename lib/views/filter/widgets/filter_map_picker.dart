import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../packages/extensions.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../packages/shared/picker/data/country_search_model/address_result.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../packages/shared/picker/logic/location_cubit/location_cubit.dart';
import '../../../packages/shared/picker/logic/location_cubit/location_state.dart';
import '../../widgets/text_field.dart';

class FilterMapPicker extends StatefulWidget {
  const FilterMapPicker({Key? key}) : super(key: key);

  @override
  State<FilterMapPicker> createState() => _FilterMapPickerState();
}

class _FilterMapPickerState extends State<FilterMapPicker> {
  @override
  Widget build(BuildContext context) {
    AddressResult? result;
    final TextEditingController detailedController = TextEditingController();

    return BlocBuilder<GetLocationCubit, GetLocationState>(
      builder: (context, state) {
        return GestureDetector(
          child: KTextFormField(
            prefixIcon: Icon(Icons.location_on_outlined, color: KColors.of(context).accentColor),
            hintText: state.maybeWhen(orElse: () => result?.address ?? Tr.get.open_map, loading: () => Tr.get.loading),
            boxDecoration: KHelper.of(context).underLineBox,
            hintStyle: KTextStyle.of(context).black_grey.S(1.4),
            controller: detailedController,
            enabled: false,
          ),
          onTap: () {
            GetLocationCubit.of(context).initLocation().then(
              (value) async {
                value.fold(
                  (l) => KHelper.showSnackBar(KFailure.toError(l)),
                  (r) async {
                    try {
                      result = await KHelper.showMaps(context);
                      if (result != null) {
                        debugPrint(result!.address.toString() + 'asdasd');

                        detailedController.text = result?.address ?? "";
                      }
                    } catch (e) {
                      KHelper.showSnackBar(Tr.get.address_is_null);
                    }
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
