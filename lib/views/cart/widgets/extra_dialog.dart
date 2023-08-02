import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/cart/cart_model.dart';
import '../../../di.dart';
import '../../../logic/cart/cart_bloc.dart';
import '../../../logic/extra/extra_cubit.dart';
import '../../../logic/extra/extra_state.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../widgets/action_dialog.dart';

class ExtraDialog extends StatelessWidget {
  const ExtraDialog({Key? key, required this.item}) : super(key: key);
  final CartItems item;

  @override
  Widget build(BuildContext context) {
    final extraCollection = item.extras ?? [];
    return BlocProvider(
      create: (context) => Di.extraBloc..setInitial(extraCollection),
      child: BlocConsumer<ExtraBloc, ExtraState>(
        listener: (context, state) {
          state.whenOrNull(success: (model) {
            CartBloc.of(context).updateCartModel(model);
          });
        },
        builder: (context, state) {
          final extraBloc = ExtraBloc.of(context);
          return Container(
            decoration: KHelper.of(context).elevatedBox,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: extraCollection.length,
                shrinkWrap: true,
                itemBuilder: (context, i) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            // SizedBox(
                            //   width: 50,
                            //   height: 50,
                            //   child: Image.network(
                            //     extraCollection[i].productMenuId?.imageValues?[0].s128px ?? '',
                            //     fit: BoxFit.cover,
                            //   ),
                            // ),
                            const SizedBox(width: 8),
                            Text(extraCollection[i].name ?? '',
                                style: KTextStyle.of(context).body.copyWith(color: KColors.of(context).text, fontSize: 12)),
                            const SizedBox(width: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    extraBloc.decreaseExtraAmount(extraCollection[i].id ?? 0);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(color: KColors.of(context).freeShiping, borderRadius: BorderRadius.circular(8)),
                                    child: const Icon(Icons.remove, color: Colors.white, size: 10),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Text(
                                  extraBloc.extraAmount[extraCollection[i].id ?? 0].toString(),
                                  style: TextStyle(color: KColors.of(context).text, fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    extraBloc.increaseExtraAmount(extraCollection[i].id ?? 0);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(color: KColors.of(context).freeShiping, borderRadius: BorderRadius.circular(8)),
                                    child: const Icon(Icons.add, color: Colors.white, size: 10),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                if (extraBloc.extraAmount[extraCollection[i].id] != extraBloc.initExtraAmountMap[extraCollection[i].id])
                                  state.maybeWhen(
                                    loading: (id) => id == extraCollection[i].id
                                        ? SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: Center(
                                                child: CircularProgressIndicator(
                                              color: KColors.of(context).accentColor,
                                            )))
                                        : SizedBox(
                                            width: 40,
                                            height: 25,
                                            child: RawMaterialButton(
                                              onPressed: () {
                                                extraBloc.updateExtra(
                                                  id: (extraCollection[i].id ?? 0),
                                                  amount: (extraBloc.extraAmount[extraCollection[i].id] ?? 0),
                                                  pro_id: item.id ?? -1,
                                                );
                                              },
                                              fillColor: KColors.of(context).accentColor,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                              child: Text(Tr.get.update, style: KTextStyle.of(context).editBTN),
                                            ),
                                          ),
                                    orElse: () => SizedBox(
                                      width: 40,
                                      height: 25,
                                      child: RawMaterialButton(
                                        onPressed: () {
                                          extraBloc.updateExtra(
                                            pro_id: item.id ?? -1,
                                            id: (extraCollection[i].id ?? 0),
                                            amount: (extraBloc.extraAmount[extraCollection[i].id] ?? 0),
                                          );
                                        },
                                        fillColor: KColors.of(context).accentColor,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                        child: Text(Tr.get.update, style: KTextStyle.of(context).editBTN),
                                      ),
                                    ),
                                  )
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text('${Tr.get.price} : ', style: KTextStyle.of(context).body.copyWith(color: Colors.grey, fontSize: 12)),
                            Text(extraCollection[i].price.toString(),
                                style: KTextStyle.of(context).body.copyWith(color: KColors.of(context).text, fontSize: 12)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Icon(
                              Icons.delete,
                              size: 20,
                              color: KColors.of(context).error,
                            ),
                            onTap: () {
                              ActionDialog(
                                title: Tr.get.remove_extra,
                                approveAction: Tr.get.yes_message,
                                cancelAction: Tr.get.no_message,
                                onApproveClick: () {
                                  Navigator.pop(context);
                                  extraBloc.delete(extraCollection[i].id ?? 0);
                                  extraCollection.removeAt(i);
                                },
                                onCancelClick: () {
                                  Navigator.pop(context);
                                },
                              ).show<void>(context);
                            },
                          ),
                        )
                      ],
                    )),
          );
        },
      ),
    );
  }
}
