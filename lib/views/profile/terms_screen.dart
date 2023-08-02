import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/global/settings/settings_bloc.dart';
import '../../shared/localization/trans.dart';
import '../widgets/appbar.dart';
import '../widgets/error/error_widget.dart';
import '../widgets/loading/loading_overlay.dart';

import '../../logic/global/settings/settings_state.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  KAppBar(title: Tr.get.terms_and_conditions),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return state.when(
              initial: () => const KLoadingOverlay(isLoading: true),
              loading: () => const KLoadingOverlay(isLoading: true),
              success: (model) =>
               Padding(
                padding: const EdgeInsets.all(20),
                child: Text(model.data?[0].termsAndConditions?.value??''),
              ),
              error: (error) =>
                  KErrorWidget(
                    error: state.whenOrNull(error: (error) => error),
                    isError: true,
                    onTryAgain: SettingsBloc
                        .of(context)
                        .getSettings,
                  ));
        },
      ),
    );
  }
}
