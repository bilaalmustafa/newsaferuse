import '../constants/const_img.dart';
import 'dummy_model.dart';

class DummyData {


  List<DummyModel> dummyDataList = [
    DummyModel(
      image: ConstImg.homeTabGridView,
      title: 'Drug use checklist',
      text: "Stay informed and safe, empower your wellness journey",
    ),


    DummyModel(
      image: ConstImg.homeTabGridViewTwo,
      title: 'Good samaritan law ',
      text: "Know your rights. Understand how these laws protect you",
    ),

    DummyModel(
      image: ConstImg.homeTabGridViewThree,
      title: 'Never use alone',
      text: "Stay safe together. Connect with others to avoid using drugs alone",
    ),

  ];


}