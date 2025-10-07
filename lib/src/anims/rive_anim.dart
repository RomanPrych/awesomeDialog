import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
// import 'package:rive/rive.dart';

///RiveRuntimeRender
class RiveAssetAnimation extends StatefulWidget {
  ///Constructor
  const RiveAssetAnimation({
    required this.assetPath,
    required this.animName,
    Key? key,
  }) : super(key: key);

  ///Path of the .riv assets file
  final String assetPath;

  ///Name od the animation to load
  final String animName;

  @override
  State<RiveAssetAnimation> createState() => _RiveAnimationState();
}

class _RiveAnimationState extends State<RiveAssetAnimation> {
  // Controller for playback
  // late RiveAnimationController<dynamic> _controller;

  @override
  void initState() {

    super.initState();

    // _controller = SimpleAnimation(widget.animName);
  }

  @override
  Widget build(BuildContext context) {
    String gif = "${widget.assetPath.split('.').first}.gif";
    return Container(
      color: Colors.red,
      padding: EdgeInsets.all(10),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: ClipOval(
          child: Gif(
            image: AssetImage(gif),
            duration: const Duration(milliseconds: 3500),
            autostart: Autostart.loop,
            placeholder: (context) => const Text('Loading...'),
          ),
        ),
      ),
    );
  }
}
