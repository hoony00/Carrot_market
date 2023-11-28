import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../fab/w_floating_daangn_button.riverpod.dart';

class LocalLifeFragment extends ConsumerStatefulWidget {
  const LocalLifeFragment({super.key});

  @override
  ConsumerState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends ConsumerState<LocalLifeFragment> {
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      final floatingState = ref.read(floatingButtonStateProvider);

      if(scrollController.position.pixels > 100 && !floatingState.isSmall) {
        ref.read(floatingButtonStateProvider.notifier).changeButtonSize(true);
      } else if(scrollController.position.pixels < 100 && floatingState.isSmall) {
        ref.read(floatingButtonStateProvider.notifier).changeButtonSize(false);
      }

    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        Container(
          height: 100,
          color: Colors.red,
        ),
        Container(
          height: 100,
          color: Colors.green,
        ),
        Container(
          height: 100,
          color: Colors.red,
        ), Container(
          height: 100,
          color: Colors.blue,
        ), Container(
          height: 100,
          color: Colors.red,
        ),
        Container(
          height: 100,
          color: Colors.blue,
        ), Container(
          height: 100,
          color: Colors.red,
        ),
        Container(
          height: 100,
          color: Colors.blue,
        ), Container(
          height: 100,
          color: Colors.red,
        ),


      ],

    );
  }
}
