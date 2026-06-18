import 'package:latlong2/latlong.dart';

import 'box_type.dart';

class BirdBox {
  int? id;
  LatLng location;
  String locationDescription;
  BoxType boxType;
  String boxState;

  BirdBox({
    this.id,
    required this.location,
    required this.boxType,
    required this.locationDescription,
    required this.boxState,
  });

  static final BirdBox birdBox1 = BirdBox(
    id: 1,
    location: LatLng(51.4751350, -2.6099130),
    boxType: BoxType.seville,
    locationDescription:
        'Approaching from St Oswald’s Rd, this box is the first box encountered in the woodland running parallel to Coldharbour Rd. It is in a sycamore tree about 6 metres above the litter bin that’s towards the end of the path.',
    boxState: 'A partly formed nest was found in 2021 and a full nest in 2022.',
  );
  static final BirdBox birdBox2 = BirdBox(
    id: 2,
    location: LatLng(51.4752550, -2.6096700),
    boxType: BoxType.alicanteOpen,
    locationDescription:
        'Approaching from St Oswald’s Rd, this oval box is the second box encountered in the woodland running parallel to Coldharbour Rd. It is in a sycamore tree which is about 7 metres above the end of the St Oswald’s Road path.',
    boxState:
        'A part nest was found in 2021. In 2021 no nest was found so the front was swapped with number 6 to an open front.',
  );
  static final BirdBox birdBox3 = BirdBox(
    id: 3,
    location: LatLng(51.4754010, -2.6095980),
    boxType: BoxType.seville,
    locationDescription:
        'Approaching from St Oswald’s Rd, this box is the third box encountered in the woodland running parallel to Coldharbour Rd. It is about high up in the woodland hill 3 metres below the garages, not visible outside the woodland, and about 20 metres towards Cossins Rd from box 2.',
    boxState:
        'No nest was found in 2021 or 2022 so we shall consider moving this box.',
  );
  static final BirdBox birdBox4 = BirdBox(
    id: 4,
    location: LatLng(51.4753810, -2.6095150),
    boxType: BoxType.seville,
    locationDescription:
        'Approaching from St Oswald’s Rd, this box is the fourth box encountered in the woodland running parallel to Coldharbour Rd. It is in a sycamore tree high up in the woodland, 7 metres below the garages, 3-4 metres from box 3, and about 20 metres from box 2. It is not visible outside the woodland.',
    boxState: 'Fully formed nests were found in both 2021 and 2022.',
  );
  static final BirdBox birdBox5 = BirdBox(
    id: 5,
    location: LatLng(51.4755210, -2.6094810),
    boxType: BoxType.alicanteOpen,
    locationDescription:
        'Approaching from St Oswald’s Rd, this is the fifth box encountered in the woodland running parallel to Coldharbour Rd. It is in an ivy-covered cherry tree high up in the woodland, 7 metres below the garages and about 10 metres from boxes 3 and 4 going towards Cossins Rd. It is not visible outside the woodland.',
    boxState:
        'No nest was found in 2021 or 2022 so we shall consider moving this box.',
  );
  static final BirdBox birdBox6 = BirdBox(
    id: 6,
    location: LatLng(51.4748, -2.609345),
    boxType: BoxType.alicante,
    locationDescription:
        'This box is located high on the trunk of a maple tree, the left of two trees near to the memorial stone to Philippa Harradine, behind the St Oswald’s Road properties.',
    boxState:
        'No nest was found in 2021 or 2022 so we swapped the front from an open fronted.',
  );
  static final BirdBox birdBox7 = BirdBox(
    id: 7,
    location: LatLng(51.4754220, -2.6090510),
    boxType: BoxType.alicante,
    locationDescription:
        'This box is located in the ash tree opposite 6 Cossins Road.',
    boxState:
        'No nest was found in 2021 or 2022 so we shall consider moving this box.',
  );
  static final BirdBox birdBox8 = BirdBox(
    id: 8,
    location: LatLng(51.4752940, -2.6089000),
    boxType: BoxType.seville,
    locationDescription:
        'This box is located in the ash tree opposite 8 Cossins Road',
    boxState:
        'Fully formed nests were found in both 2021 and 2022. In 2021 this was identified as a great tit nest.',
  );
  static final BirdBox birdBox9 = BirdBox(
    id: 9,
    location: LatLng(51.4749720, -2.6084250),
    boxType: BoxType.alicante,
    locationDescription:
        'This box is located in the Norway maple below the steps from Cossins Road',
    boxState: 'A part formed nest was found in 2021 but nothing in 2022.',
  );
  static final BirdBox birdBox10 = BirdBox(
    id: 10,
    location: LatLng(51.474508, -2.608220),
    boxType: BoxType.alicanteOpen,
    locationDescription:
        "This box is located in the veteran ash tree on the boundary of the green and a St Oswald’s Road property. It is hidden behind the leaves of an elder tree and very difficult to see.",
    boxState:
        'No nest was found in 2021 or 2022 so we shall consider moving this box.',
  );
  static final BirdBox birdBox11 = BirdBox(
    id: 11,
    location: LatLng(51.4742220, -2.6069800),
    boxType: BoxType.alicante,
    locationDescription:
        'This box is located in the oak tree beside the steep hill of the cycle/pedestrian path running through the green, opposite the Dell.',
    boxState:
        'Fully formed nests were found in both 2021 and 2022. In 2021 this was identified as a blue tit nest.',
  );
  static final BirdBox birdBox12 = BirdBox(
    id: 12,
    location: LatLng(51.4745460, -2.6069240),
    boxType: BoxType.alicanteOpen,
    locationDescription:
        'This box is located amongst ivy in the large field maple tree near the Metford Road allotment fence, about 10 metres below the lower path which runs through the green.',
    boxState:
        'No nest was found in 2021 or 2022 so we shall consider moving this box.',
  );
  static final BirdBox birdBox13 = BirdBox(
    id: 13,
    location: LatLng(51.4745780, -2.6066050),
    boxType: BoxType.seville,
    locationDescription:
        'This box is located in a young beech tree in the Dell, near to the Metford Road allotment fence, and about 20 metres below the lower path in the green.',
    boxState: 'Fully formed nests were found in both 2021 and 2022.',
  );
  static final BirdBox birdBox14 = BirdBox(
    id: 14,
    location: LatLng(51.4743460, -2.6065850),
    boxType: BoxType.seville,
    locationDescription:
        'This box is located in the Dell, in the oak tree nearest to the lower of the two paths running through the green.',
    boxState: 'Fully formed nests were found in both 2021 and 2022.',
  );
  static final BirdBox birdBox15 = BirdBox(
    id: 15,
    location: LatLng(51.4733320, -2.6067980),
    boxType: BoxType.seville,
    locationDescription:
        'This box is located in a sycamore tree, which is the first tree to the right of the triangle of grass next to the tennis courts and opposite the bowls club.',
    boxState:
        'Fully formed nests were found in both 2021 and 2022. In 2021 this was identified as a great tit nest.',
  );
  static final BirdBox birdBox16 = BirdBox(
    id: 16,
    location: LatLng(51.4734230, -2.6061690),
    boxType: BoxType.seville,
    locationDescription:
        'This box is located in the second tree from the playground, opposite its main gate, and close to the bowls club fence.',
    boxState:
        'Fully formed nests were found in both 2021 and 2022. In 2021 this was identified as a blue tit nest.',
  );

  static final BirdBox birdBox17 = BirdBox(
    id: 17,
    location: LatLng(51.4753710, -2.6096643),
    boxType: BoxType.estrella,
    locationDescription:
        'Mounted on the west end of the garage wall  in the woodland running parallel to Coldharbour Rd',
    boxState: 'This nest was newly installed in 2022',
  );

  static final BirdBox birdBox18 = BirdBox(
    id: 18,
    location: LatLng(51.4748640, -2.6077580),
    boxType: BoxType.salamanca28,
    locationDescription:
        'Located in the sycamore tree near to the base of the steps to Metford Road, just inside Metford Road allotments.',
    boxState: 'This nest was newly installed in 2022',
  );

  static final BirdBox birdBox19 = BirdBox(
    id: 19,
    location: LatLng(51.4746510, -2.6074330),
    boxType: BoxType.salamanca32,
    locationDescription:
        'Located in the sycamore tree next to (left of) the Dell entrance to Metford Road allotments, just inside the allotments.',
    boxState: 'This nest was newly installed in 2022',
  );

  static final BirdBox birdBox20 = BirdBox(
    id: 20,
    location: LatLng(51.4728130, -2.6065090),
    boxType: BoxType.starling,
    locationDescription:
        'Located in the plane tree opposite the entrance to the bowling club. Much larger than any of the other boxes in the Green.',
    boxState: 'This nest was newly installed in 2022',
  );

  static final List<BirdBox> birdBoxesList = [
    birdBox1,
    birdBox2,
    birdBox3,
    birdBox4,
    birdBox5,
    birdBox6,
    birdBox7,
    birdBox8,
    birdBox9,
    birdBox10,
    birdBox11,
    birdBox12,
    birdBox13,
    birdBox14,
    birdBox15,
    birdBox16,
    birdBox17,
    birdBox18,
    birdBox19,
    birdBox20,
  ];
}
