import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/global/languages/languages_model.dart';
import '../../logic/global/languages/languages_states.dart';
import '../../logic/global/languages/langugese_bloc.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/helper.dart';
import 'drop_down.dart';

class LanguageDropdown extends StatelessWidget {
  final Function(LangDatum?) onSelect;

  const LanguageDropdown({
    Key? key,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguagesBloc, LanguagesState>(
      builder: (context, state) {
        final langList = state.maybeWhen(
          orElse: () => <LangDatum>[],
          success: (langDatum, model) => model.data!,
        );
        return Column(
          children: [
            KDropdownBtn<LangDatum>(
              onChanged: onSelect,
              items: langList.map((e) => KHelper.of(context).itemView<LangDatum>(itemText: "${e.nameValues?.value}", value: e)).toList(),
              title: state.maybeWhen(orElse: () => false, loading: () => true) ? Tr.get.loading : Tr.get.select_language,
              value: LanguagesBloc.of(context).seletedLang,
            ),
            if (state.maybeWhen(orElse: () => false, error: (e) => true))
              TextButton(
                onPressed: LanguagesBloc.of(context).getAllLangs,
                child: Text(Tr.get.try_again),
              ),
          ],
        );
      },
    );
  }
}
