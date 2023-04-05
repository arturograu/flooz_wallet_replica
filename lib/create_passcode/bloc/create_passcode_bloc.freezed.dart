// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_passcode_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreatePasscodeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String passcode) passcodeChanged,
    required TResult Function() createPasscodeSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String passcode)? passcodeChanged,
    TResult? Function()? createPasscodeSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String passcode)? passcodeChanged,
    TResult Function()? createPasscodeSubmitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasscodeChanged value) passcodeChanged,
    required TResult Function(_CreatePasscodeSubmitted value)
        createPasscodeSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PasscodeChanged value)? passcodeChanged,
    TResult? Function(_CreatePasscodeSubmitted value)? createPasscodeSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasscodeChanged value)? passcodeChanged,
    TResult Function(_CreatePasscodeSubmitted value)? createPasscodeSubmitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePasscodeEventCopyWith<$Res> {
  factory $CreatePasscodeEventCopyWith(
          CreatePasscodeEvent value, $Res Function(CreatePasscodeEvent) then) =
      _$CreatePasscodeEventCopyWithImpl<$Res, CreatePasscodeEvent>;
}

/// @nodoc
class _$CreatePasscodeEventCopyWithImpl<$Res, $Val extends CreatePasscodeEvent>
    implements $CreatePasscodeEventCopyWith<$Res> {
  _$CreatePasscodeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_PasscodeChangedCopyWith<$Res> {
  factory _$$_PasscodeChangedCopyWith(
          _$_PasscodeChanged value, $Res Function(_$_PasscodeChanged) then) =
      __$$_PasscodeChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String passcode});
}

/// @nodoc
class __$$_PasscodeChangedCopyWithImpl<$Res>
    extends _$CreatePasscodeEventCopyWithImpl<$Res, _$_PasscodeChanged>
    implements _$$_PasscodeChangedCopyWith<$Res> {
  __$$_PasscodeChangedCopyWithImpl(
      _$_PasscodeChanged _value, $Res Function(_$_PasscodeChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passcode = null,
  }) {
    return _then(_$_PasscodeChanged(
      null == passcode
          ? _value.passcode
          : passcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PasscodeChanged implements _PasscodeChanged {
  const _$_PasscodeChanged(this.passcode);

  @override
  final String passcode;

  @override
  String toString() {
    return 'CreatePasscodeEvent.passcodeChanged(passcode: $passcode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasscodeChanged &&
            (identical(other.passcode, passcode) ||
                other.passcode == passcode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, passcode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PasscodeChangedCopyWith<_$_PasscodeChanged> get copyWith =>
      __$$_PasscodeChangedCopyWithImpl<_$_PasscodeChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String passcode) passcodeChanged,
    required TResult Function() createPasscodeSubmitted,
  }) {
    return passcodeChanged(passcode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String passcode)? passcodeChanged,
    TResult? Function()? createPasscodeSubmitted,
  }) {
    return passcodeChanged?.call(passcode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String passcode)? passcodeChanged,
    TResult Function()? createPasscodeSubmitted,
    required TResult orElse(),
  }) {
    if (passcodeChanged != null) {
      return passcodeChanged(passcode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasscodeChanged value) passcodeChanged,
    required TResult Function(_CreatePasscodeSubmitted value)
        createPasscodeSubmitted,
  }) {
    return passcodeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PasscodeChanged value)? passcodeChanged,
    TResult? Function(_CreatePasscodeSubmitted value)? createPasscodeSubmitted,
  }) {
    return passcodeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasscodeChanged value)? passcodeChanged,
    TResult Function(_CreatePasscodeSubmitted value)? createPasscodeSubmitted,
    required TResult orElse(),
  }) {
    if (passcodeChanged != null) {
      return passcodeChanged(this);
    }
    return orElse();
  }
}

abstract class _PasscodeChanged implements CreatePasscodeEvent {
  const factory _PasscodeChanged(final String passcode) = _$_PasscodeChanged;

  String get passcode;
  @JsonKey(ignore: true)
  _$$_PasscodeChangedCopyWith<_$_PasscodeChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CreatePasscodeSubmittedCopyWith<$Res> {
  factory _$$_CreatePasscodeSubmittedCopyWith(_$_CreatePasscodeSubmitted value,
          $Res Function(_$_CreatePasscodeSubmitted) then) =
      __$$_CreatePasscodeSubmittedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CreatePasscodeSubmittedCopyWithImpl<$Res>
    extends _$CreatePasscodeEventCopyWithImpl<$Res, _$_CreatePasscodeSubmitted>
    implements _$$_CreatePasscodeSubmittedCopyWith<$Res> {
  __$$_CreatePasscodeSubmittedCopyWithImpl(_$_CreatePasscodeSubmitted _value,
      $Res Function(_$_CreatePasscodeSubmitted) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_CreatePasscodeSubmitted implements _CreatePasscodeSubmitted {
  const _$_CreatePasscodeSubmitted();

  @override
  String toString() {
    return 'CreatePasscodeEvent.createPasscodeSubmitted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreatePasscodeSubmitted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String passcode) passcodeChanged,
    required TResult Function() createPasscodeSubmitted,
  }) {
    return createPasscodeSubmitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String passcode)? passcodeChanged,
    TResult? Function()? createPasscodeSubmitted,
  }) {
    return createPasscodeSubmitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String passcode)? passcodeChanged,
    TResult Function()? createPasscodeSubmitted,
    required TResult orElse(),
  }) {
    if (createPasscodeSubmitted != null) {
      return createPasscodeSubmitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasscodeChanged value) passcodeChanged,
    required TResult Function(_CreatePasscodeSubmitted value)
        createPasscodeSubmitted,
  }) {
    return createPasscodeSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PasscodeChanged value)? passcodeChanged,
    TResult? Function(_CreatePasscodeSubmitted value)? createPasscodeSubmitted,
  }) {
    return createPasscodeSubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasscodeChanged value)? passcodeChanged,
    TResult Function(_CreatePasscodeSubmitted value)? createPasscodeSubmitted,
    required TResult orElse(),
  }) {
    if (createPasscodeSubmitted != null) {
      return createPasscodeSubmitted(this);
    }
    return orElse();
  }
}

abstract class _CreatePasscodeSubmitted implements CreatePasscodeEvent {
  const factory _CreatePasscodeSubmitted() = _$_CreatePasscodeSubmitted;
}
