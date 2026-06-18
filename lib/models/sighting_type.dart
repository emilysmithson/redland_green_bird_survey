class SightingType {
  int id;
  String description;
  SightingType(this.id, this.description);
  static final sightingType0 = SightingType(0, 'No bird seen at the box.');

  static final sightingType1 = SightingType(
    1,
    'Bird seen flying in or out of box.',
  );
  static final sightingType2 = SightingType(
    2,
    'Bird seen near box but didn\'t go in.',
  );
  static final sightingType3 = SightingType(
    3,
    'Predator at or near box (eg magpie, crow, jay, woodpecker, squirrel or cat).',
  );

  static final List<SightingType> sightingsTypeList = [
    sightingType0,
    sightingType1,
    sightingType2,
    sightingType3,
  ];
}
