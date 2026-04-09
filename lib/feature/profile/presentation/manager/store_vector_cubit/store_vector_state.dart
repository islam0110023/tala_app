part of 'store_vector_cubit.dart';

@immutable
sealed class StoreVectorState {}

final class StoreVectorInitial extends StoreVectorState {}

final class StoreVectorLoading extends StoreVectorState {}

final class StoreVectorSuccess extends StoreVectorState {}

final class StoreVectorFailure extends StoreVectorState {
  StoreVectorFailure(this.errMessage);

  final String errMessage;
}
