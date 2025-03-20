import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/domain/state/sh_prefs/shared_pref_provider.dart';

class SyncProvider4AsyncAPI extends StatelessWidget {
  const SyncProvider4AsyncAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Other')),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final preferences = ref.watch(sharedPreferencesProvider);
            final val = preferences.getInt('counter');

            return Text('$val', style: const TextStyle(fontSize: 52));
          },
        ),
      ),
    );
  }
}
