import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_floatwing/flutter_floatwing.dart';

class NonrmalView extends StatefulWidget {
  const NonrmalView({Key? key}) : super(key: key);

  @override
  State<NonrmalView> createState() => _NonrmalViewState();
}

class _NonrmalViewState extends State<NonrmalView> {
  bool _expend = false;
  double _size = 100;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance?.addPostFrameCallback((_) {
      w = Window.of(context);
      w?.on(EventType.WindowDragStart, (window, data) {
        if (mounted) setState(() => {dragging = true});
      }).on(EventType.WindowDragEnd, (window, data) {
        if (mounted) setState(() => {dragging = false});
      });
    });
  }

  Window? w;
  bool dragging = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: _size,
        height: _size,
        child: Card(
            child: Stack(
          children: [
            Positioned(
                right: 5, top: 5, child: Icon(Icons.drag_handle_rounded)),
            Positioned(
                right: 5,
                bottom: 5,
                child: RotationTransition(
                    turns: AlwaysStoppedAnimation(-45 / 360),
                    child: Icon(Icons.unfold_more_rounded)))
          ],
        )),
      ),
    );
  }
}
