// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThemeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isDark) themeModeChanged,
    required TResult Function() languageChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isDark)? themeModeChanged,
    TResult? Function()? languageChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isDark)? themeModeChanged,
    TResult Function()? languageChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ThemeModeChangedState value) themeModeChanged,
    required TResult Function(_LanguageChangedState value) languageChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ThemeModeChangedState value)? themeModeChanged,
    TResult? Function(_LanguageChangedState value)? languageChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ThemeModeChangedState value)? themeModeChanged,
    TResult Function(_LanguageChangedState value)? languageChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
          ThemeState value, $Res Function(ThemeState) then) =
      _$ThemeStateCopyWithImpl<$Res, ThemeState>;
}

/// @nodoc
class _$ThemeStateCopyWithImpl<$Res, $Val extends ThemeState>
    implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ThemeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ThemeState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isDark) themeModeChanged,
    required TResult Function() languageChanged,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isDark)? themeModeChanged,
    TResult? Function()? languageChanged,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isDark)? themeModeChanged,
    TResult Function()? languageChanged,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_ThemeModeChangedState value) themeModeChanged,
    required TResult Function(_LanguageChangedState value) languageChanged,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ThemeModeChangedState value)? themeModeChanged,
    TResult? Function(_LanguageChangedState value)? languageChanged,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ThemeModeChangedState value)? themeModeChanged,
    TResult Function(_LanguageChangedState value)? languageChanged,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ThemeState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ThemeModeChangedStateImplCopyWith<$Res> {
  factory _$$ThemeModeChangedStateImplCopyWith(
          _$ThemeModeChangedStateImpl value,
          $Res Function(_$ThemeModeChangedStateImpl) then) =
      __$$ThemeModeChangedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isDark});
}

/// @nodoc
class __$$ThemeModeChangedStateImplCopyWithImpl<$Res>
    extends _$ThemeStateCopyWithImpl<$Res, _$ThemeModeChangedStateImpl>
    implements _$$ThemeModeChangedStateImplCopyWith<$Res> {
  __$$ThemeModeChangedStateImplCopyWithImpl(_$ThemeModeChangedStateImpl _value,
      $Res Function(_$ThemeModeChangedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDark = null,
  }) {
    return _then(_$ThemeModeChangedStateImpl(
      isDark: null == isDark
          ? _value.isDark
          : isDark // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ThemeModeChangedStateImpl implements _ThemeModeChangedState {
  const _$ThemeModeChangedStateImpl({required this.isDark});

  @override
  final bool isDark;

  @override
  String toString() {
    return 'ThemeState.themeModeChanged(isDark: $isDark)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeModeChangedStateImpl &&
            (identical(other.isDark, isDark) || other.isDark == isDark));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDark);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeModeChangedStateImplCopyWith<_$ThemeModeChangedStateImpl>
      get copyWith => __$$ThemeModeChangedStateImplCopyWithImpl<
          _$ThemeModeChangedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isDark) themeModeChanged,
    required TResult Function() languageChanged,
  }) {
    return themeModeChanged(isDark);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isDark)? themeModeChanged,
    TResult? Function()? languageChanged,
  }) {
    return themeModeChanged?.call(isDark);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isDark)? themeModeChanged,
    TResult Function()? languageChanged,
    required TResult orElse(),
  }) {
    if (themeModeChanged != null) {
      return themeModeChanged(isDark);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ThemeModeChangedState value) themeModeChanged,
    required TResult Function(_LanguageChangedState value) languageChanged,
  }) {
    return themeModeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ThemeModeChangedState value)? themeModeChanged,
    TResult? Function(_LanguageChangedState value)? languageChanged,
  }) {
    return themeModeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ThemeModeChangedState value)? themeModeChanged,
    TResult Function(_LanguageChangedState value)? languageChanged,
    required TResult orElse(),
  }) {
    if (themeModeChanged != null) {
      return themeModeChanged(this);
    }
    return orElse();
  }
}

abstract class _ThemeModeChangedState implements ThemeState {
  const factory _ThemeModeChangedState({required final bool isDark}) =
      _$ThemeModeChangedStateImpl;

  bool get isDark;
  @JsonKey(ignore: true)
  _$$ThemeModeChangedStateImplCopyWith<_$ThemeModeChangedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LanguageChangedStateImplCopyWith<$Res> {
  factory _$$LanguageChangedStateImplCopyWith(_$LanguageChangedStateImpl value,
          $Res Function(_$LanguageChangedStateImpl) then) =
      __$$LanguageChangedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LanguageChangedStateImplCopyWithImpl<$Res>
    extends _$ThemeStateCopyWithImpl<$Res, _$LanguageChangedStateImpl>
    implements _$$LanguageChangedStateImplCopyWith<$Res> {
  __$$LanguageChangedStateImplCopyWithImpl(_$LanguageChangedStateImpl _value,
      $Res Function(_$LanguageChangedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LanguageChangedStateImpl implements _LanguageChangedState {
  const _$LanguageChangedStateImpl();

  @override
  String toString() {
    return 'ThemeState.languageChanged()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguageChangedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isDark) themeModeChanged,
    required TResult Function() languageChanged,
  }) {
    return languageChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isDark)? themeModeChanged,
    TResult? Function()? languageChanged,
  }) {
    return languageChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isDark)? themeModeChanged,
    TResult Function()? languageChanged,
    required TResult orElse(),
  }) {
    if (languageChanged != null) {
      return languageChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ThemeModeChangedState value) themeModeChanged,
    required TResult Function(_LanguageChangedState value) languageChanged,
  }) {
    return languageChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ThemeModeChangedState value)? themeModeChanged,
    TResult? Function(_LanguageChangedState value)? languageChanged,
  }) {
    return languageChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ThemeModeChangedState value)? themeModeChanged,
    TResult Function(_LanguageChangedState value)? languageChanged,
    required TResult orElse(),
  }) {
    if (languageChanged != null) {
      return languageChanged(this);
    }
    return orElse();
  }
}

abstract class _LanguageChangedState implements ThemeState {
  const factory _LanguageChangedState() = _$LanguageChangedStateImpl;
}
