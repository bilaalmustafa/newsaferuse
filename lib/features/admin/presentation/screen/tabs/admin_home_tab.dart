import 'package:clinics_app/features/admin/presentation/screen/tabs/admin_all_clinics.dart';
import 'package:clinics_app/features/admin/presentation/screen/tabs/admin_all_donation.dart';
import 'package:clinics_app/features/auth/presentatation/widgets/auth_header.dart';
import 'package:clinics_app/features/user/presentation/manager/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../core/constants/const_img.dart';
import '../../../../../core/constants/const_padding.dart';
import '../../../../../core/utils/injections.dart';
import '../../../../user/presentation/widgets/home_tab_widgets/home_ta_denotion_container.dart';
import '../../../../user/presentation/widgets/home_tab_widgets/home_tab_custom_clip_rreact.dart';
import '../../../../user/presentation/widgets/home_tab_widgets/home_tab_title_text.dart';
import '../../widgets/admin_home_tab_quote_container.dart';

class AdminHomeTab extends StatelessWidget {
   AdminHomeTab({super.key});

  final controller = sl<UserController>();

  @override
  Widget build(BuildContext context) {

    return Obx(()=>

    controller.isAllFunctionLoading.value ?

        const Center(child: CircularProgressIndicator())
    :
        Container(
          padding: ConstPadding.resPadding(context),
          child: Scaffold(
              body: SafeArea(
                child:
                Container(
                  height: 100.h,
                  width: 100.w,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        const AuthHeader(text: 'Admin Home Tab'),


                        SizedBox(height: 1.h,),

                        HomeTabCustomClipReact(img: ConstImg.homeTabFromContainer, onPressed: () => Get.to(AdminAllClinics()),),

                        SizedBox(height: 1.h,),


                        const HomeTabTitleText(text: 'Quotes'),


                        SizedBox(height: 1.h,),

                        AdminHomeTabQuoteContainer(quotesModel: controller.singleQuote!,),


                        SizedBox(height: 2.h,),

                        HomeTabCustomClipReact(img: ConstImg.homeTabSponsor, onPressed: () {},),


                        SizedBox(height: 2.h,),


                        const HomeTabTitleText(text: 'Donation'),



                        SizedBox(height: 1.h,),



                         HomeTabDonationContainer(onPressed: ()=> Get.to( AdminAllDonation()),model: controller.singleDonation!,),

                        SizedBox(height: 2.h,),



                      ],
                    ),
                  ),
                ),
              )),
        )
    );

  }
}
