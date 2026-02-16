import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopsbase/core/extensions/extensions.dart';
import 'package:loopsbase/shared/widgets/dividers.dart';

import '../../core/app_controller/app_controller_cubit.dart';
import '../design_layouts.dart';

Future<double?> showFontScaler(
  BuildContext context, {
  ValueChanged<double>? onChanged,
  ValueChanged<double>? onSubmit,
  bool showTitleSample = true,
  bool showSubtitleSample = true,
  bool showNormalSample = true,
}) async {
  return showModalBottomSheet<double>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    useSafeArea: true,
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.40,
        maxChildSize: 0.75,
        minChildSize: 0.3,
        snap: true,
        builder: (context, scrollController) {
          return FontScaler(
            scrollController: scrollController,
            onChanged: onChanged,
            onSubmit: onSubmit,
            showTitleSample: showTitleSample,
            showSubtitleSample: showSubtitleSample,
            showNormalSample: showNormalSample,
          );
        },
      );
    },
  );
}

class FontScaler extends StatefulWidget {
  const FontScaler({
    this.scrollController,
    this.onChanged,
    this.onSubmit,
    this.showTitleSample = true,
    this.showSubtitleSample = true,
    this.showNormalSample = true,
    super.key,
  });

  final ScrollController? scrollController;
  final ValueChanged<double>? onChanged, onSubmit;
  final bool showTitleSample, showSubtitleSample, showNormalSample;
  static bool isOpen = false;

  @override
  State<FontScaler> createState() => _FontScalerState();
}

class _FontScalerState extends State<FontScaler> {
  double value = 1;

  @override
  void initState() {
    super.initState();
    FontScaler.isOpen = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(
          () => value = context.read<AppControllerCubit>().state.fontScale,
        );
      }
    });
  }

  void setToDefault() => setState(() => value = 1);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SingleChildScrollView(
      controller: widget.scrollController,
      padding: DL.pagePadding,
      child: PopScope(
        onPopInvokedWithResult: (_, _) {
          FontScaler.isOpen = false;
        },
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            spacing: 10,
            children: [
              if (widget.showTitleSample)
                Text(
                  l10n.headingFontSize,
                  textScaler: TextScaler.linear(value),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              if (widget.showSubtitleSample)
                Text(
                  l10n.subheadingFontSize,
                  textScaler: TextScaler.linear(value),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              if (widget.showNormalSample)
                Text(l10n.normalFontSize, textScaler: TextScaler.linear(value)),
              const LiteDivider(),
              Row(
                spacing: 2.5,
                children: [
                  IconButton(
                    onPressed: setToDefault,
                    tooltip: l10n.theDefault,
                    icon: const Icon(Icons.settings_backup_restore_rounded),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const .all(10),
                      child: Slider(
                        value: value,
                        min: 0.25,
                        max: 3,
                        onChanged: (v) {
                          setState(() => value = v);
                          widget.onChanged?.call(value);
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (widget.onSubmit != null) {
                        widget.onSubmit?.call(value);
                      } else {
                        context.read<AppControllerCubit>().changeFontScale(
                          value,
                        );
                      }
                      // Navigator.of(context).pop(value);
                    },
                    tooltip: l10n.apply,
                    icon: const Icon(Icons.task_alt_rounded),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
