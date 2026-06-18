class FurtherDetailsOptions {
  int id;
  String description;

  FurtherDetailsOptions.beakOptions(this.id, this.description);

  static final furtherDetailType1 = FurtherDetailsOptions.beakOptions(
    1,
    'The bird had nesting material in its beak.',
  );
  static final furtherDetailType2 = FurtherDetailsOptions.beakOptions(
    2,
    'The bird had food in its beak.',
  );
  static final furtherDetailType3 = FurtherDetailsOptions.beakOptions(
    3,
    'The bird had something in its beak; not sure what it was.',
  );
  static final furtherDetailType5 = FurtherDetailsOptions.beakOptions(
    5,
    'The bird had an empty beak.',
  );

  static final List<FurtherDetailsOptions> furtherDetailsOptionsList = [
    furtherDetailType1,
    furtherDetailType2,
    furtherDetailType3,
    furtherDetailType5,
  ];
}
