import 'package:hoonyDev/common/common.dart';
import 'package:hoonyDev/screen/main/tab/favorite/f_favorite.dart';
import 'package:hoonyDev/screen/main/tab/home/f_home.dart';
import 'package:flutter/material.dart';

enum TabItem {
  home(Icons.home, '홈', HomeFragment()),
  localLife(Icons.holiday_village_outlined, '동네생활', FavoriteFragment(isShowBackButton: false)),
  nearMe(Icons.pin_drop_outlined, '내 근처', FavoriteFragment(isShowBackButton: false)),
  chat(Icons.chat_bubble_outline, '채팅', FavoriteFragment(isShowBackButton: false)),
  my(Icons.person_outline_rounded, '나의 당근', FavoriteFragment(isShowBackButton: false));

  final IconData activeIcon;
  final IconData inActiveIcon;
  final String tabName;
  final Widget firstPage;

  const TabItem(this.activeIcon, this.tabName, this.firstPage, {IconData? inActiveIcon})
      : inActiveIcon = inActiveIcon ?? activeIcon;

  BottomNavigationBarItem toNavigationBarItem(BuildContext context, {required bool isActivated}) {
    return BottomNavigationBarItem(
        icon: Icon(
          key: ValueKey(tabName),
          isActivated ? activeIcon : inActiveIcon,
          color:
              isActivated ? context.appColors.iconButton : context.appColors.iconButtonInactivate,
        ),
        label: tabName);
  }
}
