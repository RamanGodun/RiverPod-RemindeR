// import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  /*
 *If u want to see (in console after debugPrint) not all data (name, username, email...), but next:
flutter: AsyncData<List<User>>(value: [User(id: 1), User(id: 2), User(id: 3), User(id: 4), User(id: 5),...])
!  u need to create unnamed private constructor (const User._();)
! so then u can to create getter, setter or method in freezed class
*and comment out the "foundation.dart" package, because it create toString() automatically for ALL PARAMETERS (name, username, email ...),
* AND uncomment custom toString() method
* finally launch code generation
 */

  const factory User({
    required int id,
    required String name,
    required String username,
    required String email,
    required String phone,
    required String website,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  const User._();

  @override
  String toString() => 'User(id: $id)';

  //
}
