import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial(currectPage: 0));

  void changePage({required int index}){
    emit(BottomNavBarInitial(currectPage: index));
  }
}
