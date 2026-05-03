import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/home/data/model/event_model/event_model.dart';
import 'package:tala_app/feature/home/domain/repo/home_repo.dart';

class GetEventsUseCase {
  GetEventsUseCase(this.homeRepo);
  final HomeRepo homeRepo;
  Future<Either<Failure, List<EventModel>>> call() async {
    return await homeRepo.getEvents();
  }
}
