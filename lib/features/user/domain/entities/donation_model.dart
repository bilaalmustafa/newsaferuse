


class DonationModel {
  String? id;
  String? title;
  String? description;
  String? donationImg;
  int? date;

  DonationModel({
    this.id,
    this.title,
    this.description,
    this.donationImg,
    this.date,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['donationImg'] = donationImg;
    map['date'] = date;

    return map;
  }

  DonationModel.fromMap(Map<String,dynamic> map){
    id = map['id'];
    title = map['title'];
    description = map['description'];
    donationImg = map['donationImg'];
    date = map['date'];
  }


  DonationModel copyWith({
    String? id,
    String? title,
    String? description,
    String? donationImg,
    int? date,
}) =>
DonationModel(
  id: id??this.id,
  title: id??this.title,
  description: description??this.description,
  donationImg: donationImg??this.donationImg,
  date: date??this.date,
);



}
