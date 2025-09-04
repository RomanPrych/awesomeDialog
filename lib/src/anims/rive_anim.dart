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
  bool canShow = false;
  // Controller for playback
   late RiveWidgetController _controller ;
   late File _file;
   @override
  void initState() {
    super.initState();
    _getFile();
  }

  Future <void> _getFile ()async{
   _file = await FileLoader.fromAsset(widget.assetPath, riveFactory: Factory.flutter).file();
   _controller =  RiveWidgetController(_file);
   canShow = true;
   setState(() {

   });
  }

  @override
  Widget build(BuildContext context) {
    if(canShow){
      return RiveWidget(
        controller: _controller,
      );
    }
    return Text('Wait please...');
    // return RiveAnimation.asset(
    //   widget.assetPath,
    //   controllers: [_controller],
    // );
  }
}
