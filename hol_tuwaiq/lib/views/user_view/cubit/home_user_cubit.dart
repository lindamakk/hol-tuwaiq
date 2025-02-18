import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hol_tuwaiq/model/topics_model.dart';
import 'package:hol_tuwaiq/services/supabase/supabase.dart';
import 'package:meta/meta.dart';

part 'home_user_state.dart';

class HomeUserCubit extends Cubit<HomeUserState> {
  HomeUserCubit() : super(HomeUserInitial());
  List<Topics>? topicsObjects;
  List<String> topics = [];

  Topics? selectedTopic;

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerTopic = TextEditingController();

  startLoad() async {
    try {
      emit(LoadingScopesState());
      topicsObjects = await SupabaseIntegration().loadAllScopes();
      selectedTopic = topicsObjects!.first; //deafult value
      for (int i = 0; i < topicsObjects!.length; i++) {
        topics.add(topicsObjects![i].nameEn);
      }
      emit(LoadSuccessDataState());
    } catch (error) {
      emit(ErrorState());
    }
  }

  sendQuestion() async {
    try {
      emit(LoadingState());

      await SupabaseIntegration().sendQuestions(
        name: controllerName.text,
        tobic: controllerTopic.text,
        scopeID: selectedTopic!.id,
      );
      print('object');

      emit(SuceessSendState());
    } catch (error) {
      emit(ErrorState());
    }
  }
}
