import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Confirms the user intends to open an external URL (e.g. browser).
/// Shows a simple check with cancel and continue actions.
Future<void> showLeaveAppDialogAndLaunchUrl(
  BuildContext context,
  String url,
) async {
  if (!context.mounted) return;
  await showDialog<void>(
    context: context,
    builder: (BuildContext dialogContext) {
      return _LeaveAppDialog(url: url);
    },
  );
}

class _LeaveAppDialog extends StatefulWidget {
  const _LeaveAppDialog({required this.url});

  final String url;

  @override
  State<_LeaveAppDialog> createState() => _LeaveAppDialogState();
}

class _LeaveAppDialogState extends State<_LeaveAppDialog> {
  late final TextEditingController _answerController;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _answerController = TextEditingController();
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  Future<void> _onContinue() async {
    final answer = _answerController.text.trim();
    if (answer != '29') {
      setState(() {
        _errorText = 'That is not the right answer. Try again, or tap Cancel.';
      });
      return;
    }

    final uri = Uri.parse(widget.url);
    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        debugPrint('Could not launch url: ${widget.url}');
        if (!mounted) return;
        setState(() {
          _errorText = 'Could not open that link on this device.';
        });
        return;
      }
    } on Object catch (e) {
      debugPrint('Failed to open external url: ${e.toString()}');
      if (!mounted) return;
      setState(() {
        _errorText = 'Could not open that link on this device.';
      });
      return;
    }

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(8);

    return AlertDialog(
      title: const Text('Did you mean to leave the app?'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'You are about to open a link outside this app. '
              'Answer the question below to continue.',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'What is 12 + 17?',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _answerController,
              keyboardType: TextInputType.number,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Your answer',
                errorText: _errorText,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                border: OutlineInputBorder(borderRadius: borderRadius),
                enabledBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(color: theme.colorScheme.outline),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(
                    color: theme.colorScheme.primary,
                    width: 2,
                  ),
                ),
              ),
              onChanged: (_) {
                if (_errorText != null) {
                  setState(() => _errorText = null);
                }
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: Colors.green[100],
            foregroundColor: Colors.white,
          ),
          onPressed: _onContinue,
          child: const Text('Continue'),
        ),
      ],
    );
  }
}
