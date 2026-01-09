// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$StatusState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<StatusEntity> images,
      List<StatusEntity> videos,
    )
    loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) saved,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StatusEntity> images, List<StatusEntity> videos)?
    loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? saved,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StatusEntity> images, List<StatusEntity> videos)?
    loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? saved,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatusInitial value) initial,
    required TResult Function(StatusLoading value) loading,
    required TResult Function(StatusLoaded value) loaded,
    required TResult Function(StatusError value) error,
    required TResult Function(StatusSaved value) saved,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatusInitial value)? initial,
    TResult? Function(StatusLoading value)? loading,
    TResult? Function(StatusLoaded value)? loaded,
    TResult? Function(StatusError value)? error,
    TResult? Function(StatusSaved value)? saved,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatusInitial value)? initial,
    TResult Function(StatusLoading value)? loading,
    TResult Function(StatusLoaded value)? loaded,
    TResult Function(StatusError value)? error,
    TResult Function(StatusSaved value)? saved,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusStateCopyWith<$Res> {
  factory $StatusStateCopyWith(
    StatusState value,
    $Res Function(StatusState) then,
  ) = _$StatusStateCopyWithImpl<$Res, StatusState>;
}

/// @nodoc
class _$StatusStateCopyWithImpl<$Res, $Val extends StatusState>
    implements $StatusStateCopyWith<$Res> {
  _$StatusStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatusState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StatusInitialImplCopyWith<$Res> {
  factory _$$StatusInitialImplCopyWith(
    _$StatusInitialImpl value,
    $Res Function(_$StatusInitialImpl) then,
  ) = __$$StatusInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StatusInitialImplCopyWithImpl<$Res>
    extends _$StatusStateCopyWithImpl<$Res, _$StatusInitialImpl>
    implements _$$StatusInitialImplCopyWith<$Res> {
  __$$StatusInitialImplCopyWithImpl(
    _$StatusInitialImpl _value,
    $Res Function(_$StatusInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StatusState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StatusInitialImpl implements StatusInitial {
  const _$StatusInitialImpl();

  @override
  String toString() {
    return 'StatusState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StatusInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<StatusEntity> images,
      List<StatusEntity> videos,
    )
    loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) saved,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StatusEntity> images, List<StatusEntity> videos)?
    loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? saved,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StatusEntity> images, List<StatusEntity> videos)?
    loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? saved,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatusInitial value) initial,
    required TResult Function(StatusLoading value) loading,
    required TResult Function(StatusLoaded value) loaded,
    required TResult Function(StatusError value) error,
    required TResult Function(StatusSaved value) saved,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatusInitial value)? initial,
    TResult? Function(StatusLoading value)? loading,
    TResult? Function(StatusLoaded value)? loaded,
    TResult? Function(StatusError value)? error,
    TResult? Function(StatusSaved value)? saved,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatusInitial value)? initial,
    TResult Function(StatusLoading value)? loading,
    TResult Function(StatusLoaded value)? loaded,
    TResult Function(StatusError value)? error,
    TResult Function(StatusSaved value)? saved,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class StatusInitial implements StatusState {
  const factory StatusInitial() = _$StatusInitialImpl;
}

/// @nodoc
abstract class _$$StatusLoadingImplCopyWith<$Res> {
  factory _$$StatusLoadingImplCopyWith(
    _$StatusLoadingImpl value,
    $Res Function(_$StatusLoadingImpl) then,
  ) = __$$StatusLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StatusLoadingImplCopyWithImpl<$Res>
    extends _$StatusStateCopyWithImpl<$Res, _$StatusLoadingImpl>
    implements _$$StatusLoadingImplCopyWith<$Res> {
  __$$StatusLoadingImplCopyWithImpl(
    _$StatusLoadingImpl _value,
    $Res Function(_$StatusLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StatusState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StatusLoadingImpl implements StatusLoading {
  const _$StatusLoadingImpl();

  @override
  String toString() {
    return 'StatusState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StatusLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<StatusEntity> images,
      List<StatusEntity> videos,
    )
    loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) saved,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StatusEntity> images, List<StatusEntity> videos)?
    loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? saved,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StatusEntity> images, List<StatusEntity> videos)?
    loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? saved,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatusInitial value) initial,
    required TResult Function(StatusLoading value) loading,
    required TResult Function(StatusLoaded value) loaded,
    required TResult Function(StatusError value) error,
    required TResult Function(StatusSaved value) saved,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatusInitial value)? initial,
    TResult? Function(StatusLoading value)? loading,
    TResult? Function(StatusLoaded value)? loaded,
    TResult? Function(StatusError value)? error,
    TResult? Function(StatusSaved value)? saved,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatusInitial value)? initial,
    TResult Function(StatusLoading value)? loading,
    TResult Function(StatusLoaded value)? loaded,
    TResult Function(StatusError value)? error,
    TResult Function(StatusSaved value)? saved,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class StatusLoading implements StatusState {
  const factory StatusLoading() = _$StatusLoadingImpl;
}

/// @nodoc
abstract class _$$StatusLoadedImplCopyWith<$Res> {
  factory _$$StatusLoadedImplCopyWith(
    _$StatusLoadedImpl value,
    $Res Function(_$StatusLoadedImpl) then,
  ) = __$$StatusLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<StatusEntity> images, List<StatusEntity> videos});
}

/// @nodoc
class __$$StatusLoadedImplCopyWithImpl<$Res>
    extends _$StatusStateCopyWithImpl<$Res, _$StatusLoadedImpl>
    implements _$$StatusLoadedImplCopyWith<$Res> {
  __$$StatusLoadedImplCopyWithImpl(
    _$StatusLoadedImpl _value,
    $Res Function(_$StatusLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StatusState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? images = null, Object? videos = null}) {
    return _then(
      _$StatusLoadedImpl(
        images:
            null == images
                ? _value._images
                : images // ignore: cast_nullable_to_non_nullable
                    as List<StatusEntity>,
        videos:
            null == videos
                ? _value._videos
                : videos // ignore: cast_nullable_to_non_nullable
                    as List<StatusEntity>,
      ),
    );
  }
}

/// @nodoc

class _$StatusLoadedImpl implements StatusLoaded {
  const _$StatusLoadedImpl({
    required final List<StatusEntity> images,
    required final List<StatusEntity> videos,
  }) : _images = images,
       _videos = videos;

  final List<StatusEntity> _images;
  @override
  List<StatusEntity> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<StatusEntity> _videos;
  @override
  List<StatusEntity> get videos {
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videos);
  }

  @override
  String toString() {
    return 'StatusState.loaded(images: $images, videos: $videos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusLoadedImpl &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._videos, _videos));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_images),
    const DeepCollectionEquality().hash(_videos),
  );

  /// Create a copy of StatusState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusLoadedImplCopyWith<_$StatusLoadedImpl> get copyWith =>
      __$$StatusLoadedImplCopyWithImpl<_$StatusLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<StatusEntity> images,
      List<StatusEntity> videos,
    )
    loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) saved,
  }) {
    return loaded(images, videos);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StatusEntity> images, List<StatusEntity> videos)?
    loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? saved,
  }) {
    return loaded?.call(images, videos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StatusEntity> images, List<StatusEntity> videos)?
    loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? saved,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(images, videos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatusInitial value) initial,
    required TResult Function(StatusLoading value) loading,
    required TResult Function(StatusLoaded value) loaded,
    required TResult Function(StatusError value) error,
    required TResult Function(StatusSaved value) saved,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatusInitial value)? initial,
    TResult? Function(StatusLoading value)? loading,
    TResult? Function(StatusLoaded value)? loaded,
    TResult? Function(StatusError value)? error,
    TResult? Function(StatusSaved value)? saved,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatusInitial value)? initial,
    TResult Function(StatusLoading value)? loading,
    TResult Function(StatusLoaded value)? loaded,
    TResult Function(StatusError value)? error,
    TResult Function(StatusSaved value)? saved,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class StatusLoaded implements StatusState {
  const factory StatusLoaded({
    required final List<StatusEntity> images,
    required final List<StatusEntity> videos,
  }) = _$StatusLoadedImpl;

  List<StatusEntity> get images;
  List<StatusEntity> get videos;

  /// Create a copy of StatusState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusLoadedImplCopyWith<_$StatusLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StatusErrorImplCopyWith<$Res> {
  factory _$$StatusErrorImplCopyWith(
    _$StatusErrorImpl value,
    $Res Function(_$StatusErrorImpl) then,
  ) = __$$StatusErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$StatusErrorImplCopyWithImpl<$Res>
    extends _$StatusStateCopyWithImpl<$Res, _$StatusErrorImpl>
    implements _$$StatusErrorImplCopyWith<$Res> {
  __$$StatusErrorImplCopyWithImpl(
    _$StatusErrorImpl _value,
    $Res Function(_$StatusErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StatusState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$StatusErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$StatusErrorImpl implements StatusError {
  const _$StatusErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'StatusState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of StatusState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusErrorImplCopyWith<_$StatusErrorImpl> get copyWith =>
      __$$StatusErrorImplCopyWithImpl<_$StatusErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<StatusEntity> images,
      List<StatusEntity> videos,
    )
    loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) saved,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StatusEntity> images, List<StatusEntity> videos)?
    loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? saved,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StatusEntity> images, List<StatusEntity> videos)?
    loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? saved,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatusInitial value) initial,
    required TResult Function(StatusLoading value) loading,
    required TResult Function(StatusLoaded value) loaded,
    required TResult Function(StatusError value) error,
    required TResult Function(StatusSaved value) saved,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatusInitial value)? initial,
    TResult? Function(StatusLoading value)? loading,
    TResult? Function(StatusLoaded value)? loaded,
    TResult? Function(StatusError value)? error,
    TResult? Function(StatusSaved value)? saved,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatusInitial value)? initial,
    TResult Function(StatusLoading value)? loading,
    TResult Function(StatusLoaded value)? loaded,
    TResult Function(StatusError value)? error,
    TResult Function(StatusSaved value)? saved,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class StatusError implements StatusState {
  const factory StatusError(final String message) = _$StatusErrorImpl;

  String get message;

  /// Create a copy of StatusState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusErrorImplCopyWith<_$StatusErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StatusSavedImplCopyWith<$Res> {
  factory _$$StatusSavedImplCopyWith(
    _$StatusSavedImpl value,
    $Res Function(_$StatusSavedImpl) then,
  ) = __$$StatusSavedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$StatusSavedImplCopyWithImpl<$Res>
    extends _$StatusStateCopyWithImpl<$Res, _$StatusSavedImpl>
    implements _$$StatusSavedImplCopyWith<$Res> {
  __$$StatusSavedImplCopyWithImpl(
    _$StatusSavedImpl _value,
    $Res Function(_$StatusSavedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StatusState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$StatusSavedImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$StatusSavedImpl implements StatusSaved {
  const _$StatusSavedImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'StatusState.saved(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusSavedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of StatusState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusSavedImplCopyWith<_$StatusSavedImpl> get copyWith =>
      __$$StatusSavedImplCopyWithImpl<_$StatusSavedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<StatusEntity> images,
      List<StatusEntity> videos,
    )
    loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) saved,
  }) {
    return saved(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StatusEntity> images, List<StatusEntity> videos)?
    loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? saved,
  }) {
    return saved?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StatusEntity> images, List<StatusEntity> videos)?
    loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatusInitial value) initial,
    required TResult Function(StatusLoading value) loading,
    required TResult Function(StatusLoaded value) loaded,
    required TResult Function(StatusError value) error,
    required TResult Function(StatusSaved value) saved,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatusInitial value)? initial,
    TResult? Function(StatusLoading value)? loading,
    TResult? Function(StatusLoaded value)? loaded,
    TResult? Function(StatusError value)? error,
    TResult? Function(StatusSaved value)? saved,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatusInitial value)? initial,
    TResult Function(StatusLoading value)? loading,
    TResult Function(StatusLoaded value)? loaded,
    TResult Function(StatusError value)? error,
    TResult Function(StatusSaved value)? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class StatusSaved implements StatusState {
  const factory StatusSaved(final String message) = _$StatusSavedImpl;

  String get message;

  /// Create a copy of StatusState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusSavedImplCopyWith<_$StatusSavedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
