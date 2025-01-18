import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:clinics_app/core/controllers/home_controllers.dart';
import 'package:clinics_app/features/admin/presentation/screen/tabs/admin_home_tab.dart';
import 'package:clinics_app/features/admin/presentation/screen/tabs/admin_profile_tab.dart';
import 'package:clinics_app/features/auth/presentatation/manager/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../core/constants/const_colors.dart';
import '../../../../core/constants/const_padding.dart';
import '../../../../core/utils/injections.dart';




class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});




  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> with TickerProviderStateMixin {
  final autoSizeGroup = AutoSizeGroup();
  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  final iconList = <IconData>[
    Icons.home,
    Icons.person,
  ];

  final controller = sl<HomeController>();
  final authController = sl<AuthController>();

  @override
  void initState() {
    super.initState();

    controller.locationPermission(context);
    authController.getCurrentUser();

    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      const Duration(seconds: 1),
          () => _fabAnimationController.forward(),
    );
    Future.delayed(
      const Duration(seconds: 1),
          () => _borderRadiusAnimationController.forward(),
    );
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification &&
        notification.metrics.axis == Axis.vertical) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          _hideBottomBarAnimationController.reverse();
          _fabAnimationController.forward(from: 0);
          break;
        case ScrollDirection.reverse:
          _hideBottomBarAnimationController.forward();
          _fabAnimationController.reverse(from: 1);
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {

    return Obx(() => Scaffold(
      body: controller.adminHomeTabIndex.value == 0
          ?   AdminHomeTab()
          :  AdminProfileTab(),
      bottomNavigationBar: Padding(
        padding: ConstPadding.resPadding(context),
        child: AnimatedBottomNavigationBar.builder(
          height: 8.h,
          itemCount: iconList.length,
          tabBuilder: (int index , bool isActive) {
            final color = isActive ? ConstColor.activeNavigationBarColor : ConstColor.notActiveNavigationBarColor;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconList[index],
                  size: 3.h,
                  color: color,
                ),
                SizedBox(height: .3.h),
                AutoSizeText(
                  index == 0 ? "Home" :
                  'Profile',
                  maxLines: 1,
                  style: TextStyle(color: color),
                  group: autoSizeGroup,
                )
              ],
            );
          },
          backgroundColor: ConstColor.bottomNavigationBarBackgroundColor,
          activeIndex: controller.adminHomeTabIndex.value,
          splashColor: ConstColor.activeNavigationBarColor,
          notchAndCornersAnimation: borderRadiusAnimation,
          splashSpeedInMilliseconds: 300,
          notchSmoothness: NotchSmoothness.defaultEdge,
          gapLocation: GapLocation.none,
          // leftCornerRadius: 5.w,
          // rightCornerRadius: 5.w,
          onTap: (index) => controller.setAdminHomeTabIndex(index),
          hideAnimationController: _hideBottomBarAnimationController,
          shadow: BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 12,
            spreadRadius: 0.5,
            color: ConstColor.activeNavigationBarColor,
          ),
        ),
      ),
    ));

  }
}


class NavigationScreen extends StatefulWidget {
  final IconData iconData;

  const NavigationScreen(this.iconData, {super.key});

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void didUpdateWidget(NavigationScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.iconData != widget.iconData) {
      _startAnimation();
    }
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
    super.initState();
  }

  _startAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ConstPadding.resPadding(context),
      color: Theme.of(context).colorScheme.background,
      child: ListView(
        children: [
          const SizedBox(height: 64),
          Center(
            child: CircularRevealAnimation(
              animation: animation,
              centerOffset: const Offset(80, 80),
              maxRadius: MediaQuery.of(context).size.longestSide * 1.1,
              child: Icon(
                widget.iconData,
                color: ConstColor.activeNavigationBarColor,
                size: 160,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


