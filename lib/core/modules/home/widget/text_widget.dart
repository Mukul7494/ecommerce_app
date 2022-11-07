import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget buildCustomText() {
  return const FancyTextReveal(
    child: Text(
      'Start Shopping Now',
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          letterSpacing: 1.0,
          wordSpacing: 5.0,
          shadows: [
            Shadow(
              blurRadius: 10.0,
              color: Color.fromARGB(171, 33, 149, 243),
              offset: Offset(5.0, 5.0),
            ),
            Shadow(
              color: Color.fromARGB(226, 226, 211, 4),
              blurRadius: 10.0,
              offset: Offset(-5.0, 5.0),
            ),
          ],
          color: Color.fromARGB(255, 175, 24, 57),
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
          fontFamily: 'Open Sans',
          fontSize: 40),
    ),
  );
}

typedef OnWidgetSizeChange = void Function(Size size);

class MeasureSizeRenderObject extends RenderProxyBox {
  Size? oldSize;
  final OnWidgetSizeChange onChange;

  MeasureSizeRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();

    final Size newSize = child!.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}

//Usecase Widget
class MeasureSize extends SingleChildRenderObjectWidget {
  final OnWidgetSizeChange onChange;

  const MeasureSize({
    Key? key,
    required this.onChange,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return MeasureSizeRenderObject(onChange);
  }
}

/// ```Example Usecase
/// @override
Widget build(BuildContext context) {
  return FancyTextReveal(child: Text('You are Awesome!'));
}

/// ```
///[FancyTextReveal] to add fancy text reveal animation.
class FancyTextReveal extends StatefulWidget {
  ///[child] that has to be shown after the reveal animation.
  final Widget child;

  ///[properties] for customizing the properties of the [FancyTextReveal]
  final Properties properties;

  const FancyTextReveal(
      {Key? key,
      required this.child,
      this.properties = const Properties(
        decoration: BoxDecoration(color: Color.fromARGB(201, 96, 157, 226)),
      )})
      : super(key: key);

  @override
  _FancyTextRevealState createState() => _FancyTextRevealState();
}

class _FancyTextRevealState extends State<FancyTextReveal>
    with SingleTickerProviderStateMixin {
  ///The main AnimationController that drives the animation.
  AnimationController? _animationController;

  ///Animation thats responsible for animating between 0 and width of [child].
  ///
  ///The size of the [child] is measured in the very beginning and trigger
  ///[_animationController] to start the animation.
  Animation<double>? _animation;

  ///To update the size of the [child] and use it as end parameter for [_animation].
  ///
  ///Initially size is set to Size(0.0,0.0)
  ValueNotifier<Size> _notifier = ValueNotifier(Size(0.0, 0.0));

  ///Alignment of the [CrossFadeState]
  ///
  ///After one [AnimationStatus.completed] it is set to [Alignment.centerRight]
  Alignment _alignment = Alignment.centerLeft;

  ///Toggle to stop the animation after finished.
  ///
  ///After the [_animationController] completes the forward and reverse animation.
  bool shouldStop = false;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.properties.milliseconds))
      ..addStatusListener(_listener);

    super.initState();
  }

  void _listener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _alignment = Alignment.centerRight;
      _animationController!.reverse();
      setState(() {
        shouldStop = true;
      });
    }
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  Widget get _child => MeasureSize(
      onChange: (newSize) => _notifier.value = newSize, child: widget.child);

  Animation get _getAnimation => Tween(
          begin: 0.0,
          end: _notifier.value.width + widget.properties.horizontalSpacing)
      .animate(CurvedAnimation(
          parent: _animationController!, curve: Curves.fastOutSlowIn));

  void _startAnimation() {
    if (_notifier.value.height != 0.0) {
      _animation = _getAnimation as Animation<double>?;

      //Start the animation if not.
      if (_animationController!.status == AnimationStatus.dismissed) {
        if (!shouldStop) {
          _animationController!.forward();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_notifier, _animationController]),
      builder: (BuildContext context, Widget? _) {
        _startAnimation();
        final _height = _notifier.value.height;
        final value = _animation?.value;
        return Stack(
          alignment: _alignment,
          children: [
            AnimatedCrossFade(
              firstChild: _child,
              secondChild: Opacity(opacity: 0.0, child: _child),
              crossFadeState: _alignment == Alignment.centerRight
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: _animationController!.duration!,
            ),
            Container(
              alignment: Alignment.center,
              height: _height + widget.properties.verticalSpacing,
              width: _notifier.value.height != 0.0 ? value : 0.0,
              decoration: widget.properties.decoration,
            )
          ],
        );
      },
    );
  }
}

///Customization for [FancyTextReveal]
class Properties {
  ///For custom box decoration of the container.
  ///
  ///By default set to BoxDecoration(color: Colors.white)
  final Decoration? decoration;

  ///Duration of the animation.
  final int milliseconds;

  ///For adding vertical padding to the container.
  final double verticalSpacing;

  ///For adding horizontal padding to the container.
  final double horizontalSpacing;

  const Properties({
    this.decoration,
    this.milliseconds = 1000,
    this.verticalSpacing = 0.0,
    this.horizontalSpacing = 3,
  });
}
