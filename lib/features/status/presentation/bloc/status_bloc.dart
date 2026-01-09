import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/status_entity.dart';
import '../../domain/usecases/get_statuses.dart';
import '../../domain/usecases/save_status.dart';
import 'status_event.dart';
import 'status_state.dart';

class StatusBloc extends Bloc<StatusEvent, StatusState> {
  final GetStatuses getStatuses;
  final SaveStatus saveStatus;

  StatusBloc({
    required this.getStatuses,
    required this.saveStatus,
  }) : super(const StatusState.initial()) {
    on<GetStatusesEvent>(_onGetStatuses);
    on<RefreshEvent>(_onRefresh);
    on<SaveStatusEvent>(_onSaveStatus);
  }

  Future<void> _onGetStatuses(GetStatusesEvent event, Emitter<StatusState> emit) async {
    emit(const StatusState.loading());
    final result = await getStatuses(const NoParams());
    
    result.fold(
      (failure) => emit(StatusState.error(failure.message)),
      (statuses) {
        final images = statuses.where((e) => e.type == StatusType.image).toList();
        final videos = statuses.where((e) => e.type == StatusType.video).toList();
        emit(StatusState.loaded(images: images, videos: videos));
      },
    );
  }

  Future<void> _onRefresh(RefreshEvent event, Emitter<StatusState> emit) async {
    // Keep loading state minimal or reuse generic load
    add(const StatusEvent.getStatuses());
  }

  Future<void> _onSaveStatus(SaveStatusEvent event, Emitter<StatusState> emit) async {
    // Save current state so we don't lose the list while showing success message
    final currentState = state;
    
    final result = await saveStatus(event.status);

    result.fold(
      (failure) => emit(StatusState.error(failure.message)),
      (_) {
        // Briefly emit saved state to trigger UI listeners (e.g. Snackbars)
        emit(const StatusState.saved('File saved successfully'));
        
        // Restore the previous loaded state so the list stays visible
        if (currentState is StatusLoaded) {
           emit(currentState); 
        } else {
           // Fallback if we weren't loaded for some reason
           add(const StatusEvent.getStatuses());
        }
      },
    );
  }
}
