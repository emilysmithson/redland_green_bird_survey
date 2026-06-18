enum BirdType { nesting, predator, other }

class Photographer {
  String firstName;
  String lastName;
  Photographer(this.firstName, this.lastName);
}

Photographer giorgio = Photographer('Giorgio', 'Pede');
Photographer keith = Photographer('Keith', 'Williams');

class Photo {
  String asset;
  Photographer photographer;
  Photo(this.asset, this.photographer);
}

class Bird {
  String? name;
  String? scientificName;
  String? birdFamily;
  String? conservationStatus;
  String? description;
  List<Photo>? images;
  BirdType? birdType;
  int? id;

  Bird({
    this.name,
    this.description,
    this.images,
    this.scientificName,
    this.birdFamily,
    this.conservationStatus,
    this.birdType,
    this.id,
  });

  static final Bird none = Bird(
    name: 'No bird seen',
    description: '',
    images: [],
    id: 0,
  );
  static final Bird other = Bird(
    name: 'Other',
    description: '',
    images: [],
    id: 1,
  );
  static final Bird unidentified = Bird(
    name: 'Unidentified',
    description: '',
    images: [],
    id: 2,
  );

  static final Bird robin = Bird(
    name: 'Robin',
    description:
        "The robin’s red breast, beautiful song and inquisitive behaviour make it one of the UK’s favourite birds. \n\nMales and females have the same appearance, and sing for most of the year in order to protect their territories, only ceasing to sing briefly in late summer, when they are moulting. They are extremely territorial and don’t tolerate intruders to their territories. They will also sing at night near street lights.\n\nJuveniles have speckled golden brown breasts, and gain their red breasts after their first moult. Each robin has a unique breast pattern.\n\nAbout 14cm long and 14-21g in weight, robins eat insects and invertebrates, worms, seeds and fruit. Robins and dunnocks have similar diets. In winter, when food is scarce, this results in competition between them. The robin will therefore often chase the dunnock out of its territory. \n\nRobins can have up to three, and maybe even four broods in a year, but each time they build a new nest, and so they will probably only use a nest box once in the same year. They are most likely to use an open-fronted nest box.\n\nIt’s estimated there are over 6.7 million breeding territories in the UK.",
    images: [
      Photo('assets/robin_close.png', giorgio),
      Photo('assets/robin1.png', giorgio),
      Photo('assets/robin.png', giorgio),
      Photo('assets/robin_2.png', giorgio),
    ],
    conservationStatus: 'Green',
    scientificName: 'Erithacus rubecula',
    birdFamily: 'Muscicapidae (Old World flycatchers & chats)',
    birdType: BirdType.nesting,
    id: 3,
  );
  static final Bird greatTit = Bird(
    name: 'Great Tit',
    description:
        "At 14cm long and weighing 18g, the great tit is the largest of the UK’s eight tit species. Males and females are alike, with blue-grey wings and green backs. They have white cheeks and glossy black heads. The black continues as a thick stripe down the centre of their yellow chests and abdomen. The male’s stripe is thicker than the female’s, whose stripe is often discontinuous. The thicker the male’s stripe, the more attractive he is to the female as it indicates how good a father the bird will be.\n\nGreat tits eat insects, caterpillars, seeds and nuts. Like other tits, they prefer not to be out in the open for long: they are a woodland bird, but have readily moved into the gardens of built-up areas and have become familiar visitors to bird feeders. \n\nThe great tit has up to 40 types of calls and songs. The “teacher, teacher” call, used to assert a territory, is one of the most familiar. The female rarely calls. Individual males with large repertoires of songs and calls are more dominant birds, and also more successful breeders.\n\nNests are made from moss and grass, and lined with hair and feathers. Great tits will also readily use nest boxes. A clutch can be up to 15 eggs. Eggs, laid in April or May, are incubated by the female for about 2 weeks. Both parents feed the young after fledging. Occasionally great tits will have a second brood in the breeding season. Nests may sometimes contain blue tit eggs. It’s thought this might be because the great tit evicted a blue tit from a good nesting site, or perhaps it could be that a blue tit without a nest of its own has managed to lay eggs there. \n\nThere are estimated to be around 2.5 million breeding territories in the UK.",
    images: [
      Photo('assets/greattit3.png', giorgio),
      Photo('assets/greattit2.png', giorgio),
      Photo('assets/greattit1.png', giorgio),
    ],
    scientificName: 'Parus major',
    conservationStatus: 'Green',
    birdFamily: 'Paridae (tits)',
    birdType: BirdType.nesting,
    id: 4,
  );
  static final Bird blueTit = Bird(
    name: 'Blue Tit',
    description:
        "Blue tits are among the most frequent visitors to our bird feeders and are also quite gregarious, visiting feeders in small groups. They eat insects, spiders, caterpillars, seeds and nuts. They are 12cm in length and 11g in weight – up to half the weight of robins. \n\nMales and females are striking birds, with their colourful mix of blue, yellow, white and green feathers. The blue cap on their head can be raised into a little crest. \n\nBlue tits are notable for their acrobatic skills, often hanging upside down while searching for food. \n\nLike all tits, blue tits usually nest in tree holes. They start prospecting for a place to nest as early as January. The female makes the nest from moss, grass, leaves, hair and spiders’ webs, lining them with feathers, fur or wool. Up to 16 eggs are usually laid from mid-April. The female incubates the eggs alone for 12-15 days, and the male brings her food. Both parents feed the young after fledging. A pair usually has only one brood in the year, but if food is plentiful, they may have a second brood. Sometimes, great tit eggs are found in blue tit nests.\n\nThe breeding population of the UK is around 3.5 million breeding territories, and the number of birds may increase to 15 million birds with over-wintering European blue tits. Blue tit numbers have been increasing in recent years, and this may be the result of bird boxes and feeders, to which they have readily adapted. Blue tits are probably the most common bird found in nest boxes.",
    images: [
      Photo('assets/bluetit1.png', giorgio),
      Photo('assets/bluetit3.png', giorgio),
      Photo('assets/bluetit.jpg', giorgio),
      Photo('assets/bluetit4.png', giorgio),
      Photo('assets/bluetit5.png', giorgio),
    ],
    scientificName: 'Cyanistes caeruleus',
    conservationStatus: 'Green',
    birdFamily: 'Paridae (tits)',
    birdType: BirdType.nesting,
    id: 5,
  );
  static final Bird blackbird = Bird(
    name: 'Blackbird',
    description:
        "One of the most populous birds in the UK, the blackbird is just as at home in a town park, a suburban garden, or woodland. They eat worms, insects, berries and fruit, and can often be seen on lawns with their heads tilted to one side as they listen for earthworms.\n\nThe blackbird has a beautiful rich song, which is part learned and part improvised. Typically, they like to sing after rain, and sometimes sing at night, particularly if they are near street lights.\n\nMales are black with an orange-yellow beak and eye ring, while females are dark brown, often with paler streaks and spots on their breasts. The birds are 24-25cm in length and weigh between 80-100g. \n\nBlackbirds rear 2-3 broods a season, and may attempt a fourth brood in a good year. The same nest, made of plant material lined with mud and grass, is sometimes used for successive broods. A clutch is normally 3-5 eggs, and is incubated by the female. Hatching takes place 13-14 days after laying. Only the female broods the chicks, but both parents feed them.\n\nIt’s estimated there are over 5 million breeding pairs in the UK. In the autumn months, blackbird numbers are swelled by migrant blackbirds from Scandinavia and continental Europe. Some stay here for the winter; others continue further south.",
    images: [
      Photo('assets/blackbird4.png', giorgio),
      Photo('assets/blackbird1.png', giorgio),
      Photo('assets/blackbird2.png', giorgio),
      Photo('assets/blackbird3.png', giorgio),
    ],
    scientificName: 'Turdus merula',
    birdFamily: 'Turdidae (Thrushes)',
    conservationStatus: 'Green',
    birdType: BirdType.nesting,
    id: 6,
  );
  static final Bird songThrush = Bird(
    name: 'Song Thrush',
    description:
        "The song thrush is about 23cm in length and 65-100g in weight. Both sexes have a rich brown head, wings and back, and a creamy breast covered in dark brown spots. \n\nAs the bird’s name suggests, their song is rich and beautiful, with a series of repeated phrases. Some males have up to 100 different phrases, partly learned from parents and partly acquired through mimicry, and so each bird’s song is different. They start singing in late winter and continue through into June or July. They are also one of the earliest birds to start singing in the morning, perhaps starting at around 3am. They sing again at dusk, and like to sing on prominent branches high up in a tree.\n\nSong thrushes eat invertebrates, earthworms, soft fruit and berries. When the earth is too hard to enable them to extract worms, they also eat snails, using a stone “anvil” to crack open the shell. This is a behaviour well known in song thrushes. \n\nWhile song thrushes will take food that is put out for them, such as windfall apples and mealworms, they are timid birds, easily chased away by birds such as the blackbird.\n\nSong thrushes can have 2-3 broods a year, between March and August. They nest in trees and shrubs or among creepers on walls and often using the same nest for successive broods in the season. The nest, built by the female, is cup-shaped and, if in a tree, built close to the trunk. Nests are made of twigs, grass and moss, and are bonded together and lined with mud, dung, leaves and rotten wood. They can take three weeks to complete. \n\nThe female lays 3-5 eggs, at the rate of one per day. She starts to incubate after the last egg is laid, and broods until the chicks hatch after 13-15 days. Both parents feed the young. The chicks are ready to leave the nest at about 13-14 days old. Parents continue to feed the young birds until they can fend for themselves, about 3 weeks after fledging.\n\nIt’s thought there are about 1.2 million breeding territories in the UK, and the birds tend to stay in them the year round. The population declined more than 50% between 1970 and 1995, probably because of loss of habitat. More recently, there’s been a slight recovery in their numbers.",
    images: [
      Photo('assets/songthrush_close.png', giorgio),
      Photo('assets/songthrush.png', giorgio),
      Photo('assets/songthrush_2.png', giorgio),
    ],
    scientificName: 'Turdus philomelos',
    conservationStatus: 'Red',
    birdFamily: 'Turdidae (Thrushes)',
    birdType: BirdType.nesting,
    id: 7,
  );
  static final Bird nuthatch = Bird(
    name: 'Nuthatch',
    description:
        "The nuthatch is a stocky bird with a length of 14cm and weighing 20-25g. Males and females are alike, and have a long pointed bill and short tail. Their upper parts, including the head, are blue-grey, underside creamy-yellow and sides orange-brown. They have a black eye stripe and white cheeks. Their legs are short and yellowish-brown and the toes are powerful enough to grip trunks as they move up, down and around trees in search of food. \n\nTheir name derives from the term ‘nut hacker’, which describes the way in which they open up nuts, by wedging them into a crevice and hammering them with their strong bills. \n\nThey feed mainly on nuts and seeds (such as hazel nuts, acorns and beech mast in the autumn and winter) and insects in the summer. They have started to visit bird feeders in gardens, competing boldly with other birds, and often taking the food away to store.\n\nStoring food is one of the factors making nuthatches highly territorial throughout the year. They proclaim their territories using loud, simple calls, and are highly sedentary, seldom moving far from where they hatched.\n\nNuthatches nest in holes in trees or walls and particularly favour the old nest holes of great spotted woodpeckers. The best habitat for nuthatches is large, old oak trees. They may use nest boxes with a large hole of around 35mm diameter, and are likely to plaster its entrance with mud. Their nests are made from pieces of bark and dead leaves. They lay 4-13 eggs and may have a second clutch of eggs. Contrary to many other birds, their numbers have increased since the 1970s and their range has also expanded northwards, into Scotland. It’s not known why.\n\nIt’s estimated that there are around 220,000 territories, mostly in England and Wales.",
    images: [
      Photo('assets/nuthatch_close.png', giorgio),
      Photo('assets/nuthatch1.png', giorgio),
      Photo('assets/nuthatch2.png', giorgio),
      Photo('assets/nuthatch3.png', giorgio),
    ],
    birdFamily: 'Sittidae (nuthatches)',
    conservationStatus: 'Green',
    scientificName: 'Sitta europaea',
    birdType: BirdType.nesting,
    id: 8,
  );
  static final Bird dunnock = Bird(
    name: 'Dunnock',
    description:
        "Also known as a hedge sparrow, the dunnock is a small bird, about the size of a robin, "
        "that is a common sight in gardens, woodlands, hedgerows and parks."
        "\n\nThey are streaky brown and grey with a dark grey head and a thin bill."
        " \n\nMales and females will form strong pairs, but the female will still mate with another male, so neither male knows who the father is and both supply her chicks with food. "
        "\n\nThey nest in hedges or shrubs, laying up to five eggs.",
    images: [
      Photo('assets/dunnock1.png', giorgio),
      Photo('assets/dunnock3.png', giorgio),
      Photo('assets/dunnock2.png', giorgio),
    ],
    scientificName: 'Prunella modularis',
    conservationStatus: 'Amber',
    birdFamily: 'Prunellidae (accentors)',
    birdType: BirdType.other,
    id: 9,
  );
  static final Bird wren = Bird(
    name: 'Wren',
    description:
        "The wren is a tiny 9-10cm in length and 7-12g in weight, though it’s not the UK’s smallest bird. \n\nIt is dark barred brown on the upper side and a lighter barred brown on the underside, with a pale, creamy eyebrow. Its short tail is frequently held upwards and often flicked. \n\nThey eat spiders and insects and use their long thin bill to probe crevices. This characteristic is what their name, troglodites (=cave-dweller) refers to. \n\nThe wren is more often heard than seen: it has a very loud voice for such a small bird, and doesn’t venture out into the open very much. \n\nWrens are cavity nesters, and will use both open-fronted and tit nest boxes for both nesting and winter roosting. The nest is dome or globe shaped, and made from leaves, twigs, grass and moss, lined with feathers. Wrens lay 5-8 eggs and may have a second brood. \n\nThey are resident year round. Severe winters may cause high mortality, but numbers generally recover as their breeding rates are high.\n\nIt’s estimated that there are over 8.6 million breeding territories in the UK which makes it the UK’s most common breeding bird.",
    images: [
      Photo('assets/wren_close.png', giorgio),
      Photo('assets/wren3.png', giorgio),
      Photo('assets/wren.png', giorgio),
      Photo('assets/wren2.png', giorgio),
      Photo('assets/wren_4.png', giorgio),
      Photo('assets/wren5.png', giorgio),
    ],
    birdFamily: 'Troglodytidae (Wrens)',
    conservationStatus: 'Green',
    scientificName: 'Troglodytes troglodytes',
    birdType: BirdType.nesting,
    id: 10,
  );

  static final Bird starling = Bird(
    name: 'Starling',
    description:
        "Starlings are attractive birds, with breeding plumages of glossy iridescent purples, blues and greens, pinks and cream. Their plumage at other times of year is more muted, with brown feathers and white markings. At 21-22 cm in length, they are smaller than blackbirds, and have thin, yellow, medium length beaks and short tails. In the breeding season, males and females can be distinguished by their beaks: those of males have blue bases, and females, pink. \n\nIn flight their wings form a triangular shape. Their flight is fast and direct. They are noisy and very sociable birds, spending much of the year in flocks. \n\nWhile they are still regarded as a common garden bird, their numbers have declined sharply elsewhere since the 1980s, even though their natural habitats are very varied, including coastal and inland wetlands, grassland, woodland and farmland. This decline has placed them on the red list. There are estimated to be 1.8 million pairs in the UK. \n\nIn September and October, resident birds’ numbers are increased by the arrival of birds from northern Europe and Scandinavia which overwinter in the UK, escaping more severe conditions in their countries of origin. It is during the winter that the spectacular aerial gatherings known as murmurations may be seen as dusk approaches. Murmurations are collective movements to confuse and evade predators, such as falcons or hawks. Thousands of birds fly in close synchronised formation, diving and wheeling and producing spectacular aerial patterns before plunging into their night-time communal roost. Roosts may be in trees such as conifers, in reedbeds, or in manmade structures such as piers. \n\nStarlings mostly eat invertebrates such as earthworms, leatherjackets, spiders and moths, but also seeds and fruit. They often search for food on grass, probing the ground for invertebrates with their beaks. However, their diet contains an increasing proportion of plant matter from the summer onwards. In response to this, their intestines increase in length, to adjust for the greater difficulty of digesting plant matter.  \n\nMale starlings will establish breeding territories from January onwards. The male will attempt to defend a number of suitable nesting sites in tree cavities or below roof tiles, and try to attract several females. However, there is stiff competition for nesting sites, and most starlings therefore end up with one nesting site and one mate. In late March or early April, males build their nests from leaves and dry grass and attract a female by singing near the nest. The female completes the nest, adding moss and feathers. 4-7 eggs are usually laid in mid-April, and these, brooded by the female, hatch about two weeks later. Both parents raise the chicks. A pair may produce 1-3 clutches a season.\n\nSome females engage in what is known as brood parasitism, by depositing one of their eggs in the nest of another female. The females which do this tend to be birds which haven’t yet secured a mate or a nest site. Even though many of them do go on to have a nest of their own later in the season, giving them another chance to breed, the incentive for brood parasitism is that earlier breeding probably gives the resulting young birds a better chance of survival. \n\nThe decline of nesting sites is thought to be one of the factors responsible for the starling’s decline in numbers. In urban areas, modern building practices, including renovations, mean that cavities under roof tiles and behind barge boards and soffits no longer exist, denying starlings nesting opportunities that used to be plentiful. Starlings will, however, readily use nest boxes designed specifically for them. \n\nBirds of prey and domestic cats number amongst the starling’s main predators.",
    images: [
      Photo('assets/starling.png', giorgio),
      Photo('assets/starling2.png', giorgio),
      Photo('assets/starling4.png', giorgio),
      Photo('assets/starling5.png', giorgio),
    ],
    scientificName: 'Sturnus vulgaris',
    birdFamily: 'Sturnidae (starlings)',
    conservationStatus: 'Red',
    birdType: BirdType.nesting,
    id: 11,
  );
  static final Bird wagtail = Bird(
    name: 'Pied Wagtail',
    description:
        "Pied wagtails, elegant and graceful, are 18cm long and 20-27g in weight, little bigger than a great tit. They are resident in the UK all year round. Their most distinctive characteristic is the wagging up and down of their long tails. \n\nIn the breeding season, male wagtails are striking birds with a black chest and back, and black and white head, wings and tail; however, males in non-breeding months are more grey, resembling the females. \n\nPied wagtails feed mainly on insects, especially caterpillars and flies, and can be seen dashing around on grass and lawns in search of prey. They have become quite a common sight in retail car parks, also searching for food. They either catch insects on the ground, or as the insect embarks upon flight.\n\nOutside the breeding season, pied wagtails will roost communally at warm roost sites such as reed beds, or trees or bushes in cities. Some roosts contain up to 4000 birds.\n\nPied wagtails nest in holes in a wide variety of places, such as walls and buildings, under roofs and ivy and sometimes in very unlikely places such as farm machinery. The females build the nests out of mosses and grass, and line them with feathers, wool or hair. Normally, there are two broods per season, with 5-6 eggs. These are incubated mostly by the female, and hatch after about 13 days. \n\nThere are an estimated 470,000 breeding pairs in the UK.",
    images: [
      Photo('assets/wagtail2.png', giorgio),
      Photo('assets/wagtail1.png', giorgio),
      Photo('assets/wagtail.png', giorgio),
    ],
    conservationStatus: 'Green',
    birdFamily: 'Motacillidae (Pipits and wagtails)',
    scientificName: 'Motacilla alba',
    birdType: BirdType.nesting,
    id: 12,
  );
  static final Bird crow = Bird(
    name: 'Crow',
    description:
        "The carrion crow, or simply ‘crow’, is generally a solitary bird, seen alone or in pairs, and while generally fearless, it is wary of humans. It is about 45-47cm long and weighs 370-650g. Crows are entirely black, including their beaks, feet and legs, though the feathers on their heads, wings and backs have green and purple iridescence. Their thighs are neatly feathered.\n\nCrows are found in a wide variety of habitats, from woodlands to wetland and heathlands. They are intelligent, opportunistic and adaptable birds and have colonised cities readily. \n\nThey eat a range of foods including carrion, fruit, grain, invertebrates, small mammals, frogs, and the eggs and chicks of other birds. Their diet changes across the seasons, with predation upon eggs and chicks tending to be related to the need to feed their own young. As crows have only one clutch of eggs a season, predation on other birds is in general limited to the breeding season. However, crows will occasionally hunt together to prey on other birds, sometimes catching them in flight. They will also harass other birds, or animals such as foxes, for their kills. Studies have found a crow’s diet can consist of over 1000 different food items.\n\nCarrion crows generally pair for life. They breed between late March and early June. Both birds build the nest, which may be in a variety of places (tree forks, old buildings, cliffs, and elsewhere) using an assortment of materials including twigs, bones and even wire. They reinforce the nests with mud, and line them with bark, wool, feathers, grass, paper, hair and other materials. They generally lay 3-4 eggs, which are incubated by the female for 18-20 days. The male feeds her during incubation. Both parents bring food to the chicks. The chicks fledge 4-5 weeks after hatching, and are dependent upon their parents for several more weeks.\n\nWhile crows have large territories centred upon their nests, neighbouring crows will sometimes co-operate to ‘mob’ or chase away potential predators or intruders. Crows maintain their territories year round, although they may depart overnight for communal roosts in winter. \n\nIt’s estimated that there are around 1 million breeding pairs in the UK, although they aren’t found in north and west Scotland or in Northern Ireland.",
    images: [
      Photo('assets/crow1.png', giorgio),
      Photo('assets/crow2.png', giorgio),
      Photo('assets/crow3.png', giorgio),
      Photo('assets/crow4.png', giorgio),
    ],
    conservationStatus: 'Green',
    scientificName: 'Corvus corone',
    birdFamily: 'Corvidae (crows)',
    birdType: BirdType.predator,
    id: 13,
  );
  static final Bird jay = Bird(
    name: 'Jay',
    description:
        "The jay differs from other corvids in being extremely colourful. It has a pinkish body, black and white wings with a striking patch of banded blues, a white rump, black tail, black ‘moustache’ and pale chin. Its crown feathers are streaked black and white, and when it is displaying or excited, it can raise the feathers into a crest. Its length is around 35cm and weight 140-190g.\n\nThey are woodland birds, and shy of humans, preferring not to be seen. However, they are sociable and have many different calls, many of which mimic other birds, particularly other corvids. The call we are most likely to be familiar with is their harsh alarm call.\n\nJays have a mixed diet, eating seeds such as acorns and beech mast, fruit, insects, small rodents, bats, newts, birds’ eggs and young birds.\n\nJays are well known for caching food in autumn, particularly acorns, to eat in winter. They have good memories and are capable of retrieving several thousand acorns.\n\nMales and females usually pair for life. Both birds build a rather untidy nest of twigs in a tree or shrub, and line it with hairs, fibres and roots. They have one clutch of 4-5 eggs, which are incubated by the female. Both parents feed the young, which fledge at around 19-20 days. \n\nIt is estimated that there are 170,000 territories in the UK.",
    images: [Photo('assets/jay1.png', giorgio)],
    scientificName: 'Garrulus glandarius',
    birdFamily: 'Corvidae (crows)',
    conservationStatus: 'Green',
    birdType: BirdType.predator,
    id: 14,
  );
  static final Bird coaltit = Bird(
    name: 'Coal Tit',
    description:
        "The smallest of the UK’s tits, the coal tit weighs only 8-10 grams and has a length of about 11-12cm. It’s a less colourful bird than either the blue tit or the great tit, with more subdued dominant colours. Its upperparts are olive-grey and its underparts buff coloured, and each wing has white bars. The coal tit’s crown and bib are black, and cheeks and neck nape white. \n\nIt’s a shy bird with a preference for conifers. Its bill is smaller and thinner than those of blue and great tits, which enables it to feed on conifer seeds that the other tits can’t access. \n\nCoal tits also eat insects and seeds such as beech mast and will readily eat food such as seeds, suet and mealworms from bird food tables and feeders.  Coal tits store food when it is plentiful, intending the food to be for less easy times; however, they often forget where they have stashed their stores. Great tits have been observed watching coal tits hide their food, and then plundering the cache. \n\nThe song is a “pee-chew”, and is a bit like a faster great tit song. \n\nIt’s thought that there are around 680,000 breeding pairs in the UK. \n\nCoal tits are sometimes seen in the vicinity of Redland Green.",
    images: [
      Photo('assets/coaltit1.png', giorgio),
      Photo('assets/coaltit2.png', giorgio),
    ],
    conservationStatus: 'Green',
    scientificName: 'Periparus ater',
    birdFamily: 'Paridae (tits)',
    birdType: BirdType.other,
    id: 15,
  );
  static final Bird goldfinch = Bird(
    name: 'Goldfinch',
    description:
        "The goldfinch is a bird of woodland and farmland, but has in the last decades colonised urban areas where they visit bird food tables and feeders. Adults are brightly coloured golden-green birds with red faces, white necks, black caps and eye markings, and black wings with yellow patches; juveniles lack the red faces. Goldfinches are a little smaller than robins. They are seed specialists, with long fine beaks which allow them to extract seeds from plants such as thistles and teasels that other birds can’t reach. They also eat insects. \n\nThey have a beautiful, liquid twittering song and are highly sociable birds, often breeding in loose colonies and flying in small flocks. It’s a restless bird, often on the wing, and often singing as it flies. In a good year, they may raise several broods of around 5 chicks. In winter, larger flocks of maybe 100 birds will congregate and search for food. In very poor winter weather, some birds may migrate to France and Spain. \n\nGoldfinches can often be seen in Redland’s allotments and parks. They benefit from areas with trees and bushes and untended places with plants bearing seeds. Places are kept wild for species such as the goldfinch in Redland’s allotments. \n\nThere are estimated to be around 1.2 million breeding pairs in the UK. Their numbers have grown considerably since they became a protected species; prior to that, human persecution had caused steep declines in their numbers.",
    images: [
      Photo('assets/goldfinch1.png', giorgio),
      Photo('assets/goldfinch2.png', giorgio),
      Photo('assets/goldfinch3.png', giorgio),
      Photo('assets/goldfinch4.png', giorgio),
    ],
    conservationStatus: 'Green',
    birdFamily: 'Fringillidae (finches)',
    scientificName: 'Carduelis carduelis',
    birdType: BirdType.other,
    id: 16,
  );
  static final Bird longtailedtit = Bird(
    name: 'Long-tailed Tit',
    description:
        "Long-tailed tits are small and dainty birds of around 14cm in length. They are easily recognisable because their tails are longer than their body length. Long-tailed tits have black, white and pink backs, white heads with black eyestripes and pale pink undersides. Their tails are black and white. Their black beaks are short. They have an undulating flight pattern. \n\nDespite their name, long-tailed tits aren’t closely related to the other UK tits, and belong to a different family, Aegithalidae, the tit family being the Paridae family. \n\nThey are very sociable birds, generally spending their time in groups of up to 20 individuals, and are seldom seen alone. In winter they may form larger flocks with other species of tit. Long-tailed tits are insect and invertebrate specialists, although they do eat seeds in winter when food is scarce. The birds are very acrobatic, and pluck their prey from trees and other vegetation. \n\nIn winter, the birds roost overnight in groups in trees and shrubs, and nestle together very closely in order to avoid losing body heat, a threat resulting from their very small body mass. They are one of the species that might use nest boxes to roost in during winter. Mortality can be as high as 80% in very cold winters. \n\nThey love the cover of trees and bushes, and can be heard making contact calls with each other that sound rather like a high-pitched “tsee-tsee-tsee”. Their song is characterised by trills and twittering. \n\nPlentiful tree and bush cover around Redland Green, and particularly in the neighbouring allotments, provides a haven for these beautiful birds, and they can be seen and heard around Redland Green. \n\nThere are estimated to be 340,000 breeding territories in the UK. Their numbers have been increasing in the last decades, possibly because of fat and seeds put out on bird tables and in feeders.",
    images: [
      Photo('assets/longtailedtit.png', giorgio),
      Photo('assets/longtailedtit2.png', giorgio),
      Photo('assets/longtailedtit3.png', giorgio),
    ],
    birdFamily: 'Aegithalidae (long-tailed tits)',
    scientificName: 'Aegithalos caudatus',
    conservationStatus: 'Green',
    birdType: BirdType.other,
    id: 17,
  );
  static final Bird magpie = Bird(
    name: 'Magpie',
    description:
        "The magpie (or Eurasian magpie) is a very distinctive and handsome bird and one of the easiest corvids to identify. It is a pied, or black and white bird whose wing and tail feathers feature blue and blue-green-purple iridescence. Males and females look alike, but the female is slightly smaller. They are 44-46cm long with the tail accounting for over half of this length, and weigh 200-250g. They are very sociable and vocal birds.\n\nHowever, possibly more than any other bird, the magpie is associated with a range of mostly negative superstitions both across ages and in many different cultures. This could be because as scavengers, magpies have been associated with death, and because of that, with bad luck. The Victorians feared the magpie, and hunted it almost to extinction. It is also disliked because it preys on the nests of other birds, particularly songbirds.\n\nMagpies are omnivorous, and as well as raiding nests and feeding on carrion and roadkill, they eat invertebrates, fruit and berries and small mammals. They hoard food when it is scarce, hiding the food in a hole in the ground which they cover with leaves or grass.\n\nBoth birds make the nest, with the male collecting most of the materials for it. The nest is a large cup of twigs, grass, hair and mud, surrounded by a dome made from larger twigs, and with one or two entrances, although some birds don’t bother with domes. The nest, located in dense bushes or high up in trees, may take 5-6 weeks to make. The female lays around 5-8 eggs, which she incubates for around 19 days. The male feeds the female while she is brooding. The young fledge after about four weeks and continue to be fed by the parents for up to a month. The family stays together as a unit until the autumn. Young birds may form flocks, and feed and roost together.\n\nBreeding magpies maintain their territories all year round. As there are more individuals in an area than there are nesting sites available, many birds do not breed.\n\nIt’s estimated there are around 600,000 breeding territories in the UK.",
    images: [
      Photo('assets/magpie.png', giorgio),
      Photo('assets/magpie1.png', giorgio),
      Photo('assets/magpie3.png', giorgio),
    ],
    birdFamily: 'Corvidae (crows)',
    scientificName: 'Pica pica',
    conservationStatus: 'Green',
    birdType: BirdType.predator,
    id: 18,
  );
  static final Bird woodpecker = Bird(
    name: 'Great Spotted Woodpecker',
    description:
        "The great spotted woodpecker is one of three woodpeckers native to the UK. It is a bird that is shy of humans, and so can be difficult to see. It is more commonly heard than seen.\n\nThis species is a broadleaved woodland specialist, but is very adaptable, and is also found in coniferous woodland, and parks and gardens where trees are plentiful. They particularly like oak and hornbeam trees.\n\nThe great spotted woodpecker is a pied (black and white) woodpecker. At 21-23 cm long, it is about starling sized. It weighs about 85 grams. The male and female are very similar, with a white underside, white and black back and wings and white cheeks and shoulder patches. Both male and female have a bright red underside at the base of the tail, but only the male has a red patch at the back of his neck. The nape of the female’s neck is white. Juveniles may be seen in summer: they are distinguished from their parents by having a red cap, which disappears after their first moult.\n\nThey have very strong claws for gripping the bark, and also use their stiff tail feathers as support when hopping up trees and gripping while chiselling and drumming. They have two toes which point frontwards, and two pointing backwards.\n\nThe great spotted woodpecker flight pattern is undulating. This is because it folds its wings against its body every few wing flaps.\n\nDead trees, rich in insect life, are an important source of food for them. The woodpecker probes both living and dead trees for larvae and insects, and uses its powerful beak to hammer holes in the bark. Their extremely long and sticky tongues assist in extracting insects, spiders and caterpillars from crevices and holes. In winter they feed on nuts and berries, and will visit bird feeders for suet, peanuts and seeds throughout the year. Woodpeckers will take eggs and nestlings from nests, including from nest boxes. If nest boxes are made of wood, they will enlarge the size of the hole to gain entry.\n\nThe woodpecker is known for its drumming. This is a rapid hammering on a trunk of up to 20 times per second, which lasts a few seconds. Drumming serves several functions. It may be used to maintain contact between a pair, but its main function is to establish and proclaim a territory. The species is strongly territorial. The bird chooses a healthy tree on which to drum, in order to make the loudest sound. Both males and females drum from the late winter. The male drums more frequently than the female. Drumming usually ceases after the young have fledged.\n\nTerritorial and contact drumming are a more rapid drumming than that which characterises the bird’s nest-making chiselling.\n\nThe great spotted woodpecker nests in mature and old trees, excavating a hole in the trunk or branch by chiselling a cavity, and lining it with wood chip. It can take up to four weeks for a pair to chisel out a cavity, but the work is shared equally between male and female. The woodpeckers make a new nest hole every year, which means they have a significant ecological role in leaving many potential nest sites for other birds and animals. They may also use old holes as night-time roosts.\n\nGreat spotted woodpeckers are monogamous in a breeding season, but may have different partners in different seasons.\n\nBreeding starts in mid-April. 3-8 eggs are laid, and there’s generally just one clutch in a breeding season. Both parents incubate and feed the young. Incubation takes around 2 weeks, and fledging occurs about 3 weeks after hatching. After fledging, the adults continue to feed the young for another 10 or so days.\n\nIt’s estimated that there are around 140,000 breeding pairs, mostly in England and Wales.",
    images: [Photo('assets/woodpecker.png', giorgio)],
    birdFamily: 'Picidae (woodpeckers)',
    conservationStatus: 'Green',
    scientificName: 'Dendrocopos major',
    birdType: BirdType.predator,
    id: 19,
  );
  static final Bird sparrowhawk = Bird(
    name: 'Sparrowhawk',
    description:
        "The sparrowhawk is a small bird of prey, about 28-34cm in length with a wingspan of 55-70cm. Females are considerably larger than males. Adults have barred orange-brown underparts and blue-grey upperparts; juveniles are browner overall. The species has short, broad wings and a long tail, which give it great agility when pursuing prey through trees and among buildings.\n\nSparrowhawks are specialist hunters of small birds, ambushing their prey from cover or chasing them in flight. They are increasingly seen in gardens and parks, where bird feeders can attract both sparrowhawks and their prey. Although their hunting can alarm householders, they are a natural part of the ecosystem and their presence often indicates a healthy local bird population.\n\nSparrowhawks nest in woodland and sometimes in large gardens, building a platform of twigs in the fork of a tree. The female lays 4-5 eggs in April or May and incubates them for about a month. The male brings food to the nest while the young are being raised.\n\nIt’s estimated there are around 35,000 breeding pairs in the UK. Numbers recovered after pesticides reduced their populations in the mid-20th century, and the species is now on the green list.",
    images: [
      Photo('assets/sparrowhawk_2.png', keith),
      Photo('assets/sparrowhawk_1.png', keith),
      Photo('assets/sparrowhawk_3.png', keith),
    ],
    birdFamily: 'Accipitridae (kites, hawks and eagles)',
    conservationStatus: 'Green',
    scientificName: 'Accipiter nisus',
    birdType: BirdType.predator,
    id: 20,
  );
  static final Bird sparrow = Bird(
    name: 'House Sparrow',
    description:
        "The house sparrow is a stout, sociable bird about 14-15cm in length. Males have a grey crown, chestnut-brown back with black streaks, a black bib and grey underparts. Females and juveniles are duller, with buff-brown plumage and no black bib. Their constant chirping and squabbling at feeders and rooflines makes them one of the most familiar of urban birds.\n\nHouse sparrows were once among the commonest birds in British towns and cities, including Bristol, but their numbers have fallen sharply since the 1970s. This decline, thought to be linked to reduced nesting sites and fewer insects for chicks, has placed them on the red list. They remain widespread, however, and can still be seen in gardens, parks and hedgerows around Redland Green.\n\nThey eat mainly seeds and grain, but feed insects to their young. House sparrows nest in holes and crevices in buildings, nest boxes and dense vegetation, often in loose colonies. A pair may raise 2-3 broods a year, with clutches of 3-6 eggs.\n\nThere are estimated to be around 5 million breeding pairs in the UK, though numbers in urban areas are much lower than they once were.",
    images: [
      Photo('assets/sparrow_3.png', giorgio),
      Photo('assets/sparrow.png', keith),
      Photo('assets/sparrow_2.png', keith),
    ],
    birdFamily: 'Passeridae (sparrows)',
    conservationStatus: 'Red',
    scientificName: 'Passer domesticus',
    birdType: BirdType.other,
    id: 21,
  );
  static final Bird piedFlycatcher = Bird(
    name: 'Pied Flycatcher',
    description:
        "The pied flycatcher is a small bird, about 12cm in length. Breeding males are striking black-and-white birds with a bold white patch on the wing; females and juveniles are brown above with paler underparts. They are summer visitors to the UK, arriving from Africa in April and May and departing again in August and September.\n\nPied flycatchers feed on flying insects, which they catch in mid-air after sallying from a perch. They are mainly birds of mature oak woodland in western and northern Britain, and are uncommon in built-up areas. However, they may occasionally be seen on migration, including in parks and gardens.\n\nThey nest in holes in trees and readily use nest boxes, especially in woodland. The female builds a nest of moss, grass and leaves, lined with hair and feathers, and lays 6-7 eggs. Both parents feed the young.\n\nIt’s estimated there are around 40,000 breeding males in the UK. The population has declined, and the species is on the red list.",
    images: [
      Photo('assets/pied_flycatcher.png', keith),
      Photo('assets/pied_flycatcher_1.png', keith),
    ],
    birdFamily: 'Muscicapidae (Old World flycatchers & chats)',
    conservationStatus: 'Red',
    scientificName: 'Ficedula hypoleuca',
    birdType: BirdType.predator,
    id: 22,
  );
  static final Bird jackdaw = Bird(
    name: 'Jackdaw',
    description:
        "The jackdaw is a small, sociable member of the crow family, about 34cm in length. It is mostly black, but is easily recognised by its grey nape and cheeks, and striking pale grey-blue eyes. Jackdaws are intelligent, inquisitive birds, often seen in flocks calling with their short, metallic ‘jack’ or ‘chyak’ notes.\n\nJackdaws are well adapted to living alongside people. They nest in chimneys, church towers, holes in trees and crevices in old buildings, and are a familiar sight in Bristol and around Redland Green. They are omnivorous, eating insects, seeds, scraps and occasionally the eggs and young of other birds.\n\nPairs usually stay together for life. Both birds help build the nest, which is lined with wool, hair and other soft materials. They lay 4-5 eggs in April or May. Jackdaws often nest in loose colonies, and young birds may remain with their parents through the winter.\n\nIt’s estimated there are around 1.4 million breeding pairs in the UK.",
    images: [
      Photo('assets/jackdaw1.png', giorgio),
      Photo('assets/jackdaw2.png', keith),
    ],
    birdFamily: 'Corvidae (crows)',
    conservationStatus: 'Green',
    scientificName: 'Corvus monedula',
    birdType: BirdType.predator,
    id: 23,
  );
  static final Bird kestrel = Bird(
    name: 'Kestrel',
    description:
        "The kestrel is a small falcon, about 32-35cm in length. Males have a grey head and tail, a rust-red back and black-spotted plumage; females are larger and browner, with barred tails. It is famous for its hunting technique of hovering in mid-air, wings beating rapidly, before dropping onto prey below.\n\nKestrels feed mainly on small mammals, especially voles, but also take insects, earthworms and small birds. They hunt over open grassland, farmland and parks, and may occasionally be seen over Redland Green and nearby fields, perched on wires or trees when not hunting.\n\nKestrels nest in holes in trees, buildings and occasionally nest boxes, laying 4-5 eggs in April or May. The female incubates the eggs while the male brings food. Young birds fledge after about a month.\n\nThere are estimated to be around 45,000 breeding pairs in the UK. Numbers declined in the late 20th century, placing the species on the amber list, though populations have partly recovered in some areas.",
    images: [
      Photo('assets/kestrel.png', keith),
      Photo('assets/kestrel_1.png', keith),
      Photo('assets/kestrel_2.png', keith),
    ],
    birdFamily: 'Falconidae (falcons)',
    conservationStatus: 'Amber',
    scientificName: 'Falco tinnunculus',
    birdType: BirdType.predator,
    id: 24,
  );

  static final Bird pigeon = Bird(
    scientificName: 'Columba palumbus',
    birdFamily: 'Columbidae (Pigeons and doves)',
    conservationStatus: 'Amber',
    birdType: BirdType.other,
    name: 'Pigeon',
    description:
        "The woodpigeon is the UK’s largest and most common pigeon. It’s a plump bird with a length of 40-42cm and weighs around half a kilo. Largely grey, the woodpigeon has a pinkish breast, iridescent green and purple neck feathers, a white neck patch and white wing patches. The bird is found across the UK, having extended its original habitat of woodlands and fields to urban parks and gardens. Its distinctive cooing call is a sound familiar to most. \n\nIts fondness for brassicas (such as cabbages, kale, brussels sprouts) and peas and grains makes it unpopular with farmers and allotmenters. It also eats buds, shoots, seeds and berries, as well as invertebrates such as insects and worms. In winter, the birds can fill their crops with seeds and other food, which they digest overnight. The crops can hold a considerable amount of food. \n\nAlthough the bird is on the amber list of conservation concern, as an agricultural pest the bird is shot throughout the year, and it’s also possible to buy wood pigeon for eating. \n\nPigeons breed any time throughout the year. Their nests are generally made in forks of trees or on branches, and look like rather untidy accumulations of twigs. They often re-use their nests. No more than two eggs are laid in each brood. \n\nWoodpigeons feed their young on “pigeon milk” – a regurgitated and extremely rich milky substance produced in the parents’ crops (a food-storage organ) during the breeding season. This ensures the young birds put on weight very rapidly. \n\nThere are estimated to be 5.4 million breeding pairs in the UK. Numbers have increased in the last 50 years, and it’s thought this might be because of the cultivation of winter cereals and oilseed rape, providing more winter food. In the autumn, many wood pigeons from the continent migrate here to overwinter and large flocks may form. Woodpigeons are often found on and around Redland Green.",
    images: [Photo('assets/pigeon.png', giorgio)],
    id: 25,
  );
  static final List<Bird> birdsList = [
    blackbird,
    blueTit,
    coaltit,
    crow,
    dunnock,
    goldfinch,
    greatTit,
    jay,
    longtailedtit,
    magpie,
    nuthatch,
    robin,
    songThrush,
    starling,
    woodpecker,
    wagtail,
    wren,
    sparrow,
    sparrowhawk,
    jackdaw,
    piedFlycatcher,
    kestrel,
    pigeon,
    other,
    unidentified,
    none,
  ];
}
