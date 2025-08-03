import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/dating/domain/entity/match_user_entity.dart';
import 'package:tala_app/feature/dating/domain/params/match_user_params.dart';
import 'package:tala_app/feature/dating/domain/usa_case/get_match_user_use_case.dart';

part 'get_matches_user_state.dart';

class GetMatchesUserCubit extends Cubit<GetMatchesUserState> {
  GetMatchesUserCubit(this.getMatchUserUseCase)
    : super(GetMatchesUserInitial());
  final GetMatchUserUseCase getMatchUserUseCase;
  Future<void> getMatchesUser(MatchUserParams params) async {
    emit(GetMatchesUserLoaded());
    final result = await getMatchUserUseCase.call(params);
    result.fold(
      (failure) => emit(GetMatchesUserFailure(failure.errMessage)),
      (matches) => emit(GetMatchesUserSuccess(matches)),
    );
  }
}
