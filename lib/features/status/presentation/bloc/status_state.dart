import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/status_entity.dart';

part 'status_state.freezed.dart';

@freezed
class StatusState with _$StatusState {
  const factory StatusState.initial() = StatusInitial;
  const factory StatusState.loading() = StatusLoading;
  const factory StatusState.loaded({
    required List<StatusEntity> images,
    required List<StatusEntity> videos,
  }) = StatusLoaded;
  const factory StatusState.error(String message) = StatusError;
  const factory StatusState.saved(String message) = StatusSaved;
}
