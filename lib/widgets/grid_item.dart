import 'package:flutter/material.dart';
import 'package:flutter_minecraft/colors.dart';
import 'package:flutter_minecraft/constraints.dart';

class GridItem extends StatefulWidget {
  final int val;
  final bool selected;
  final Function onZeroFound;
  final Function toggleSelected;
  const GridItem({
    super.key,
    required this.val,
    required this.onZeroFound,
    required this.selected,
    required this.toggleSelected,
  });

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool hovering = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) {
        hovering = true;
        setState(() {});
      },
      onExit: (e) {
        hovering = false;
        setState(() {});
      },
      child: GestureDetector(
        onTap: () {
          widget.toggleSelected();

          if (widget.val == 0) {
            widget.onZeroFound();
          } else {
            setState(() {});
          }
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          decoration: BoxDecoration(
            border: gameConstraints.isMobile()
                ? Border.all(color: Colors.grey.withOpacity(0.5))
                : null,
            color: widget.selected
                ? widget.val == 1
                    ? greenColor
                    : redColor
                : hovering
                    ? greenColor
                    : Colors.transparent,
          ),
          child: Center(
            child: Text(
              widget.selected
                  ? widget.val.toString()
                  : hovering
                      ? "😎"
                      : "",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
