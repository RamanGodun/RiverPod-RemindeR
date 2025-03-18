import 'package:flutter/material.dart';
import 'package:bulleted_list/bulleted_list.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/models/activity.dart';

// Widget to display the details of a single activity.
// This widget formats and presents the activity data in a bulleted list.
class ActivityWidget extends StatelessWidget {
  final Activity activity;

  const ActivityWidget({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      children: [
        // Display the type of the activity in a headline style.
        TextWidget(activity.type, TextType.headlineSmall),
        const Divider(),
        // Display detailed information about the activity using a bulleted list.
        BulletedList(
          bullet: const Icon(Icons.check, color: Colors.green),
          listItems: [
            'activity: ${activity.activity}',
            'availability: ${activity.availability}',
            'participants: ${activity.participants}',
            'price: ${activity.price}',
            'accessibility: ${activity.accessibility}',
            'duration: ${activity.duration}',
            'link: ${activity.link.isEmpty ? 'no link' : activity.link}',
            'kidFriendly: ${activity.kidFriendly}',
            'key: ${activity.key}',
          ],
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
