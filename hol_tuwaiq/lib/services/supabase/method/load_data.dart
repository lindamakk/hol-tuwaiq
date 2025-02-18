part of '../supabase.dart';

extension LoadData on SupabaseIntegration {
  Future<List<QuestionModel>> loadAllQ() async {
    final dataResult = await SupabaseIntegration.supabase
        .from('question')
        .select("*,topics(*)");

    final listData = dataResult.map((e) => QuestionModel.fromJson(e)).toList();
    return listData;
  }
}
