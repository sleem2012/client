import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/global/location/cities/cities_model.dart';
import '../../data/models/global/location/countries/countries_model.dart';
import '../../logic/global/location/location_bloc.dart';
import '../../logic/global/location/location_state.dart';
import '../../packages/multi_select_dialog/index.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/helper.dart';
import '../../packages/widgets/image_widget.dart';

class CitySelector extends StatelessWidget {
  const CitySelector({Key? key, required this.onChanged}) : super(key: key);
  final Function(CitiesDatum citiesDatum) onChanged;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        final countryList = LocationBloc.of(context).countriesModel?.data ?? [];
        final cityList = LocationBloc.of(context).citiesModel?.data ?? [];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MultiSelector.single<CountriesDatum>(
              popupDecoration: KHelper.of(context).elevatedBox,
              btnDecoration: KHelper.of(context).underLineBox,
              type: SelectorViewType.sheet,
              title: state.maybeWhen(orElse: () => false, loading: () => true && LocationBloc.of(context).countriesModel == null) ? Tr.get.loading : Tr.get.select_country,
              items: countryList
                  .map(
                    (e) => KHelper.of(context).itemView<CountriesDatum>(
                      itemText: e.name?.value ?? '',
                      value: e,
                      icon: KImageWidget(imageUrl: e.flag ?? '', width: 20),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  LocationBloc.of(context).getCities("${value.id}");
                }
              },
              validator: (values) {
                if (values == null) {
                  return Tr.get.field_required;
                } else {
                  return null;
                }
              },
            ),
            MultiSelector.single<CitiesDatum>(
              popupDecoration: KHelper.of(context).elevatedBox,
              btnDecoration: KHelper.of(context).underLineBox,
              title: state.maybeWhen(orElse: () => false, loading: () => true && LocationBloc.of(context).citiesModel == null) ? Tr.get.loading : Tr.get.select_city,
              items: cityList
                  .map(
                    (e) => KHelper.of(context).itemView<CitiesDatum>(
                      itemText: e.name?.value ?? '',
                      value: e,
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  onChanged.call(value);
                  debugPrint(value.id.toString());
                }
              },
              validator: (values) {
                if (values == null) {
                  return Tr.get.field_required;
                } else {
                  return null;
                }
              },
            ),
          ],
        );
      },
    );
  }
}
