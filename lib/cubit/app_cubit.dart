import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_guid/cubit/state.dart';
import 'package:metro_guid/local/cash_helper.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit() : super(AppState());
  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  void changeAppMode({bool? fromShared}){
    if(fromShared != null)
    {
      isDark = fromShared;
      emit(AppChangeModeState());
    }
    else{
    isDark = !isDark;
    CashHelper.putData(key: 'isDark', value: isDark).then((value)
    {
      emit(AppChangeModeState());
    });
    }


  }
}


