import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../error/error_view.dart';
import 'package:get/get.dart';

class KLoadingOverlay extends StatelessWidget {
  final Widget? child;
  final bool isLoading;
  const KLoadingOverlay({Key? key, this.child, this.isLoading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          child ?? SizedBox(width: Get.width, height: Get.height),
          if (isLoading)
            Positioned(
              top: 0,
              width: Get.width,
              height: Get.height,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(KHelper.btnRadius),
                  ),
                ),
              ),
            ),
          if (isLoading)
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      backgroundColor: KColors.of(context).accentColor,
                      // valueColor: An,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/images/Logo Only.svg',
                    height: 60,
                    width: 60,
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class KRequestOverlay extends StatelessWidget {
  final Widget? child;
  final bool isLoading;
  final String? error;
  final Widget? loadingWidget;
  final void Function()? onTryAgain;
  const KRequestOverlay({Key? key, this.child, required this.isLoading, this.error, this.onTryAgain, this.loadingWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          if (isLoading)
            loadingWidget ??
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
                  child: Center(
                    child: Container(
                      color: Colors.transparent,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              backgroundColor: KColors.of(context).accentColor,
                            ),
                          ),
                          SvgPicture.asset('assets/images/Logo Only.svg', height: 60, width: 60)
                        ],
                      ),
                    ),
                  ),
                )
          else if (error != null)
            KErrorView(error: error, onTryAgain: onTryAgain)
          else
            child ?? SizedBox(width: Get.width, height: Get.height),
        ],
      ),
    );
  }
}
