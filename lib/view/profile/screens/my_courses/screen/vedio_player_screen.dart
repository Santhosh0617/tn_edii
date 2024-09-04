import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VedioPlayerScreen extends StatefulWidget {
  const VedioPlayerScreen({super.key});

  @override
  State<VedioPlayerScreen> createState() => _VedioPlayerScreenState();
}

class _VedioPlayerScreenState extends State<VedioPlayerScreen> {
  final _controller = YoutubePlayerController(
    params: const YoutubePlayerParams(
      pointerEvents: PointerEvents.none,
      enableCaption: false,
      showControls: false,
      showFullscreenButton: false,
    ),
  );
  @override
  void initState() {
    super.initState();
    // TO load a video by its unique id
    _controller.loadVideoById(videoId: "n1kzVWu2Uks");
    WidgetsBinding.instance.addPostFrameCallback((t) {
      String url = (GoRouterState.of(context).extra ?? '') as String;
      _controller.loadVideoById(videoId: url.split('/').last);
      // _controller.loadVideo(url);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      color: Palette.bg,
      appBar: AppBarCommon(
        automaticLeadingImplies: true,
        title: "Player Screen",
        isText: false,
      ),
      body: RotatedBox(
        quarterTurns: 1,
        child: YoutubePlayer(
          controller: _controller,
          // Controler that we created earlier
          aspectRatio: 16 / 9, // Aspect ratio you want to take in screen
        ),
      ),
    );
  }
}
