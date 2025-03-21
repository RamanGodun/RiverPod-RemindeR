import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../features/6_notifier_provider_bp/domain/activity_provider_on_enum_based_ss/enum_activity_state.dart';
import '../../models/enums.dart';
import '../../utils_and_services/dialogs_service.dart';
import '../../../../features/6_notifier_provider_bp/domain/activity_provider_on_enum_based_ss/enum_activity_provider.dart';

final errorsHandlingProvider4EnumActivityState =
    Provider.autoDispose<ErrorHandlingService>((ref) {
      return ErrorHandlingService();
    });

class ErrorHandlingService {
  void listenForFailures(WidgetRef ref, BuildContext context) {
    ref.listen<EnumActivityState>(enumActivityProvider, (previous, next) {
      if (next.status == ActivityStatus.failure && context.mounted) {
        DialogService.showAlertErrorDialog(context, next.error);
      }
    });
  }
}
