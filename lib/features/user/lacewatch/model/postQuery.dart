class PostQuery {
  final String? question;
  final String? id;
  final String? answer;

  PostQuery({this.question, this.id, this.answer});

  PostQuery copyWith({
    String? question,
    String? answer,
    String? id,
  }) =>
      PostQuery(
        question: question ?? this.question,
        answer: answer ?? this.answer,
        id: id ?? this.id,
      );

  factory PostQuery.fromJson(Map<String, dynamic> json) => PostQuery(
        question: json["question"],
        answer: json["answer"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answer": answer,
        "id": id,
      };
}
