// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$StatusEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getStatuses,
    required TResult Function(StatusEntity status) saveStatus,
    required TResult Function() refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getStatuses,
    TResult? Function(StatusEntity status)? saveStatus,
    TResult? Function()? refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getStatuses,
    TResult Function(StatusEntity status)? saveStatus,
    TResult Function()? refresh,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetStatusesEvent value) getStatuses,
    required TResult Function(SaveStatusEvent value) saveStatus,
    required TResult Function(RefreshEvent value) refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetStatusesEvent value)? getStatuses,
    TResult? Function(SaveStatusEvent value)? saveStatus,
    TResult? Function(RefreshEvent value)? refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetStatusesEvent value)? getStatuses,
    TResult Function(SaveStatusEvent value)? saveStatus,
    TResult Function(RefreshEvent value)? refresh,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusEventCopyWith<$Res> {
  factory $StatusEventCopyWith(
    StatusEvent value,
    $Res Function(StatusEvent) then,
  ) = _$StatusEventCopyWithImpl<$Res, StatusEvent>;
}

/// @nodoc
class _$StatusEventCopyWithImpl<$Res, $Val extends StatusEvent>
    implements $StatusEventCopyWith<$Res> {
  _$StatusEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatusEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetStatusesEventImplCopyWith<$Res> {
  factory _$$GetStatusesEventImplCopyWith(
    _$GetStatusesEventImpl value,
    $Res Function(_$GetStatusesEventImpl) then,
  ) = __$$GetStatusesEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetStatusesEventImplCopyWithImpl<$Res>
    extends _$StatusEventCopyWithImpl<$Res, _$GetStatusesEventImpl>
    implements _$$GetStatusesEventImplCopyWith<$Res> {
  __$$GetStatusesEventImplCopyWithImpl(
    _$GetStatusesEventImpl _value,
    $Res Function(_$GetStatusesEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StatusEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetStatusesEventImpl implements GetStatusesEvent {
  const _$GetStatusesEventImpl();

  @override
  String toString() {
    return 'StatusEvent.getStatuses()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetStatusesEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getStatuses,
    required TResult Function(StatusEntity status) saveStatus,
    required TResult Function() refresh,
  }) {
    return getStatuses();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getStatuses,
    TResult? Function(StatusEntity status)? saveStatus,
    TResult? Function()? refresh,
  }) {
    return getStatuses?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getStatuses,
    TResult Function(StatusEntity status)? saveStatus,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (getStatuses != null) {
      return getStatuses();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetStatusesEvent value) getStatuses,
    required TResult Function(SaveStatusEvent value) saveStatus,
    required TResult Function(RefreshEvent value) refresh,
  }) {
    return getStatuses(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetStatusesEvent value)? getStatuses,
    TResult? Function(SaveStatusEvent value)? saveStatus,
    TResult? Function(RefreshEvent value)? refresh,
  }) {
    return getStatuses?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetStatusesEvent value)? getStatuses,
    TResult Function(SaveStatusEvent value)? saveStatus,
    TResult Function(RefreshEvent value)? refresh,
    required TResult orElse(),
  }) {
    if (getStatuses != null) {
      return getStatuses(this);
    }
    return orElse();
  }
}

abstract class GetStatusesEvent implements StatusEvent {
  const factory GetStatusesEvent() = _$GetStatusesEventImpl;
}

/// @nodoc
abstract class _$$SaveStatusEventImplCopyWith<$Res> {
  factory _$$SaveStatusEventImplCopyWith(
    _$SaveStatusEventImpl value,
    $Res Function(_$SaveStatusEventImpl) then,
  ) = __$$SaveStatusEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StatusEntity status});
}

/// @nodoc
class __$$SaveStatusEventImplCopyWithImpl<$Res>
    extends _$StatusEventCopyWithImpl<$Res, _$SaveStatusEventImpl>
    implements _$$SaveStatusEventImplCopyWith<$Res> {
  __$$SaveStatusEventImplCopyWithImpl(
    _$SaveStatusEventImpl _value,
    $Res Function(_$SaveStatusEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = null}) {
    return _then(
      _$SaveStatusEventImpl(
        null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                as StatusEntity,
      ),
    );
  }
}

/// @nodoc

class _$SaveStatusEventImpl implements SaveStatusEvent {
  const _$SaveStatusEventImpl(this.status);

  @override
  final StatusEntity status;

  @override
  String toString() {
    return 'StatusEvent.saveStatus(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveStatusEventImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of StatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveStatusEventImplCopyWith<_$SaveStatusEventImpl> get copyWith =>
      __$$SaveStatusEventImplCopyWithImpl<_$SaveStatusEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getStatuses,
    required TResult Function(StatusEntity status) saveStatus,
    required TResult Function() refresh,
  }) {
    return saveStatus(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getStatuses,
    TResult? Function(StatusEntity status)? saveStatus,
    TResult? Function()? refresh,
  }) {
    return saveStatus?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getStatuses,
    TResult Function(StatusEntity status)? saveStatus,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (saveStatus != null) {
      return saveStatus(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetStatusesEvent value) getStatuses,
    required TResult Function(SaveStatusEvent value) saveStatus,
    required TResult Function(RefreshEvent value) refresh,
  }) {
    return saveStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetStatusesEvent value)? getStatuses,
    TResult? Function(SaveStatusEvent value)? saveStatus,
    TResult? Function(RefreshEvent value)? refresh,
  }) {
    return saveStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetStatusesEvent value)? getStatuses,
    TResult Function(SaveStatusEvent value)? saveStatus,
    TResult Function(RefreshEvent value)? refresh,
    required TResult orElse(),
  }) {
    if (saveStatus != null) {
      return saveStatus(this);
    }
    return orElse();
  }
}

abstract class SaveStatusEvent implements StatusEvent {
  const factory SaveStatusEvent(final StatusEntity status) =
      _$SaveStatusEventImpl;

  StatusEntity get status;

  /// Create a copy of StatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveStatusEventImplCopyWith<_$SaveStatusEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshEventImplCopyWith<$Res> {
  factory _$$RefreshEventImplCopyWith(
    _$RefreshEventImpl value,
    $Res Function(_$RefreshEventImpl) then,
  ) = __$$RefreshEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshEventImplCopyWithImpl<$Res>
    extends _$StatusEventCopyWithImpl<$Res, _$RefreshEventImpl>
    implements _$$RefreshEventImplCopyWith<$Res> {
  __$$RefreshEventImplCopyWithImpl(
    _$RefreshEventImpl _value,
    $Res Function(_$RefreshEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StatusEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshEventImpl implements RefreshEvent {
  const _$RefreshEventImpl();

  @override
  String toString() {
    return 'StatusEvent.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getStatuses,
    required TResult Function(StatusEntity status) saveStatus,
    required TResult Function() refresh,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getStatuses,
    TResult? Function(StatusEntity status)? saveStatus,
    TResult? Function()? refresh,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getStatuses,
    TResult Function(StatusEntity status)? saveStatus,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetStatusesEvent value) getStatuses,
    required TResult Function(SaveStatusEvent value) saveStatus,
    required TResult Function(RefreshEvent value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetStatusesEvent value)? getStatuses,
    TResult? Function(SaveStatusEvent value)? saveStatus,
    TResult? Function(RefreshEvent value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetStatusesEvent value)? getStatuses,
    TResult Function(SaveStatusEvent value)? saveStatus,
    TResult Function(RefreshEvent value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class RefreshEvent implements StatusEvent {
  const factory RefreshEvent() = _$RefreshEventImpl;
}
