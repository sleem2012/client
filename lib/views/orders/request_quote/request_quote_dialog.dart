import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../di.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../logic/orders/send_request_quote/send_request_quote_state.dart';
import '../../../logic/orders/send_request_quote/send_request_quote_bloc.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/text_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/loading/loading_overlay.dart';
import '../../widgets/text_field.dart';

class RequestForQuoteDialog extends StatelessWidget {
  final int? companyId;

  const RequestForQuoteDialog({Key? key, required this.companyId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController textCtrl = TextEditingController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Material(
          color: KColors.of(context).background,
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: BlocProvider(
                create: (context) => Di.sendRequestQuoteBloc,
                child: BlocConsumer<SendRequestQuoteBloc, SendRequestQuoteState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      success: () {
                        Nav.back();
                      },
                    );
                  },
                  builder: (context, state) {
                    return KLoadingOverlay(
                      isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                      child: Column(
                        children: [
                          Text(Tr.get.request_for_quote),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: KTextFormField(
                              controller: textCtrl,
                              maxLines: 5,
                              maxLength: 500,
                              hintText: Tr.get.your_request,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return Tr.get.field_required;
                                }

                                return null;
                              },
                            ),
                          ),
                          state.maybeWhen(
                            orElse: () => const SizedBox(),
                            error: (failure) => Column(
                              children: [
                                Text(
                                  KFailure.toError(failure).replaceAll("(", '').replaceAll(")", ''),
                                  style: KTextStyle.of(context).error,
                                ),
                                const SizedBox(width: 20),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: KButton(
                                  title: Tr.get.apply,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      FocusManager.instance.primaryFocus?.unfocus();
                                      SendRequestQuoteBloc.of(context).post(paragraph: textCtrl.text, company_id: companyId.toString());
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: TextButton(
                                  child: Text(
                                    Tr.get.cancel,
                                    style: TextStyle(color: KColors.of(context).accentColor),
                                  ),
                                  onPressed: () {
                                    Nav.back();
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
