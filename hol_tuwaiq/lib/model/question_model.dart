import 'package:hol_tuwaiq/model/topics_model.dart';

class QuestionModel {
  QuestionModel({
    required this.id,
    required this.nameStudent,
    required this.question,
    required this.topicId,
    required this.dateAdd,
    required this.createdAt,
    required this.done,
    required this.topics,
  });
  late final int id;
  late final String nameStudent;
  late final String question;
  late final int topicId;
  late final String dateAdd;
  late final String createdAt;
  late final bool done;
  late final Topics topics;

  QuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameStudent = json['name_student'];
    question = json['question'];
    topicId = json['topic_id'];
    dateAdd = json['date_add'];
    createdAt = json['created_at'];
    done = json['done'];
    topics = Topics.fromJson(json['topics']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name_student'] = nameStudent;
    data['question'] = question;
    data['topic_id'] = topicId;
    data['date_add'] = dateAdd;
    data['created_at'] = createdAt;
    data['done'] = done;
    data['topics'] = topics.toJson();
    return data;
  }
}
