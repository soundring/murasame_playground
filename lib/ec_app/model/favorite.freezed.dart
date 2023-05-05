// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Favorite _$FavoriteFromJson(Map<String, dynamic> json) {
  return _Favorite.fromJson(json);
}

/// @nodoc
mixin _$Favorite {
  List<int> get favoriteProductIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteCopyWith<Favorite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteCopyWith<$Res> {
  factory $FavoriteCopyWith(Favorite value, $Res Function(Favorite) then) =
      _$FavoriteCopyWithImpl<$Res, Favorite>;
  @useResult
  $Res call({List<int> favoriteProductIds});
}

/// @nodoc
class _$FavoriteCopyWithImpl<$Res, $Val extends Favorite>
    implements $FavoriteCopyWith<$Res> {
  _$FavoriteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteProductIds = null,
  }) {
    return _then(_value.copyWith(
      favoriteProductIds: null == favoriteProductIds
          ? _value.favoriteProductIds
          : favoriteProductIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavoriteCopyWith<$Res> implements $FavoriteCopyWith<$Res> {
  factory _$$_FavoriteCopyWith(
          _$_Favorite value, $Res Function(_$_Favorite) then) =
      __$$_FavoriteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> favoriteProductIds});
}

/// @nodoc
class __$$_FavoriteCopyWithImpl<$Res>
    extends _$FavoriteCopyWithImpl<$Res, _$_Favorite>
    implements _$$_FavoriteCopyWith<$Res> {
  __$$_FavoriteCopyWithImpl(
      _$_Favorite _value, $Res Function(_$_Favorite) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteProductIds = null,
  }) {
    return _then(_$_Favorite(
      favoriteProductIds: null == favoriteProductIds
          ? _value._favoriteProductIds
          : favoriteProductIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Favorite with DiagnosticableTreeMixin implements _Favorite {
  _$_Favorite({required final List<int> favoriteProductIds})
      : _favoriteProductIds = favoriteProductIds;

  factory _$_Favorite.fromJson(Map<String, dynamic> json) =>
      _$$_FavoriteFromJson(json);

  final List<int> _favoriteProductIds;
  @override
  List<int> get favoriteProductIds {
    if (_favoriteProductIds is EqualUnmodifiableListView)
      return _favoriteProductIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteProductIds);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Favorite(favoriteProductIds: $favoriteProductIds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Favorite'))
      ..add(DiagnosticsProperty('favoriteProductIds', favoriteProductIds));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Favorite &&
            const DeepCollectionEquality()
                .equals(other._favoriteProductIds, _favoriteProductIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_favoriteProductIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoriteCopyWith<_$_Favorite> get copyWith =>
      __$$_FavoriteCopyWithImpl<_$_Favorite>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteToJson(
      this,
    );
  }
}

abstract class _Favorite implements Favorite {
  factory _Favorite({required final List<int> favoriteProductIds}) =
      _$_Favorite;

  factory _Favorite.fromJson(Map<String, dynamic> json) = _$_Favorite.fromJson;

  @override
  List<int> get favoriteProductIds;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteCopyWith<_$_Favorite> get copyWith =>
      throw _privateConstructorUsedError;
}
