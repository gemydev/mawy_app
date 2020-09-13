import 'package:equatable/equatable.dart';
import 'package:mawy_app/preference_healper/preference_helper.dart';

abstract class PreferenceEvent extends Equatable {
  PreferenceEvent([List props = const []]);
}

class UpdatePreference extends PreferenceEvent {
  final Preference updatedPreference;

  UpdatePreference(this.updatedPreference) : super([updatedPreference]);

  @override
  String toString() => 'UpdatePreference';

  @override
  List<Object> get props => [updatedPreference];
}
