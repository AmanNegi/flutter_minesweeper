import 'package:flutter/material.dart';
import 'package:flutter_minecraft/colors.dart';

class LostDialog extends StatefulWidget {
  const LostDialog({
    super.key,
  });

  @override
  State<LostDialog> createState() => _LostDialogState();
}

class _LostDialogState extends State<LostDialog> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 0.025 * MediaQuery.of(context).size.width,
          vertical: 0.025 * MediaQuery.of(context).size.height,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 0.01 * MediaQuery.of(context).size.height),
            const Text(
              "You Lost!",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Text(
              "All that for nothing huh?",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 0.05 * height),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _getButton("Retry", () {
                  Navigator.pop(context, false);
                }),
                const SizedBox(width: 20),
                _getButton("Reset", () {
                  Navigator.pop(context, true);
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _getButton(String text, Function onPressed) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 0.025 * MediaQuery.of(context).size.width,
          vertical: 0.01 * MediaQuery.of(context).size.height,
        ),
        decoration: BoxDecoration(
          color: greenColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 17, color: Colors.white),
        ),
      ),
    );
  }
}
