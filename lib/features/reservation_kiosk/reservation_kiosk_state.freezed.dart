// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_kiosk_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReservationKioskState {
  List<Reservation> get reservations => throw _privateConstructorUsedError;
  WaitingInfo get waitingInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReservationKioskStateCopyWith<ReservationKioskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationKioskStateCopyWith<$Res> {
  factory $ReservationKioskStateCopyWith(ReservationKioskState value,
          $Res Function(ReservationKioskState) then) =
      _$ReservationKioskStateCopyWithImpl<$Res, ReservationKioskState>;
  @useResult
  $Res call({List<Reservation> reservations, WaitingInfo waitingInfo});
}

/// @nodoc
class _$ReservationKioskStateCopyWithImpl<$Res,
        $Val extends ReservationKioskState>
    implements $ReservationKioskStateCopyWith<$Res> {
  _$ReservationKioskStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservations = null,
    Object? waitingInfo = null,
  }) {
    return _then(_value.copyWith(
      reservations: null == reservations
          ? _value.reservations
          : reservations // ignore: cast_nullable_to_non_nullable
              as List<Reservation>,
      waitingInfo: null == waitingInfo
          ? _value.waitingInfo
          : waitingInfo // ignore: cast_nullable_to_non_nullable
              as WaitingInfo,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReservationKioskStateCopyWith<$Res>
    implements $ReservationKioskStateCopyWith<$Res> {
  factory _$$_ReservationKioskStateCopyWith(_$_ReservationKioskState value,
          $Res Function(_$_ReservationKioskState) then) =
      __$$_ReservationKioskStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Reservation> reservations, WaitingInfo waitingInfo});
}

/// @nodoc
class __$$_ReservationKioskStateCopyWithImpl<$Res>
    extends _$ReservationKioskStateCopyWithImpl<$Res, _$_ReservationKioskState>
    implements _$$_ReservationKioskStateCopyWith<$Res> {
  __$$_ReservationKioskStateCopyWithImpl(_$_ReservationKioskState _value,
      $Res Function(_$_ReservationKioskState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservations = null,
    Object? waitingInfo = null,
  }) {
    return _then(_$_ReservationKioskState(
      reservations: null == reservations
          ? _value._reservations
          : reservations // ignore: cast_nullable_to_non_nullable
              as List<Reservation>,
      waitingInfo: null == waitingInfo
          ? _value.waitingInfo
          : waitingInfo // ignore: cast_nullable_to_non_nullable
              as WaitingInfo,
    ));
  }
}

/// @nodoc

class _$_ReservationKioskState implements _ReservationKioskState {
  const _$_ReservationKioskState(
      {required final List<Reservation> reservations,
      required this.waitingInfo})
      : _reservations = reservations;

  final List<Reservation> _reservations;
  @override
  List<Reservation> get reservations {
    if (_reservations is EqualUnmodifiableListView) return _reservations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reservations);
  }

  @override
  final WaitingInfo waitingInfo;

  @override
  String toString() {
    return 'ReservationKioskState(reservations: $reservations, waitingInfo: $waitingInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReservationKioskState &&
            const DeepCollectionEquality()
                .equals(other._reservations, _reservations) &&
            (identical(other.waitingInfo, waitingInfo) ||
                other.waitingInfo == waitingInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_reservations), waitingInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReservationKioskStateCopyWith<_$_ReservationKioskState> get copyWith =>
      __$$_ReservationKioskStateCopyWithImpl<_$_ReservationKioskState>(
          this, _$identity);
}

abstract class _ReservationKioskState implements ReservationKioskState {
  const factory _ReservationKioskState(
      {required final List<Reservation> reservations,
      required final WaitingInfo waitingInfo}) = _$_ReservationKioskState;

  @override
  List<Reservation> get reservations;
  @override
  WaitingInfo get waitingInfo;
  @override
  @JsonKey(ignore: true)
  _$$_ReservationKioskStateCopyWith<_$_ReservationKioskState> get copyWith =>
      throw _privateConstructorUsedError;
}
