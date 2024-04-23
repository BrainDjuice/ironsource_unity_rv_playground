import 'package:advertising_id/advertising_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ironsource_mediation/ironsource_mediation.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen>
    with LevelPlayRewardedVideoListener {
  Future<void> initIronSource() async {
    final appKey = '1e3f2a01d';
    try {
      print('1');
      IronSource.setFlutterVersion('3.19.2');
      print('2');
      IronSource.validateIntegration();
      print('3');
      IronSource.setLevelPlayRewardedVideoListener(this);
      print('4');
      await IronSource.setAdaptersDebug(true);
      print('5');
      await IronSource.shouldTrackNetworkState(true);
      print('6');

      // Do not use GAID or IDFA for this.
      await IronSource.setUserId("unique-application-user-id");
      print('7');
      await IronSource.init(
          appKey: appKey, adUnits: [IronSourceAdUnit.RewardedVideo]);
      print('8');
    } on PlatformException catch (e) {
      print('00000000000000000000000');
      print(e);
      print('00000000000000000000000');
    }
  }

  Future<void> _showRVOnClick() async {
    print('9');
    if (await IronSource.isRewardedVideoAvailable()) {
      print('10');
      IronSource.showRewardedVideo();
    }
    print('11');
  }

  void getAdvertisingId() async {
    try {
      final advertisingId = await AdvertisingId.id(true);
      print('advertisingId: $advertisingId');
    } on PlatformException catch (e) {
      print('error: $e');
    }
  }

  @override
  initState() {
    super.initState();
    initIronSource();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showRVOnClick();
        },
        child: Icon(Icons.play_arrow),
      ),
      body: Center(
        child: Text('Video Screen'),
      ),
    );
  }

  @override
  void onAdAvailable(IronSourceAdInfo adInfo) {
    // TODO: implement onAdAvailable
  }

  @override
  void onAdClicked(
      IronSourceRewardedVideoPlacement placement, IronSourceAdInfo adInfo) {
    // TODO: implement onAdClicked
  }

  @override
  void onAdClosed(IronSourceAdInfo adInfo) {
    // TODO: implement onAdClosed
  }

  @override
  void onAdOpened(IronSourceAdInfo adInfo) {
    // TODO: implement onAdOpened
  }

  @override
  void onAdRewarded(
      IronSourceRewardedVideoPlacement placement, IronSourceAdInfo adInfo) {
    // TODO: implement onAdRewarded
  }

  @override
  void onAdShowFailed(IronSourceError error, IronSourceAdInfo adInfo) {
    // TODO: implement onAdShowFailed
  }

  @override
  void onAdUnavailable() {
    // TODO: implement onAdUnavailable
  }
}
