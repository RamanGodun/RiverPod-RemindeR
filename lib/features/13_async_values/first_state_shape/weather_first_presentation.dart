import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/domain/config/extensions/async_value_xx.dart';
import 'package:riverpod_reminder/core/domain/utils_and_services/dialogs_service.dart';
import '../../../core/domain/models/enums.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
import 'weather_first_provider.dart';

int _selectedCityIndex = 1;

class WeatherFirstPage extends ConsumerWidget {
  const WeatherFirstPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<String>>(weatherFirstProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        DialogService.showAlertErrorDialog(context, next.error.toString());
      }
    });

    final weather = ref.watch(weatherFirstProvider);

    print(weather.toString);
    print(weather.props);

    try {
      print('value: ${weather.value}');
    } catch (e) {
      print(e.toString());
    }

    print('valueOrNull: ${weather.valueOrNull}');

    try {
      print('requireValue: ${weather.requireValue}');
    } on StateError {
      print('StateError');
    } catch (e) {
      print(e.toString());
    }

    print('===========');

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          'AsyncValue Details - First',
          TextType.titleSmall,
        ),
        actions: [
          IconButton(
            onPressed: () {
              _selectedCityIndex = 1;
              ref.invalidate(weatherFirstProvider);
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: weather.when(
          skipError:
              true, //this allows to show on device previously got data, when we have 2 or more errors,
          // in another case during second error we have previous error
          skipLoadingOnRefresh: false,
          data: (temp) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(temp, TextType.headlineSmall),
                const SizedBox(height: 20),
                const GetWeatherButton(),
              ],
            );
          },
          error:
              (e, st) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppMiniWidgets(MWType.error, error: e.toString()),
                  const SizedBox(height: 20),
                  const GetWeatherButton(),
                ],
              ),
          loading: () => const AppMiniWidgets(MWType.loading),
        ),
      ),
    );
  }
}

class GetWeatherButton extends ConsumerWidget {
  const GetWeatherButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
      onPressed: () {
        final cityIndex = _selectedCityIndex % 4;
        final city = Cities.values[cityIndex];

        _selectedCityIndex++;
        ref.read(weatherFirstProvider.notifier).getTemperature(city);
      },
      child: const Text('Get Weather'),
    );
  }
}
