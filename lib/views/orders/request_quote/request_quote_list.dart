import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../data/models/orders/request_quote_.dart';
import '../../../packages/extensions.dart';
import '../../../logic/orders/get_request_quoet/get_request_quoet_bloc.dart';
import '../../../logic/orders/get_request_quoet/get_request_quoet_state.dart';
import '../../../packages/chat/data/models/chat_model.dart';
import '../../../packages/chat/view/widgets/chat_icon_btn.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../services/delivering/widgets/key_value_text.dart';
import '../../widgets/appbar.dart';
import '../../widgets/loading/loading_overlay.dart';
import '../../widgets/new_bg_img.dart';
import '../../widgets/relative_date_time.dart';
import '../../widgets/slugs_drop_down.dart';

class RequestsLanding extends StatefulWidget {
  const RequestsLanding({super.key});

  @override
  State<RequestsLanding> createState() => _RequestsLandingState();
}

class _RequestsLandingState extends State<RequestsLanding> {
  KSlugModel? selectedTab = KSlugModel.requestQuoteStates.firstOrNull;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(title: Tr.get.request_for_quote),
      body: BlocBuilder<GetRequestQuoteBloc, GetRequestQuoteState>(
        builder: (context, state) {
          return KLoadingOverlay(
            isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
            child: BgImg(
              child: DefaultTabController(
                length: KSlugModel.requestQuoteStates.length,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    TabBar(
                      onTap: (i) {
                        setState(() {
                          selectedTab = KSlugModel.requestQuoteStates[i];
                        });
                      },
                      indicatorColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      labelPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                      tabs: [
                        ...KSlugModel.requestQuoteStates
                            .map((e) => Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      e.translated,
                                      style: e != selectedTab ? KTextStyle.of(context).accent_txt_B.S(1.2) : KTextStyle.of(context).black_txt.S(1.4).B,
                                      textAlign: TextAlign.center,
                                    )),
                                    if (e.slug != 'canceled')
                                      Container(
                                        width: 2,
                                        height: 20,
                                        color: Colors.black,
                                      )
                                  ],
                                ))
                            .toList(),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ...KSlugModel.requestQuoteStates.map((e) => RequestForQuotesView(quotes: GetRequestQuoteBloc.of(context).getFiltered(e.slug))).toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RequestForQuotesView extends StatelessWidget {
  const RequestForQuotesView({Key? key, required this.quotes}) : super(key: key);
  final List<RequestQuoteModel> quotes;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await GetRequestQuoteBloc.of(context).get();
      },
      child: quotes.isEmpty
          ? Center(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Text(Tr.get.request_for_quote),
              ),
            )
          : ListView.separated(
              separatorBuilder: (context, index) => 20.h,
              padding: const EdgeInsets.only(top: 20, bottom: 100),
              itemCount: quotes.length,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return RequestQuotesTile(data: quotes[index]);
              },
            ),
    );
  }
}

class RequestQuotesTile extends StatelessWidget {
  const RequestQuotesTile({Key? key, required this.data}) : super(key: key);
  final RequestQuoteModel data;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRequestQuoteBloc, GetRequestQuoteState>(
      builder: (context, state) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 5),
              padding: const EdgeInsets.all(KHelper.hPadding),
              width: Get.width,
              decoration: KHelper.of(context).msgBubble,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: SizedBox(
                      width: 48,
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                        backgroundImage: CachedNetworkImageProvider(
                          data.companyBranchId?.company?.logo?.s128px ?? dummyNetLogo,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        KeyValueText(title: '#', value: '${data.id}'),
                        5.h,
                        Text(
                          data.companyBranchId?.company?.name?.value ?? '',
                          style: KTextStyle.of(context).names,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        5.h,
                        5.h,
                        Text(data.paragraph ?? '', style: KTextStyle.of(context).body),
                        8.h,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RelativeDateTimeWidget(
                              dateTime: DateTime.tryParse(data.created_at ?? "") ?? DateTime.now(),
                              textStyle: KTextStyle.of(context).hint,
                            )
                            // AnimatedRelativeDateTimeBuilder(
                            //   builder: (relativeDateTime, formatted) {
                            //     return Text(formatted, style: KTextStyle.of(context).hint, maxLines: 1, overflow: TextOverflow.ellipsis);
                            //   },
                            //   date: DateTime.tryParse(data.created_at ?? "") ?? DateTime.now(),
                            //
                            // ),
                          ],
                        ),
                        15.h,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -10,
              right: 20,
              child: Row(
                children: [
                  /// KIconButton(
                  ///   backgroundColor: KColors.accentColorL,
                  ///   onPressed: () async {
                  ///     await launchUrlString('tel:${data.companyBranchId?.company?.mo}');
                  ///   },
                  ///   child: const Icon(Icons.phone, color: Colors.white),
                  /// ),
                  /// const SizedBox(width: 10),
                  data.vendor_chat_id != null
                      ? KChatIconButton(roomType: ChatRoomType.requestQuote, room_id: data.vendor_chat_id)
                      : KChatIconButton(roomType: ChatRoomType.requestQuote, room_type_id: data.id, order_chat_type: 'client'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
