import 'package:flutter/cupertino.dart';
import 'package:live_stream_demo/constant.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class LivePage extends StatelessWidget {
  final String liveID;
  final String userID;
  final String name;
  final bool isHost;

  const LivePage({Key? key, required this.liveID, this.isHost = false,required this.userID,required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID: appID,// Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: appSign,// Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: userID,
        userName: 'user_name',
        liveID: liveID,
        config: isHost
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
      ),
    );
  }
}