import 'package:bloc/bloc.dart';
import 'package:hol_tuwaiq/services/supabase/supabase.dart';
import 'package:meta/meta.dart';

part 'home_admin_state.dart';

class HomeAdminCubit extends Cubit<HomeAdminState> {
  HomeAdminCubit() : super(HomeAdminInitial());

  startLoad() async {
    try {
      emit(LoadingState());
      await SupabaseIntegration().loadAllQ();
    } catch (error) {
      emit(ErrorState());
    }
  }
}
