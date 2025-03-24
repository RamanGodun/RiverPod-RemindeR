import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/ui/widgets/text_widget.dart';

part 'provider_parameters.g.dart';

class NoEqual {
  final int counter;
  NoEqual({required this.counter});
}

class NoEqualConst {
  final int counter;
  const NoEqualConst({required this.counter});
}

class Equal extends Equatable {
  final int counter;
  const Equal({required this.counter});

  @override
  List<Object?> get props => [counter];
}

@riverpod
class CounterNoEqual extends _$CounterNoEqual {
  @override
  int build(NoEqual counter) {
    return counter.counter;
  }

  void increment() => state++;
}

@riverpod
class CounterNoEqualConst extends _$CounterNoEqualConst {
  @override
  int build(NoEqualConst counter) {
    return counter.counter;
  }

  void increment() => state++;
}

@riverpod
class CounterEqual extends _$CounterEqual {
  @override
  int build(Equal counter) {
    return counter.counter;
  }

  void increment() => state++;
}

class ProviderParameters extends ConsumerWidget {
  const ProviderParameters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint(counterNoEqualProvider(NoEqual(counter: 0)).hashCode.toString());
    debugPrint(counterNoEqualProvider(NoEqual(counter: 0)).hashCode.toString());
    debugPrint(
      counterNoEqualConstProvider(
        const NoEqualConst(counter: 10),
      ).hashCode.toString(),
    );
    debugPrint(
      counterNoEqualConstProvider(
        const NoEqualConst(counter: 10),
      ).hashCode.toString(),
    );
    debugPrint(
      counterEqualProvider(const Equal(counter: 100)).hashCode.toString(),
    );
    debugPrint(
      counterEqualProvider(const Equal(counter: 100)).hashCode.toString(),
    );

    final counterNoEqual =
    // ignore: provider_parameters
    ref.watch(counterNoEqualProvider(NoEqual(counter: 0)));
    final counterNoEqualConst = ref.watch(
      counterNoEqualConstProvider(const NoEqualConst(counter: 10)),
    );
    final counterEqual = ref.watch(
      counterEqualProvider(const Equal(counter: 100)),
    );
    final probablyCached = NoEqual(counter: 1000);
    final probablyCachedNoEqual = ref.watch(
      counterNoEqualProvider(probablyCached),
    );
    // ignore: prefer_const_constructors
    final probablyCached2 = Equal(counter: 10000);
    final probablyCached2Equal = ref.watch(
      counterEqualProvider(probablyCached2),
    );

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Provider Parameters', TextType.titleMedium),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget('$counterNoEqual', TextType.titleMedium),
            TextWidget('$counterNoEqualConst', TextType.titleMedium),
            TextWidget('$counterEqual', TextType.titleMedium),
            TextWidget('$probablyCachedNoEqual', TextType.titleMedium),
            TextWidget('$probablyCached2Equal', TextType.titleMedium),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              // ignore: provider_parameters
              .read(counterNoEqualProvider(NoEqual(counter: 0)).notifier)
              .increment();
          ref
              .read(
                counterNoEqualConstProvider(
                  const NoEqualConst(counter: 10),
                ).notifier,
              )
              .increment();
          ref
              .read(counterEqualProvider(const Equal(counter: 100)).notifier)
              .increment();
          ref.read(counterNoEqualProvider(probablyCached).notifier).increment();
          ref.read(counterEqualProvider(probablyCached2).notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
