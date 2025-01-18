import 'package:clinics_app/core/constants/const_icons.dart';
import 'package:clinics_app/core/controllers/home_controllers.dart';
import 'package:clinics_app/features/user/presentation/manager/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../core/utils/injections.dart';
import '../../widgets/user_home_screen_menu_button.dart';
import '../donation_details_screen.dart';
import '../tabs/clinic_tab/about_us_tab.dart';
import '../tabs/clinic_tab/clinic_tab.dart';
import '../tabs/clinic_tab/home_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = sl<HomeController>();
  final userController = sl<UserController>();

  @override
  void initState() {
    // TODO: implement initState
    controller.locationPermission(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>

      PopScope(
      canPop: controller.userHomeTabIndex.value==0,
      onPopInvoked: (val){
        if(controller.userHomeTabIndex.value!=0){
          controller.setUserHomeTabIndex(0);
        }
      },
        child: Obx(() => userController.isAllFunctionLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                bottomNavigationBar: BottomAppBar(
                  height: 9.h,
                  shadowColor: Colors.black,
                  surfaceTintColor: Colors.black,
                  child: Padding(
                    padding: EdgeInsets.only(left: 6.w, right: 6.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        UserHomeScreenMenuButton(
                          userHomeIndex: 0,
                          iconImageLink: controller.userHomeTabIndex.value == 0
                              ? ConstIcon.homeActiveSvg
                              : ConstIcon.homeNonActiveSvg,
                          text: 'Home',
                          color: controller.userHomeTabIndex.value == 0
                              ? Colors.black
                              : Colors.grey,
                        ),
                        UserHomeScreenMenuButton(
                          userHomeIndex: 1,
                          iconImageLink: controller.userHomeTabIndex.value == 1
                              ? ConstIcon.clinicActiveSvg
                              : ConstIcon.clinicNonActiveSvg,
                          text: 'Clinic',
                          color: controller.userHomeTabIndex.value == 1
                              ? Colors.black
                              : Colors.grey,
                        ),
                        UserHomeScreenMenuButton(
                          userHomeIndex: 2,
                          iconImageLink: controller.userHomeTabIndex.value == 2
                              ? ConstIcon.donationActiveSvg
                              : ConstIcon.donationNonActiveSvg,
                          text: 'Donation',
                          color: controller.userHomeTabIndex.value == 2
                              ? Colors.black
                              : Colors.grey,
                        ),
                        UserHomeScreenMenuButton(
                          userHomeIndex: 3,
                          iconImageLink: controller.userHomeTabIndex.value == 3
                              ? ConstIcon.aboutUsActive
                              : ConstIcon.aboutUsNonActive,
                          text: 'About Us',
                          color: controller.userHomeTabIndex.value == 3
                              ? Colors.black
                              : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                body: controller.userHomeTabIndex.value == 0
                    ? HomeTab()
                    : controller.userHomeTabIndex.value == 1
                        ? ClinicTab()
                        : controller.userHomeTabIndex.value == 2
                            ? DonationDetailsScreen()
                            : const AboutUsTab()))));
  }
}
