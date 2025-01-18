import 'package:clinics_app/core/constants/const_colors.dart';
import 'package:clinics_app/features/admin/presentation/screen/add_new_quote.dart';
import 'package:clinics_app/features/admin/presentation/widgets/admin_all_quotes_container.dart';
import 'package:clinics_app/features/user/domain/entities/quotes_model.dart';
import 'package:clinics_app/features/user/presentation/manager/user_controller.dart';
import 'package:clinics_app/features/user/presentation/widgets/clinic_tab_widgets/clinic_tab_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../core/constants/const_padding.dart';
import '../../../../../core/utils/injections.dart';


class AdminAllQuotes extends StatelessWidget {

  // final QuotesModel model;
   AdminAllQuotes({super.key,});

  final userController = sl<UserController>();
  @override
  Widget build(BuildContext context) {
    return Obx(()=>   userController.isAllFunctionLoading.value ?
        const Center(
          child: CircularProgressIndicator(),
        )
    :
        Container(
          padding: ConstPadding.resPadding(context),
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: ConstColor.blueConstColor,
              onPressed: () {
                Get.to(AddNewQuote());
              },
              child:  Icon(Icons.add,color: Colors.white,size: 4.h,),
            ),
                body: SafeArea(
          child: Container(
            height: 100.h,
            width: 100.w,
            color: Colors.white,
            child:  Column(
              children: [
                SizedBox(height: 2.h,),
                 ClinicTabHeader(text: 'All Quotes',onPressed: ()=> Get.back(),),

                SizedBox(height: 2.h,),

                SizedBox(
                  height: 86.h,
                  width: 100.w,
                  child: ListView.builder(
                      itemCount: userController.getAllQuotes.length,
                      itemBuilder: (context,index){
                        QuotesModel mdl =  userController.getAllQuotes[index];
                        return
                          userController.getAllQuotes.isEmpty ?
                          const Text('Node Data')
                              :
                          AdminAllQuotesContainer(model: mdl);
                      }),

                )


              ],
            ),
          ),
                ),
              ),
        ));
  }
}
