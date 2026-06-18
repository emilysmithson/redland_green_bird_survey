import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showInstructions(BuildContext context) async {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("How to take a bird box observation:"),
        actions: <Widget>[
          TextButton(
            child: const Text('Don\'t show this again'),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              if (!context.mounted) {
                return;
              }
              prefs.setBool('showModal', false);
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Text(
                "1. Stand quietly, close enough to be able to identify the bird, but not so close as to disturb them. Use binoculars if you have them."
                "\n\n2. Watch the box until you see a bird entering or leaving the box, or for at least 5 minutes."
                "\n\n3. Provide observations for as many or as few boxes as you wish, and if possible, repeat the observation over as many days as you can.",
              ),
              Text(
                '\n\nFrequently Asked Questions',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                '\nI didn’t see any activity at all. Should I log this?',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const Text(
                "Absolutely! If you have watched a box for at least five minutes, and have not seen any birds entering or leaving the nest, or any activity near to the nest, this is still a valuable record, as it tells us which boxes might not be used at that time. It helps us to decide if we should move the box to a different location. Please submit such findings!",
              ),
              Text(
                '\nWhen is the best time of year to spot birds nesting?',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const Text(
                "Birds nest in the spring and summer, so these months are the best times to record activity."
                " Some birds, such as wrens, might also use nest boxes as winter night-time roosts – you need to be around at dawn or dusk to see any evidence of this! You could also use this app to report winter roosts.",
              ),
              Text(
                '\nHow long should I wait at each box?',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const Text(
                "When birds are feeding young, you are more likely to see activity at the nest fairly quickly. "
                "If you are taking an observation before the young have hatched, "
                "it may take longer to see if the nest is being used, so wait quietly for at least 5 minutes "
                'before recording \'no bird seen at box.\'',
              ),
              Text(
                '\nI entered a comment but it did not show up in my observation. Why?',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const Text(
                "We do monitor the comments but we do not publish them to the public in order to safeguard against anything inappropriate."
                " Rest assured that your comments will be read by the Redland Green Community Group. ",
              ),
              Text(
                '\nI made a mistake. What should I do?',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const Text(
                "Don't panic! Simply go back to the home page and tap on 'My Details'. "
                "You can see, edit or delete any of your observations there.",
              ),
            ],
          ),
        ),
      );
    },
  );
}
