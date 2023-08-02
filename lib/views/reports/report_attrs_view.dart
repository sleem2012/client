import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../data/models/report/report_model.dart';
import '../../packages/extensions.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../new_ui/services/company_details.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../../shared/theme/text_theme.dart';
import '../widgets/appbar.dart';
import '../../packages/widgets/icon_button.dart';
import '../../packages/widgets/image_widget.dart';
import '../widgets/new_bg_img.dart';
import '../widgets/photo_viewer.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AttributesView extends StatefulWidget {
  const AttributesView({Key? key, required this.reportData}) : super(key: key);
  final ReportData reportData;

  @override
  State<AttributesView> createState() => _AttributesViewState();
}

class _AttributesViewState extends State<AttributesView> {
  get dateToAge {
    final bd = widget.reportData.user?.birthdate ?? '';
    final l = bd.contains('-')
        ? bd.split('-')
        : bd.contains('/')
            ? bd.split('/')
            : bd;
    final date = l is! String ? DateTime(int.tryParse((l as List)[0]) ?? 0, int.tryParse(l[1]) ?? 0) : DateTime.tryParse(bd) ?? DateTime.now();
    return ((DateTime.now().difference(date).inDays) / 365).ceil().toString();
  }

  bool get isAr => Directionality.of(context) == TextDirection.rtl;
  @override
  Widget build(BuildContext context) {
    final decoration = KHelper.of(context).elevatedBox.copyWith(borderRadius: BorderRadius.circular(0));
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: KAppBar(title: Tr.get.report),
      body: BgImg(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: decoration,
                    width: width,
                    height: 100,
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        const SizedBox(width: 100),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (widget.reportData.title?.capitalized ?? ""),
                                style: KTextStyle.of(context).title1,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${widget.reportData.vendor?.name ?? ""} - ${widget.reportData.vendor?.company?.name?.value ?? ""}",
                                style: KTextStyle.of(context).title3,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                widget.reportData.vendor?.email?.capitalized ?? '',
                                style: KTextStyle.of(context).body3,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: isAr ? null : 20,
                    right: isAr ? 20 : null,
                    bottom: -25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: GestureDetector(
                        onTap: () {
                          Nav.to(
                            KPhotoView(image: widget.reportData.vendor?.image?.s512px ?? dummyNetLogo),
                          );
                        },
                        child: KImageWidget(
                          imageUrl: widget.reportData.vendor?.image?.s128px ?? dummyNetLogo,
                          height: 100,
                          width: 75,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  if (widget.reportData.user?.mobile != null)
                    Positioned(
                      bottom: -15,
                      left: isAr ? 20 : null,
                      right: isAr ? null : 20,
                      child: Row(
                        children: [
                          KIconButton(
                            onPressed: () async {
                              await launchUrlString("tel:${widget.reportData.vendor?.mobile}");
                            },
                            child: CircleAvatar(
                              backgroundColor: KColors.of(context).activeIcons,
                              child: const Icon(Icons.phone, color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 15),
                          if (widget.reportData.vendor?.company != null)
                            KIconButton(
                              onPressed: () async {
                                Nav.to(CompanyDetailsView(company: widget.reportData.vendor!.company!));

                                // Nav.to(CompanyDetailsView(data: widget.reportData.vendor!.company!));
                              },
                              child: CircleAvatar(
                                backgroundColor: KColors.of(context).activeIcons,
                                child: const Icon(Icons.account_balance, color: Colors.white, size: 18),
                              ),
                            ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 40),
              Container(
                decoration: decoration,
                padding: const EdgeInsets.all(10),
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.format_align_left_sharp, size: 18),
                        const SizedBox(width: 10),
                        Text(Tr.get.description, style: KTextStyle.of(context).title2),
                      ],
                    ),
                    const Divider(),
                    Text(widget.reportData.paragraph ?? '', style: KTextStyle.of(context).body2),
                  ],
                ),
              ),
              const SizedBox(height: 3),
              if (widget.reportData.files != null && widget.reportData.files!.isNotEmpty) ...[
                Container(
                  decoration: decoration,
                  width: width,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.file_copy, size: 18),
                          const SizedBox(width: 10),
                          Text(Tr.get.files, style: KTextStyle.of(context).title2),
                        ],
                      ),
                      const Divider(),
                      LayoutBuilder(builder: (context, size) {
                        return Wrap(
                          runSpacing: 0,
                          spacing: 0,
                          children: [
                            ...(widget.reportData.files ?? []).map((e) {
                              return Column(
                                children: [
                                  if (e.isImage)
                                    SizedBox(
                                      width: (size.maxWidth) / 3,
                                      height: size.maxWidth / 3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(KHelper.cornerRadius),
                                          child: InkWell(
                                            onTap: () {
                                              Nav.to(KPhotoView(image: e));
                                            },
                                            child: KImageWidget(imageUrl: e, fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                    )
                                  else
                                    InkWell(
                                      onTap: () {
                                        launchUrlString(e, mode: LaunchMode.externalApplication);
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(Icons.file_copy),
                                          const SizedBox(width: 8),
                                          Expanded(child: Text(e.split('/').last.split('.').last, overflow: TextOverflow.ellipsis, maxLines: 1)),
                                          const KIconButton(child: Icon(Icons.download))
                                        ],
                                      ),
                                    ),
                                ],
                              );
                            }).toList()
                          ],
                        );
                      })
                    ],
                  ),
                ),
                const SizedBox(height: 3),
              ],
              ...(widget.reportData.answersCollection ?? []).map((attr) {
                return Column(
                  children: [
                    Container(
                      decoration: decoration,
                      child: Row(
                        children: [
                          Expanded(
                            child: Wrap(
                              children: [
                                const SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 8),
                                  child: attr.type == 'ImageInput'
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Wrap(
                                            spacing: 8,
                                            children: attr.answerCollections
                                                    ?.map(
                                                      (e) => Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          if (attr.answerCollections?.length != 1)
                                                            Padding(
                                                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                                                              child: Text(e.placeholder?.capitalized ?? "", style: KTextStyle.of(context).hint),
                                                            ),
                                                          ClipRRect(
                                                            borderRadius: BorderRadius.circular(KHelper.hPadding),
                                                            child: GestureDetector(
                                                              onTap: () {
                                                                Nav.to(
                                                                  PhotoView(
                                                                    imageProvider: CachedNetworkImageProvider(e.value!.firstOrNull ?? dummyNetLogo),
                                                                  ),
                                                                );
                                                              },
                                                              child: SizedBox(
                                                                width: 100,
                                                                height: 100,
                                                                child: KImageWidget(
                                                                  imageUrl: e.value!.firstOrNull ?? dummyNetLogo,
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                    .toList() ??
                                                [],
                                          ),
                                        )
                                      : Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(attr.placeholder?.capitalized ?? "", style: KTextStyle.of(context).title2),
                                            const Divider(),
                                            ...attr.answerCollections!.map(
                                              (e) {
                                                return Wrap(children: [...e.value?.map((x) => Text(x)).toList() ?? []]);
                                              },
                                            ).toList()
                                          ],
                                        ),
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 3),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
