import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/report/report_model.dart';
import '../../logic/get_reports/get_reports_bloc.dart';
import '../../logic/get_reports/get_reports_state.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/helper.dart';
import '../../shared/theme/text_theme.dart';
import '../widgets/appbar.dart';
import '../widgets/empty_widget.dart';
import '../widgets/loading/loading_overlay.dart';
import '../widgets/new_bg_img.dart';
import '../widgets/slugs_drop_down.dart';
import 'report_attrs_view.dart';

class ReportLandingView extends StatelessWidget {
  const ReportLandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: KAppBar(title: Tr.get.report),
        body: BlocBuilder<GetReportsBloc, GetReportsState>(
          builder: (context, state) {
            return KRequestOverlay(
              isLoading: state is GetReportsStateLoading,
              error: state is GetReportsStateError ? state.error : null,
              onTryAgain: GetReportsBloc.of(context).get,
              child: BgImg(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TabBar(
                        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 15),
                        labelPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: [
                          Text(Tr.get.open, style: KTextStyle.of(context).names),
                          Text(Tr.get.closed, style: KTextStyle.of(context).names),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ReportsListView(reports: GetReportsBloc.of(context).openedReports, state: KSlugModel.opened),
                          ReportsListView(reports: GetReportsBloc.of(context).canceledReports, state: KSlugModel.canceled),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ReportsListView extends StatelessWidget {
  const ReportsListView({Key? key, required this.reports, required this.state}) : super(key: key);

  final List<ReportData> reports;
  final String state;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => GetReportsBloc.of(context).get(),
      child: EmptyWidget(
        imagePath: "assets/images/no_reports.svg",
        list: reports,
        title: Tr.get.no_reports_yet,
        child: AnimatedList(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
          physics: const AlwaysScrollableScrollPhysics(),
          initialItemCount: reports.length,
          itemBuilder: (context, index, animation) {
            return ReportTile(report: reports[index], animation: animation);
          },
        ),
      ),
    );
  }
}

class ReportTile extends StatefulWidget {
  const ReportTile({Key? key, required this.report, this.animation}) : super(key: key);

  final ReportData report;

  final Animation<double>? animation;

  @override
  State<ReportTile> createState() => _ReportTileState();
}

class _ReportTileState extends State<ReportTile> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: widget.animation ?? CurvedAnimation(parent: AnimationController(vsync: this), curve: Curves.easeOutCubic),
      child: Container(
        decoration: KHelper.of(context).elevatedBox,
        padding: const EdgeInsets.only(bottom: 5),
        margin: const EdgeInsets.only(bottom: 5),
        child: ListTile(
          title: Text("${widget.report.user?.name}  ,  ${widget.report.title}"),
          subtitle: Text(
            "${widget.report.paragraph}",
            style: KTextStyle.of(context).hint3,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          leading: Hero(
            tag: "img${widget.report.id}",
            child: CircleAvatar(backgroundImage: CachedNetworkImageProvider(widget.report.user?.image?.s32px ?? dummyNetLogo)),
          ),
          onTap: () {
            Nav.to(AttributesView(reportData: widget.report));
          },
        ),
      ),
    );
  }
}
