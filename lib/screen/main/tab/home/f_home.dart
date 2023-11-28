import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../fab/w_floating_daangn_button.riverpod.dart';

class HomeFragment extends ConsumerStatefulWidget {
  const HomeFragment({super.key});

  @override
  ConsumerState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends ConsumerState<HomeFragment> {
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      final isSmall = ref.read(floatingButtonIsSmallProvider);

      if(scrollController.position.pixels > 100 && !isSmall) {
        ref.read(floatingButtonIsSmallProvider.notifier).state = true;
      } else if(scrollController.position.pixels < 100 && isSmall) {
        ref.read(floatingButtonIsSmallProvider.notifier).state = false;
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
          color: Colors.blue,
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
