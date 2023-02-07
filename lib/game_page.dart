import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_minecraft/constraints.dart';
import 'package:flutter_minecraft/widgets/grid_item.dart';
import 'package:flutter_minecraft/widgets/lost_dialog.dart';
import 'package:flutter_minecraft/widgets/won_dialog.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double amount = 0;
  late List<int> ans;
  late List<int> selected;
  int totalAns = 0;
  int currentAns = 0;

  _generateRandomNumberList() {
    totalAns = 0;
    currentAns = 0;
    ans = List.filled(gameConstraints.getLen(), 0);
    selected = List.filled(gameConstraints.getLen(), 0);

    for (int i = 0; i < gameConstraints.getLen(); i++) {
      int random = Random().nextInt(100) % 2;
      if (random == 1) totalAns++;
      ans[i] = random;
    }
  }

  @override
  void didChangeDependencies() {
    gameConstraints.setContext(context);
    _generateRandomNumberList();
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _generateRandomNumberList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gameConstraints.getRows(),
          childAspectRatio: (width / gameConstraints.getRows()) /
              (height / gameConstraints.getCols()),
        ),
        itemCount: gameConstraints.getLen(),
        itemBuilder: (context, index) {
          return GridItem(
            val: ans[index],
            onZeroFound: () async {
              selected = List.filled(gameConstraints.getLen(), 1);
              setState(() {});
              await Future.delayed(const Duration(seconds: 2));

              currentAns = 0;
              // ignore: use_build_context_synchronously
              var value = await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return const LostDialog();
                  });

              if (value) {
                _generateRandomNumberList();
              } else {
                selected = List.filled(gameConstraints.getLen(), 0);
              }
              setState(() {});
            },
            selected: selected[index] == 1,
            toggleSelected: () async {
              selected[index] = 1;
              currentAns++;

              debugPrint("CurrentAns: $currentAns TotalAns: $totalAns ");

              // If currentAns equals totalAns, all 1's are selected
              if (currentAns == totalAns) {
                selected = List.filled(gameConstraints.getLen(), 1);
                setState(() {});
                await Future.delayed(const Duration(seconds: 2));

                // ignore: use_build_context_synchronously
                await showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return const WonDialog();
                    });

                _generateRandomNumberList();
              }

              setState(() {});
            },
          );
        },
      ),
    );
  }
}
