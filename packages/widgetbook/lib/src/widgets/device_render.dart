import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook/src/localization/localization.dart';
import 'package:widgetbook/src/models/organizers/organizers.dart';
import 'package:widgetbook/src/widgets/renderer.dart';
import 'package:widgetbook/src/workbench/workbench_provider.dart';

class DeviceRender<CustomTheme> extends ConsumerWidget {
  const DeviceRender({
    Key? key,
    required this.story,
  }) : super(key: key);

  final WidgetbookUseCase story;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = context.watch<WorkbenchProvider<CustomTheme>>().state;
    final localizationState = ref.watch(localizationProvider);
    return Renderer(
      device: state.device!,
      locale: state.locale!,
      localizationsDelegates: localizationState.localizationsDelegates,
      theme: state.theme!.data,
      renderMode: state.renderMode,
      useCaseBuilder: story.builder,
    );
  }
}
