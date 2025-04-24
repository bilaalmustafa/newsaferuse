class Query {
  final String? question;
  final List<String>? options;
  final int? createdAt;
  final String? id;
  int groupValue = -1;

  Query({
    this.question,
    this.options,
    this.createdAt,
    this.id,
  });

  Query copyWith({
    String? question,
    List<String>? options,
    int? createdAt,
    String? id,
  }) =>
      Query(
        question: question ?? this.question,
        options: options ?? this.options,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
      );

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        question: json["question"],
        options: json["options"] == null ? [] : List<String>.from(json["options"]!.map((x) => x)),
        createdAt: json["created_at"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
        "created_at": createdAt,
        "id": id,
      };
}
