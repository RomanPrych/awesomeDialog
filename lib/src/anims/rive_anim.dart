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
    return ClipOval(
      clipper: _InsetOvalClipper(2),
      child: Gif(
        image: AssetImage(gif),
        duration: const Duration(milliseconds: 3500),
        autostart: Autostart.loop,
        placeholder: (context) => const SizedBox.shrink(),
      ),
    );
  }


}
class _InsetOvalClipper extends CustomClipper<Rect> {
  final double inset;
  _InsetOvalClipper(this.inset);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(inset, inset, size.width - inset * 2, size.height - inset * 2);
  }

  @override
  bool shouldReclip(_InsetOvalClipper oldClipper) => inset != oldClipper.inset;
}