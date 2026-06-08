// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 GetTasksStatus get getTasksStatus; CreateTaskStatus get createTaskStatus; DeleteTaskStatus get deleteTaskStatus; String? get errorMessage; List<TaskModel>? get tasks;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.getTasksStatus, getTasksStatus) || other.getTasksStatus == getTasksStatus)&&(identical(other.createTaskStatus, createTaskStatus) || other.createTaskStatus == createTaskStatus)&&(identical(other.deleteTaskStatus, deleteTaskStatus) || other.deleteTaskStatus == deleteTaskStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.tasks, tasks));
}


@override
int get hashCode => Object.hash(runtimeType,getTasksStatus,createTaskStatus,deleteTaskStatus,errorMessage,const DeepCollectionEquality().hash(tasks));

@override
String toString() {
  return 'HomeState(getTasksStatus: $getTasksStatus, createTaskStatus: $createTaskStatus, deleteTaskStatus: $deleteTaskStatus, errorMessage: $errorMessage, tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 GetTasksStatus getTasksStatus, CreateTaskStatus createTaskStatus, DeleteTaskStatus deleteTaskStatus, String? errorMessage, List<TaskModel>? tasks
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? getTasksStatus = null,Object? createTaskStatus = null,Object? deleteTaskStatus = null,Object? errorMessage = freezed,Object? tasks = freezed,}) {
  return _then(_self.copyWith(
getTasksStatus: null == getTasksStatus ? _self.getTasksStatus : getTasksStatus // ignore: cast_nullable_to_non_nullable
as GetTasksStatus,createTaskStatus: null == createTaskStatus ? _self.createTaskStatus : createTaskStatus // ignore: cast_nullable_to_non_nullable
as CreateTaskStatus,deleteTaskStatus: null == deleteTaskStatus ? _self.deleteTaskStatus : deleteTaskStatus // ignore: cast_nullable_to_non_nullable
as DeleteTaskStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,tasks: freezed == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TaskModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GetTasksStatus getTasksStatus,  CreateTaskStatus createTaskStatus,  DeleteTaskStatus deleteTaskStatus,  String? errorMessage,  List<TaskModel>? tasks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.getTasksStatus,_that.createTaskStatus,_that.deleteTaskStatus,_that.errorMessage,_that.tasks);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GetTasksStatus getTasksStatus,  CreateTaskStatus createTaskStatus,  DeleteTaskStatus deleteTaskStatus,  String? errorMessage,  List<TaskModel>? tasks)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.getTasksStatus,_that.createTaskStatus,_that.deleteTaskStatus,_that.errorMessage,_that.tasks);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GetTasksStatus getTasksStatus,  CreateTaskStatus createTaskStatus,  DeleteTaskStatus deleteTaskStatus,  String? errorMessage,  List<TaskModel>? tasks)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.getTasksStatus,_that.createTaskStatus,_that.deleteTaskStatus,_that.errorMessage,_that.tasks);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({this.getTasksStatus = GetTasksStatus.initial, this.createTaskStatus = CreateTaskStatus.initial, this.deleteTaskStatus = DeleteTaskStatus.initial, this.errorMessage, final  List<TaskModel>? tasks}): _tasks = tasks;
  

@override@JsonKey() final  GetTasksStatus getTasksStatus;
@override@JsonKey() final  CreateTaskStatus createTaskStatus;
@override@JsonKey() final  DeleteTaskStatus deleteTaskStatus;
@override final  String? errorMessage;
 final  List<TaskModel>? _tasks;
@override List<TaskModel>? get tasks {
  final value = _tasks;
  if (value == null) return null;
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.getTasksStatus, getTasksStatus) || other.getTasksStatus == getTasksStatus)&&(identical(other.createTaskStatus, createTaskStatus) || other.createTaskStatus == createTaskStatus)&&(identical(other.deleteTaskStatus, deleteTaskStatus) || other.deleteTaskStatus == deleteTaskStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._tasks, _tasks));
}


@override
int get hashCode => Object.hash(runtimeType,getTasksStatus,createTaskStatus,deleteTaskStatus,errorMessage,const DeepCollectionEquality().hash(_tasks));

@override
String toString() {
  return 'HomeState(getTasksStatus: $getTasksStatus, createTaskStatus: $createTaskStatus, deleteTaskStatus: $deleteTaskStatus, errorMessage: $errorMessage, tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 GetTasksStatus getTasksStatus, CreateTaskStatus createTaskStatus, DeleteTaskStatus deleteTaskStatus, String? errorMessage, List<TaskModel>? tasks
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? getTasksStatus = null,Object? createTaskStatus = null,Object? deleteTaskStatus = null,Object? errorMessage = freezed,Object? tasks = freezed,}) {
  return _then(_HomeState(
getTasksStatus: null == getTasksStatus ? _self.getTasksStatus : getTasksStatus // ignore: cast_nullable_to_non_nullable
as GetTasksStatus,createTaskStatus: null == createTaskStatus ? _self.createTaskStatus : createTaskStatus // ignore: cast_nullable_to_non_nullable
as CreateTaskStatus,deleteTaskStatus: null == deleteTaskStatus ? _self.deleteTaskStatus : deleteTaskStatus // ignore: cast_nullable_to_non_nullable
as DeleteTaskStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,tasks: freezed == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TaskModel>?,
  ));
}


}

// dart format on
