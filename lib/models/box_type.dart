class BoxType {
  String name;
  String description;

  String image;
  BoxType(this.name, this.description, this.image);
  static final BoxType seville = BoxType(
    'Seville',
    'This 28mm hole nest box is suitable for pied flycatchers, blue tits, coal tits and great tits.',
    'assets/bird_boxes/seville.jpg',
  );
  static final BoxType alicante = BoxType(
    'Alicante',
    'This 32mm hole nest box is suitable for great tits, pied flycatchers and house sparrows.',
    'assets/bird_boxes/alicante.jpg',
  );
  static final BoxType alicanteOpen = BoxType(
    'Alicante Open Fronted',
    'This open nest box is suitable for robins and wrens (if well hidden), pied wagtails, song thrushes and blackbirds.',
    'assets/bird_boxes/alicante_open.jpg',
  );
  static final BoxType estrella = BoxType(
    'Estrella House Sparrow Nest Box',
    'House Sparrows prefer to nest in groups or colonies, so this nest box has been designed with 2 chambers to allow them to breed in close proximity.',
    'assets/bird_boxes/estrella.jpeg',
  );
  static final BoxType starling = BoxType(
    'Starling',
    'This 45mm hole nest box will be used by Starlings and can help support your local population of this red list species.',
    'assets/bird_boxes/starling.jpeg',
  );
  static final BoxType salamanca28 = BoxType(
    'Salamanca 28mm Nest Box',
    'This nest box has been designed in conjunction with birding experts across Europe where during research studies, the black fronts are often used for numbering boxes with chalk. This box has an integrated loop which means the box can be freely suspended rather than mounted to a wall or tree. 28mm hole nest boxes will be used by Tree Sparrows, Blue Tits, Coal Tits and Great Tits.',
    'assets/bird_boxes/salamanca28.jpeg',
  );
  static final BoxType salamanca32 = BoxType(
    'Salamanca 32mm Nest Box',
    'This nest box has been designed in conjunction with birding experts across Europe where during research studies, the black fronts are often used for numbering boxes with chalk. This box has an integrated loop which means the box can be freely suspended rather than mounted to a wall or tree. 32mm hole nest boxes will be used by Great Tits, Pied Flycatchers, Tree Sparrows and House Sparrows.',
    'assets/bird_boxes/salamanca32.jpeg',
  );
  static const String generalBirdBoxDescription =
      'These nest boxes are manufactured from WoodStone which is a mix of '
      'concrete and FSC certified wood fibres. Unlike a traditional wooden nest box, '
      'these boxes will not rot away or deteriorate and are guaranteed for 10 years. '
      '\n\nThis robust material safeguards against attacks from predators such as woodpeckers, '
      'cats and squirrels, whilst also providing a well insulated interior with a more '
      'consistent internal temperature than an ordinary wooden box. \n\nThis is especially '
      'important during the breeding season and ensures that young birds have a greater '
      'chance of survival. Nesting sites have become rare for cavity nesting birds as the result of '
      'changed woodland management practices, which have resulted in fewer ancient trees. '
      'Nest boxes provide a much needed alternative both for breeding birds and for birds which use them as winter roosting sites.'
      '\n\nThese boxes were purchased thanks to a generous grant from the Redland and Cotham Amenities Society (RCAS).';
}
