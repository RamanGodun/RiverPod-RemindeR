import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

@freezed
class Activity with _$Activity {
  // The main factory for the Activity model, defining its properties.
  // Each field is required to ensure that the activity is fully defined.
  const factory Activity({
    required String activity,
    required double availability,
    required String type,
    required int participants,
    required double price,
    required String accessibility,
    required String duration,
    required bool kidFriendly,
    required String link,
    required String key,
  }) = _Activity;

  // Factory to create an Activity instance from a JSON response.
  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  // Factory to create an empty Activity object, used for initial or default states.
  factory Activity.empty() => const Activity(
    activity: '',
    availability: 0.0,
    type: '',
    participants: 0,
    price: 0.0,
    accessibility: '',
    duration: '',
    kidFriendly: false,
    link: '',
    key: '',
  );
}

// Predefined list of activity types, used for filtering or selecting activities.
// These types can be passed as parameters in API requests or used in UI elements.
const activityTypes = [
  "education",
  "recreational",
  "social",
  "charity",
  "cooking",
  "relaxation",
  "busywork",
];
