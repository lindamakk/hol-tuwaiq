part of '../supabase.dart';

extension LoadData on SupabaseIntegration {
  Future<List<QuestionModel>> loadAllQ() async {
    final dataResult = await SupabaseIntegration.supabase
        .from('question')
        .select("*,topics(*)");

    final listData = dataResult.map((e) => QuestionModel.fromJson(e)).toList();
    return listData;
  }

  sendQuestions({
    required String name,
    required String tobic,
    required int scopeID,
  }) async {
    final dataResult = await SupabaseIntegration.supabase
        .from('question')
        .insert({"name_student": name, "question": tobic, "topic_id": scopeID});
    print(dataResult);
  }

  Future<List<Topics>> loadAllScopes() async {
    final dataResult = await SupabaseIntegration.supabase
        .from('topics')
        .select("*");

    final listData = dataResult.map((e) => Topics.fromJson(e)).toList();
    return listData;
  }
}
