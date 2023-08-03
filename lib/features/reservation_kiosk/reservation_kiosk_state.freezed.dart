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
// 予約一覧
  List<Reservation> get reservations =>
      throw _privateConstructorUsedError; // 最後尾待ち状況
  WaitingInfo get waitingInfo =>
      throw _privateConstructorUsedError; // ステータス毎予約一覧Map
  Map<CardStatus, List<Reservation>> get reservationsMap =>
      throw _privateConstructorUsedError; // 発券予約番号
  int get reservationNumber => throw _privateConstructorUsedError; // 発券予約情報
  String get encryptedText => throw _privateConstructorUsedError;

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
  $Res call(
      {List<Reservation> reservations,
      WaitingInfo waitingInfo,
      Map<CardStatus, List<Reservation>> reservationsMap,
      int reservationNumber,
      String encryptedText});
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
    Object? reservationsMap = null,
    Object? reservationNumber = null,
    Object? encryptedText = null,
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
      reservationsMap: null == reservationsMap
          ? _value.reservationsMap
          : reservationsMap // ignore: cast_nullable_to_non_nullable
              as Map<CardStatus, List<Reservation>>,
      reservationNumber: null == reservationNumber
          ? _value.reservationNumber
          : reservationNumber // ignore: cast_nullable_to_non_nullable
              as int,
      encryptedText: null == encryptedText
          ? _value.encryptedText
          : encryptedText // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call(
      {List<Reservation> reservations,
      WaitingInfo waitingInfo,
      Map<CardStatus, List<Reservation>> reservationsMap,
      int reservationNumber,
      String encryptedText});
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
    Object? reservationsMap = null,
    Object? reservationNumber = null,
    Object? encryptedText = null,
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
      reservationsMap: null == reservationsMap
          ? _value._reservationsMap
          : reservationsMap // ignore: cast_nullable_to_non_nullable
              as Map<CardStatus, List<Reservation>>,
      reservationNumber: null == reservationNumber
          ? _value.reservationNumber
          : reservationNumber // ignore: cast_nullable_to_non_nullable
              as int,
      encryptedText: null == encryptedText
          ? _value.encryptedText
          : encryptedText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ReservationKioskState implements _ReservationKioskState {
  const _$_ReservationKioskState(
      {required final List<Reservation> reservations,
      required this.waitingInfo,
      required final Map<CardStatus, List<Reservation>> reservationsMap,
      this.reservationNumber = 0,
      this.encryptedText = ""})
      : _reservations = reservations,
        _reservationsMap = reservationsMap;

// 予約一覧
  final List<Reservation> _reservations;
// 予約一覧
  @override
  List<Reservation> get reservations {
    if (_reservations is EqualUnmodifiableListView) return _reservations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reservations);
  }

// 最後尾待ち状況
  @override
  final WaitingInfo waitingInfo;
// ステータス毎予約一覧Map
  final Map<CardStatus, List<Reservation>> _reservationsMap;
// ステータス毎予約一覧Map
  @override
  Map<CardStatus, List<Reservation>> get reservationsMap {
    if (_reservationsMap is EqualUnmodifiableMapView) return _reservationsMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_reservationsMap);
  }

// 発券予約番号
  @override
  @JsonKey()
  final int reservationNumber;
// 発券予約情報
  @override
  @JsonKey()
  final String encryptedText;

  @override
  String toString() {
    return 'ReservationKioskState(reservations: $reservations, waitingInfo: $waitingInfo, reservationsMap: $reservationsMap, reservationNumber: $reservationNumber, encryptedText: $encryptedText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReservationKioskState &&
            const DeepCollectionEquality()
                .equals(other._reservations, _reservations) &&
            (identical(other.waitingInfo, waitingInfo) ||
                other.waitingInfo == waitingInfo) &&
            const DeepCollectionEquality()
                .equals(other._reservationsMap, _reservationsMap) &&
            (identical(other.reservationNumber, reservationNumber) ||
                other.reservationNumber == reservationNumber) &&
            (identical(other.encryptedText, encryptedText) ||
                other.encryptedText == encryptedText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_reservations),
      waitingInfo,
      const DeepCollectionEquality().hash(_reservationsMap),
      reservationNumber,
      encryptedText);

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
      required final WaitingInfo waitingInfo,
      required final Map<CardStatus, List<Reservation>> reservationsMap,
      final int reservationNumber,
      final String encryptedText}) = _$_ReservationKioskState;

  @override // 予約一覧
  List<Reservation> get reservations;
  @override // 最後尾待ち状況
  WaitingInfo get waitingInfo;
  @override // ステータス毎予約一覧Map
  Map<CardStatus, List<Reservation>> get reservationsMap;
  @override // 発券予約番号
  int get reservationNumber;
  @override // 発券予約情報
  String get encryptedText;
  @override
  @JsonKey(ignore: true)
  _$$_ReservationKioskStateCopyWith<_$_ReservationKioskState> get copyWith =>
      throw _privateConstructorUsedError;
}
