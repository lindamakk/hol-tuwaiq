class Topics {
  Topics({required this.id, required this.nameAr, required this.nameEn});
  late final int id;
  late final String nameAr;
  late final String nameEn;

  Topics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final QuestionModel = <String, dynamic>{};
    QuestionModel['id'] = id;
    QuestionModel['name_ar'] = nameAr;
    QuestionModel['name_en'] = nameEn;
    return QuestionModel;
  }
}
