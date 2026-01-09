import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/status_entity.dart';

part 'status_event.freezed.dart';

@freezed
class StatusEvent with _$StatusEvent {
  const factory StatusEvent.getStatuses() = GetStatusesEvent;
  const factory StatusEvent.saveStatus(StatusEntity status) = SaveStatusEvent;
  const factory StatusEvent.refresh() = RefreshEvent;
}
