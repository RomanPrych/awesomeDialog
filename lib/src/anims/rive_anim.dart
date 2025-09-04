import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

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
  late RiveWidgetController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RiveWidgetBuilder(
      controller: (_) => _controller = RiveWidgetController(_),
      fileLoader:
          FileLoader.fromAsset(widget.assetPath, riveFactory: Factory.flutter),
      builder: (BuildContext context, RiveState state) {
        if (state is RiveLoading) {
          return Text('RiveLoading');
        } else if (state is RiveLoaded) {
          return RiveWidget(
            controller: _controller,
          );
        } else if (state is RiveFailed) {
          return Text('RiveFailed');
        } else {
          return Text('RiveFailed');
        }
      },
    );
  }
}
