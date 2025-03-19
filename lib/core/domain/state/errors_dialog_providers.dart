import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/enum_activity_state.dart';
import '../models/enums.dart';
import '../utils_and_services/dialogs_service.dart';
import '../../../features/5_notifier_provider/domain/providers/enum_based_state/enum_activity_provider.dart';

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
