class QuotesModel {
  String? id;
  String? quote;
  String? author;
  String? authorDetails;
  String? imgUrl;
  int? date;


  QuotesModel({
    this.id,
    this.quote,
    this.author,
    this.authorDetails,
    this.imgUrl,
    this.date,

  });


  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['id'] = id;
    map['quote'] = quote;
    map['author'] = author;
    map['authorDetails'] = authorDetails;
    map['imgUrl'] = imgUrl;
    map['date'] =date ;

    return map;
  }

  QuotesModel.fromMap(Map<String, dynamic> map){
    id = map['id'];
    quote = map['quote'];
    author = map['author'];
    authorDetails = map['authorDetails'];
    imgUrl = map['imgUrl'];
    date = map['date'];
  }

  QuotesModel? copyWith({
    String? id,
    String? quote,
    String? author,
    String? authorDetails,
    String? imgUrl,
    int? date,
  }) =>
      QuotesModel(
        id: id??this.id,
        quote: quote ?? this.quote,
        author: author ?? this.author,
        authorDetails: authorDetails ?? this.authorDetails,
        imgUrl: imgUrl?? this.imgUrl,
        date: date?? this.date,
      );
}
