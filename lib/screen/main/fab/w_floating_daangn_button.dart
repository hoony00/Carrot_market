import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoonyDev/common/common.dart';
import 'package:hoonyDev/common/dart/extension/num_duration_extension.dart';
import 'package:hoonyDev/common/widget/animated_width_collapse.dart';
import 'package:hoonyDev/screen/main/fab/w_floating_daangn_button.riverpod.dart';
import 'package:hoonyDev/screen/main/s_main.dart';

class FloatingDaangnButton extends ConsumerWidget {
  FloatingDaangnButton({super.key}); // 컨스트 포기하고 ms 사용

  final duration = 300.ms;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = ref.watch(floatingButtonIsExpandedProvider);
    final isSmall = ref.watch(floatingButtonIsSmallProvider);
    return Stack(
      children: [
        AnimatedContainer(
          duration: duration,
          color:
          isExpanded ? Colors.black.withOpacity(0.4) : Colors.transparent,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimatedOpacity(
                opacity: isExpanded ? 1 : 0,
                duration: duration,
                child: Container(
                  width: 160,
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(bottom: 10, right: 15),
                  decoration: BoxDecoration(
                    color: context.appColors.floatingActionLayer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _floatItem('알바', 'assets/image/fab/fab_01.png'),
                      _floatItem('과외/클래스', 'assets/image/fab/fab_02.png'),
                      _floatItem('농수신믈', 'assets/image/fab/fab_03.png'),
                      _floatItem('부동산', 'assets/image/fab/fab_04.png'),
                      _floatItem('중고차', 'assets/image/fab/fab_05.png'),
                    ],
                  ),
                ),
              ),
              Tap(
                onTap: () {
                  ref.read(floatingButtonIsExpandedProvider.notifier).state = !isExpanded;
                },
                child: AnimatedContainer(
                  duration: duration,
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                    color:
                    isExpanded
                        ? context.appColors.floatingActionLayer
                        : const Color(0xffff791f),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedRotation(turns: isExpanded ? 0.125 : 0, duration: duration, child: const Icon(Icons.add)),
                      AnimatedWidthCollapse(
                          visible: !isSmall,
                          duration: duration,
                          child: '글쓰기'.text.make()),
                    ],
                  ),
                ).pOnly(bottom: MainScreenState.bottomNavigationBarHeight +
                    context.viewPaddingBottom, right: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _floatItem(String title, String imagePath) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(imagePath, width: 30),
        const Width(8),
        title.text.make(),
      ],
    );
  }
}
