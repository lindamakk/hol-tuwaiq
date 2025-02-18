import 'package:bloc/bloc.dart';
import 'package:hol_tuwaiq/model/question_model.dart';
import 'package:hol_tuwaiq/services/supabase/supabase.dart';
import 'package:meta/meta.dart';

part 'home_admin_state.dart';

class HomeAdminCubit extends Cubit<HomeAdminState> {
  HomeAdminCubit() : super(HomeAdminInitial());
  List<QuestionModel> dataQ = [];
  startLoad() async {
    try {
      emit(LoadingState());
      dataQ = await SupabaseIntegration().loadAllQ();
      emit(LoadSuccessDataState());
    } catch (error) {
      emit(ErrorState());
    }
  }
}
