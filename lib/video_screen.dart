import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ironsource_mediation/ironsource_mediation.dart';
import 'package:logger/logger.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen>
    with
        LevelPlayRewardedVideoManualListener,
        IronSourceInitializationListener,
        IronSourceImpressionDataListener {
  Future<void> initIronSource() async {
    const appKey = '1e3f2a01d';
    try {
      IronSource.setFlutterVersion('3.19.2');
      IronSource.validateIntegration();
      IronSource.setImpressionDataListener(this);
      IronSource.setLevelPlayRewardedVideoManualListener(this);
      await IronSource.setAdaptersDebug(true);
      await IronSource.shouldTrackNetworkState(true);

      // Do not use GAID or IDFA for this.
      await IronSource.setUserId("unique-application-user-id");
      await IronSource.init(
        appKey: appKey,
        adUnits: [IronSourceAdUnit.RewardedVideo],
      );
    } on PlatformException catch (e) {
      Logger().e(e);
    }
  }

  Future<void> showRVOnClick() async {
    if (await IronSource.isRewardedVideoAvailable()) {
      IronSource.showRewardedVideo();
    }
  }

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initIronSource();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showRVOnClick();
        },
        child: Icon(Icons.play_arrow),
      ),
      body: Center(
        child: Text('Video Screen'),
      ),
    );
  }

  @override
  void onInitializationComplete() {
    Logger().i('onInitializationComplete');
  }

  @override
  void onImpressionSuccess(IronSourceImpressionData? impressionData) {
    Logger().i('onImpressionSuccess: $impressionData');
  }

  @override
  void onAdClicked(
      IronSourceRewardedVideoPlacement placement, IronSourceAdInfo adInfo) {
    Logger().i('onAdClicked $placement $adInfo');
  }

  @override
  void onAdClosed(IronSourceAdInfo adInfo) {
    Logger().i('onAdClosed $adInfo');
  }

  @override
  void onAdLoadFailed(IronSourceError error) {
    Logger().i('onAdLoadFailed $error');
  }

  @override
  void onAdOpened(IronSourceAdInfo adInfo) {
    Logger().i('onAdOpened $adInfo');
  }

  @override
  void onAdReady(IronSourceAdInfo adInfo) {
    Logger().i('onAdReady $adInfo');
  }

  @override
  void onAdRewarded(
      IronSourceRewardedVideoPlacement placement, IronSourceAdInfo adInfo) {
    Logger().i('onAdRewarded $placement $adInfo');
  }

  @override
  void onAdShowFailed(IronSourceError error, IronSourceAdInfo adInfo) {
    Logger().i('onAdShowFailed $error $adInfo');
  }
}


//........
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:ironsource_mediation/ironsource_mediation.dart';
// import 'package:logger/logger.dart';
//
// class VideosScreen extends StatefulWidget {
//   const VideosScreen({super.key});
//
//   @override
//   State<VideosScreen> createState() => _VideosScreenState();
// }
//
// class _VideosScreenState extends State<VideosScreen>
//     with
//         LevelPlayRewardedVideoManualListener,
//         IronSourceInitializationListener,
//         IronSourceImpressionDataListener {
//   Future<void> initIronSource() async {
//     const appKey = '1e3f2a01d';
//     try {
//       IronSource.setFlutterVersion('3.19.2');
//       IronSource.validateIntegration();
//       IronSource.setImpressionDataListener(this);
//       IronSource.setLevelPlayRewardedVideoManualListener(this);
//       await IronSource.setAdaptersDebug(true);
//       await IronSource.shouldTrackNetworkState(true);
//
//       // Do not use GAID or IDFA for this.
//       await IronSource.setUserId("unique-application-user-id");
//       await IronSource.init(
//         appKey: appKey,
//         adUnits: [IronSourceAdUnit.RewardedVideo],
//       );
//     } on PlatformException catch (e) {
//       Logger().e(e);
//     }
//   }
//
//   Future<void> showRVOnClick() async {
//     if (await IronSource.isRewardedVideoAvailable()) {
//       IronSource.showRewardedVideo();
//     }
//   }
//
//   @override
//   initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       initIronSource();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showRVOnClick();
//         },
//         child: Icon(Icons.play_arrow),
//       ),
//       body: Center(
//         child: Text('Video Screen'),
//       ),
//     );
//   }
//
//   @override
//   void onInitializationComplete() {
//     Logger().i('onInitializationComplete');
//   }
//
//   @override
//   void onImpressionSuccess(IronSourceImpressionData? impressionData) {
//     Logger().i('onImpressionSuccess: $impressionData');
//   }
//
//   @override
//   void onAdClicked(
//       IronSourceRewardedVideoPlacement placement, IronSourceAdInfo adInfo) {
//     Logger().i('onAdClicked $placement $adInfo');
//   }
//
//   @override
//   void onAdClosed(IronSourceAdInfo adInfo) {
//     Logger().i('onAdClosed $adInfo');
//   }
//
//   @override
//   void onAdLoadFailed(IronSourceError error) {
//     Logger().i('onAdLoadFailed $error');
//   }
//
//   @override
//   void onAdOpened(IronSourceAdInfo adInfo) {
//     Logger().i('onAdOpened $adInfo');
//   }
//
//   @override
//   void onAdReady(IronSourceAdInfo adInfo) {
//     Logger().i('onAdReady $adInfo');
//   }
//
//   @override
//   void onAdRewarded(
//       IronSourceRewardedVideoPlacement placement, IronSourceAdInfo adInfo) {
//     Logger().i('onAdRewarded $placement $adInfo');
//   }
//
//   @override
//   void onAdShowFailed(IronSourceError error, IronSourceAdInfo adInfo) {
//     Logger().i('onAdShowFailed $error $adInfo');
//   }
// }


//#  advertising_id: ^2.6.0
//   ironsource_mediation: ^1.2.1


//implementation 'com.google.android.gms:play-services-appset:16.0.2'
//     implementation 'com.google.android.gms:play-services-ads-identifier:18.0.1'
//     implementation 'com.google.android.gms:play-services-basement:18.3.0'
// //    implementation 'com.ironsource.sdk:mediationsdk:8.0.0'
// //    implementation 'com.ironsource:adqualitysdk:7.19.0'
//
//     // Add UnityAds Network
//     implementation 'com.ironsource.adapters:unityadsadapter:4.3.37'
//     implementation 'com.unity3d.ads:unity-ads:4.10.0'