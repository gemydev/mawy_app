import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'preferences.dart';

class PreferenceState extends Equatable {
  final int updatedTime;
  final Preferences preferences;

  PreferenceState({
    @required this.updatedTime,
    @required this.preferences,
  })  : assert(updatedTime != null),
        assert(preferences != null),
        super();

  @override
  String toString() =>
      'PreferenceState{updatedTime: $updatedTime, preferences: $preferences}';

  @override
  List<Object> get props => throw UnimplementedError();
}
