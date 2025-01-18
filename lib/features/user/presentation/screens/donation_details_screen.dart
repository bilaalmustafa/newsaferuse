
import 'package:clinics_app/core/constants/const_img.dart';
import 'package:clinics_app/core/constants/const_strings.dart';
import 'package:clinics_app/features/user/domain/entities/donation_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/controllers/home_controllers.dart';
import '../../../../core/utils/injections.dart';
import '../manager/user_controller.dart';
import '../widgets/about_us_tab_widgets/about_us_tab_second_container.dart';
import '../widgets/clinic_tab_widgets/clinic_tab_header.dart';
import '../widgets/custom_blue_button.dart';
import '../widgets/details_screen_widgets/details_screen_donation_raised_line.dart';
import '../widgets/details_screen_widgets/details_screen_modal_bottom_sheet.dart';



class DonationDetailsScreen extends StatelessWidget {


   DonationDetailsScreen({super.key});

  final controller = sl<UserController>();

  @override
  Widget build(BuildContext context) {
    final DonationModel model =  controller.singleDonation!;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 100.h,
          width: 100.w,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              ClinicTabHeader(text: 'Donation Details',onPressed: ()=> sl<HomeController>().setUserHomeTabIndex(0)),
              SizedBox(
                height: 3.h,
              ),

              Container(
                  height: 20.h,
                width: 90.w,
                child:
                    model.donationImg!.isEmpty ?
                 Center(child: Text('No Image for this donation'))
                        :
                Image.network(
                    fit: BoxFit.cover,
                    model.donationImg!),
              ),
              SizedBox(
                height: 2.h,
              ),

              AboutUsTabSecondContainer(title: model.title!, text: model.description!),
              // AboutUsTabSecondContainer(title: 'Help us in saving your loved one’s ', text: ConstString.detailsScreen),


              SizedBox(height: 6.5.h,),

              const DetailsScreenDonationRaisedLine(),

              SizedBox(height: 18.h,),


              CustomBlueButton(text: 'Donate now', onPressed: (){
                sl<HomeController>().setDonationAmountToController(sl<HomeController>().selectDonationAmountToController.value);
                showModalBottomSheet(context: (context), builder: (context){
                return  DetailsScreenModelBottomSheet();
                });
              })

            ],
          ),
        ),
      ),
    );
  }
}
