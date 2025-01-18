import 'package:clinics_app/features/user/domain/entities/quotes_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/constants/const_padding.dart';
import '../../../../core/utils/injections.dart';
import '../manager/admin_controller.dart';
import 'delete_dialog.dart';

class AdminAllQuotesContainer extends StatelessWidget {
  final QuotesModel model;
  const AdminAllQuotesContainer({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: ConstPadding.resNinetyWidth(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(01.h),
              color: const Color(0xff1F2636),
            ),
            child:  Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width:ConstPadding.resCustomWidth(context, 3),
                    height: 15.h,
                    child: Image.network(model.imgUrl!,fit: BoxFit.cover,),
                  ),
                ),

                // SizedBox(height: 2.w,),

                Expanded(
                  flex: 5,
                  child: SizedBox(
                    // color: Colors.red,
                    width:ConstPadding.resCustomWidth(context, 1.4),
                    height: 15.h,
                    child:Column(
                      children: [
                        SizedBox(height: 2.h,),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text( model.quote!.length > 50 ?
                          model.quote!.substring(0,50) : model.quote!,style: TextStyle(
                              color: Colors.white70,
                              fontSize: 2.h
                          ),),
                        ),
                        SizedBox(height: 1.h,),

                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(model.author!,style: TextStyle(
                              color: Colors.white70,
                              fontSize: 2.h
                          ),),
                        ),




                      ],
                    ),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: SizedBox(
                    // width: 07.w,
                    height: 15.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(onPressed: (){
                          // adminController.oldData(model);
                          // Get.to(UpdateClinicDetails(model: model));
                        }, icon: const Icon(Icons.edit,color: Colors.white,)),



                        IconButton(onPressed: (){


                          showDialog(context: context, builder: (context){
                            return DeleteDialog(onYes: (){
                              sl<AdminController>().deleteQuoteController(context, model);
                              Navigator.of(context).pop();
                            }, description: 'Do you want to delete the quote');
                          });
                        }, icon: const Icon(Icons.delete,color: Colors.red)),
                      ],
                    ),
                  ),
                ),


              ],
            )
        ),

        SizedBox(height: 1.h,),
      ],
    );
  }
}



