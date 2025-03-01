import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:talent_space_test/core/theming/app_colors.dart';
import 'package:talent_space_test/features/home/presentation/screens/home_screen.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({super.key, this.targetIndex = 0});
  final int targetIndex;

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView> {
  final PersistentTabController _bottomNavController =
      PersistentTabController(initialIndex: 2);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _bottomNavController,
      screens: _buildScreens(),
      items: _buildNavBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      backgroundColor: AppColors.backgroundNavBarColor,
      hideNavigationBarWhenKeyboardAppears: true,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeIn,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
        ),
      ),
      confineToSafeArea: true,
      navBarStyle: NavBarStyle.simple,
      navBarHeight: 75.h,
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _buildNavBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings, color: AppColors.praimryOrangeColor),
        inactiveIcon:
            Icon(Icons.settings_outlined, color: AppColors.backgroundColor),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.add, color: AppColors.praimryOrangeColor),
        inactiveIcon: Icon(Icons.add, color: AppColors.backgroundColor),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home, color: AppColors.praimryOrangeColor),
        inactiveIcon:
            Icon(Icons.home_outlined, color: AppColors.backgroundColor),
      ),
    ];
  }
}
