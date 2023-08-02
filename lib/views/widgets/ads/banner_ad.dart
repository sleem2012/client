/// import 'dart:developer';
/// import 'package:flutter/material.dart';
/// import 'package:forall_client/shared/ads_helper.dart';
/// import 'package:google_mobile_ads/google_mobile_ads.dart';

/// class AdBanner extends StatefulWidget {
///   const AdBanner({Key? key}) : super(key: key);

///   @override
///   AdBannerState createState() => AdBannerState();
/// }

/// class AdBannerState extends State<AdBanner> {
///   late BannerAd bannerAd;
///   bool _isAdReady = false;
///   AdSize adSize = AdSize.banner;
///   final int maxFailedLoadAttempts = 2;

///   // int _numBannerLoadAttempts = 0;

///   void _createBannerAd() {
///     bannerAd = BannerAd(
///       size: adSize,
///       adUnitId: AdHelper.bannerAdUnit,
///       listener: BannerAdListener(
///         onAdLoaded: (_) {
///           setState(() {
///             _isAdReady = true;
///             debugPrint('ads ====== loaded');
///           });
///         },
///         onAdFailedToLoad: (ad, err) {
///           log('bannerAd failed to load: ${err.message}');
///           adSize = const AdSize(width: 0, height: 0);
///           ad.dispose();
///           // _numBannerLoadAttempts += 1;
///           // if (_numBannerLoadAttempts <= maxFailedLoadAttempts) {
///           //   _createBannerAd();
///           // }
///         },
///       ),
///       request: const AdRequest(),
///     );

///     bannerAd.load();
///   }

///   @override
///   void initState() {
///     _createBannerAd();
///     super.initState();
///   }

///   @override
///   void dispose() {
///     bannerAd.dispose();
///     super.dispose();
///   }

///   @override
///   Widget build(BuildContext context) {
///     if (_isAdReady) {
///       return Container(
///         height: adSize.height.toDouble(),
///         width: adSize.width.toDouble(),
///         alignment: Alignment.center,
///         child: AdWidget(ad: bannerAd),
///       );
///     }

///     return Container(
///       color: Colors.transparent,
///     );
///   }
/// }
