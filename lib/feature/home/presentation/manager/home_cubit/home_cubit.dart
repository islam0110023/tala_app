import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/home/domain/entities/user_entity.dart';
import 'package:tala_app/feature/home/domain/use_case/get_user_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.getUserUseCase) : super(HomeInitial()) {
    getUser();
  }
  final GetUserUseCase getUserUseCase;
  UserEntity? user;
  void getUser() async {
    emit(HomeLoading());
    final result = await getUserUseCase();
    result.fold((failure) => emit(HomeFailure()), (user) {
      this.user = user;
      emit(HomeSuccess());
    });
  }
}
