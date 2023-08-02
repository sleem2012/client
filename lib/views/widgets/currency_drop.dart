import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/global/currencies/currencies_model.dart';
import '../../logic/global/currencies/currencies_bloc.dart';
import '../../logic/global/currencies/currencies_state.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/helper.dart';
import 'drop_down.dart';

class CurrenciesDropdown extends StatelessWidget {
  final Function(String?) onSelect;
  const CurrenciesDropdown({Key? key, required this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrenciesBloc, CurrenciesState>(
      builder: (context, state) {
        final currency = state.maybeWhen(
          orElse: () => <CurrenciesData>[],
          success: (currencyDatum, model) => model.data!,
        );
        return Column(
          children: [
            KDropdownBtn<String>(
              onChanged: onSelect,
              items: currency.map((e) => KHelper.of(context).itemView<String>(itemText: "${e.name?.value}", value: "${e.symbols}")).toList(),
              title: state.maybeWhen(orElse: () => false, loading: () => true) ? Tr.get.loading : Tr.get.select_currency,
              value: CurrenciesBloc.of(context).selectedCurrency,
            ),
            if (state.maybeWhen(orElse: () => false, error: (e) => true))
              TextButton(
                onPressed: CurrenciesBloc.of(context).getCurrencies,
                child: Text(Tr.get.try_again),
              ),
          ],
        );
      },
    );
  }
}
