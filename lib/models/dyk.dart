enum DYKType {
  general,
  nestBoxes,
  birdNames,
  passerines,
  corvids,
  birdsOfPrey,
  woodpeckers,
}

class DYK {
  String? question;
  String? answer;
  DYKType? type;
  String? image;

  DYK({this.question, this.answer, this.type, this.image});

  static List<DYK> didYouKnowList = [
    DYK(
      question: 'What birds might I see (or hear) around Redland Green?',
      answer:
          'Redland Green and the adjacent allotments harbour a wide variety of species. These include tits (coal tit, long-tailed tit, blue tit, great tit), goldfinches, robins, wrens, blackbirds and song thrushes, starlings, corvids (carrion crows, jackdaws, magpies and jays), woodpeckers (great spotted and green), nuthatch and wood pigeons. Seasonal visitors include swifts, house martins and chiffchaff (spring and summer) and fieldfare, redwing and blackcaps in the winter (though some blackcaps have become year-round residents). You might also hear or see sparrowhawks and tawny owls. \n\nWe owe this considerable variety of species to the varied habitats offered by the Green and the allotments, particularly afforded by the veteran ash and oak trees in both places, which provide nesting sites and food. Bird tables in gardens also support some bird populations, although they could not do so without the habitat needed for nesting and roosting.',
      type: DYKType.general,
      image: 'assets/wagtail.png',
    ),
    DYK(
      question: 'What is sexual dimorphism in a species?',
      answer:
          "Dimorphism means that the two sexes of the same species differ in appearance from each other. This may be in size, weight, colour and markings. It may also include behavioural differences. The black male blackbird and the brown female blackbird are an example of dimorphism.",
      type: DYKType.general,
      image: 'assets/blackbird1.png',
    ),
    DYK(
      question: 'What legislation protects birds?',
      answer:
          'The most important legislation affecting birds in the UK is the Wildlife and Countryside Act 1981. This Act protects animals that are resident in, or visit (e.g. in summer or winter migrations) the UK as well as plants and habitats. This means it is an offence to kill, injure or trap any wild bird or take or destroy its eggs. It’s also an offence to: interfere with the nest while it’s being built and used; and to do anything that disturbs the bird while it’s nest building, brooding and caring for its young, and to harm the young.',
      type: DYKType.general,
      image: 'assets/starling.png',
    ),
    DYK(
      question: 'What is a tautonym?',
      answer:
          'Scientific names in biology have two parts: the generic (genus) and the specific (species) components. When the scientific name of a species has two identical parts, this is a tautonym. It is no longer used in botany, but in zoology examples include Pica pica (the magpie), Carduelis carduelis (goldfinch) and Troglodytes troglodytes (wren). It’s not just birds with tautonymous names: for example, the red fox is Vulpes vulpes and the common toad Bufo bufo.',
      type: DYKType.general,
      image: 'assets/magpie.png',
    ),
    DYK(
      question: 'Can birds see ultra-violet light?',
      answer:
          'Ultraviolet light has a shorter wavelength than light in the spectrum that is visible to humans, but ultra-violet light is visible to insects, birds and some mammals. Phenomena visible in UV light might function to communicate messages between animals, both within and between species. For example, the blue crown feathers on blue tits’ heads reflect UV light, making the crown glow brightly. Brighter crown feathers have been shown to be associated with successful fledging of chicks; and females with brighter crowns also seem to be preferred by males. Brighter crowns on female blue tits may therefore signal reproductive success to males. There is still a lot to learn!',
      type: DYKType.general,
      image: 'assets/bluetit1.png',
    ),
    DYK(
      question: 'What threats do birds face?',
      answer:
          'In addition to the general threats facing bird species, such as climate change, habitat loss, and effects caused by introduced species such as the grey squirrel, there are many threats to the survival of individual birds. These include bad weather and low food supplies, but predation is a major factor. Most of the birds described in this app, or their eggs, are preyed upon by a wide range of animals, including cats, foxes, grey squirrels, weasels, sparrowhawks, magpies, jays, crows and woodpeckers. All of these species exist in or around the green, except for weasels (no known sightings). It’s easy to see how dangerous life is for birds, and why they must constantly be on the lookout for predators.',
      type: DYKType.general,
      image: 'assets/starling4.png',
    ),
    DYK(
      question: 'What are the red, amber and green lists?',
      answer:
          'The red, amber and green lists categorise the population status of birds (and other animals) in the UK. The lists are reviewed every five years in order to stay up-to-date. The red list includes birds of the greatest conservation concern, with species showing severe (more than 50%) contraction in their breeding populations and breeding ranges over a given period. They need urgent action to reverse these declines. Birds on the amber list are those that have shown moderate (25%-50%) breeding population and breeding range declines. The green list is of birds that are not currently of conservation concern. The last review showed that 67 UK birds, or more than a quarter of the UK’s regularly occurring bird species, are now on the red list.',
      type: DYKType.general,
      image: 'assets/starling2.png',
    ),
    DYK(
      question:
          'What sorts of trees are likely to have holes and cavities that birds can nest in?',
      answer:
          'Holes are found mainly in old trees. This is one of many reasons why old trees are so important to protect, as they provide habitat for a huge range of species in addition to birds. There are many reasons holes develop. Holes may develop as the result of injury caused by forces such as wind or lightning, or attacks by insects, bacteria or fungi. Holes can take a long time to form, and can vary in size, depth, shape, insulation and size of entrance hole, making them suitable for many different animals. Holes can also be created by birds which use them to nest, and sometimes roost in.\n\nFor example, the ancient trees in the green – the ash and the oak – contain many holes and are therefore very significant in the ecology of the green. Many of these holes have been made by great spotted woodpeckers, which create a new nesting hole each year.',
      type: DYKType.general,
      image: 'assets/woodpecker.png',
    ),
    DYK(
      question: 'What is the “phenological mismatch”?',
      answer:
          'The changing climate is causing important ecological events to happen at different times than in the past. It has been observed that spring events such as trees budding and a peak in caterpillar numbers are now happening earlier by about 3 weeks. Birds such as blue and great tits and pied flycatchers lay their eggs at a time which enables them to take advantage of this great bounty of caterpillars for feeding their young. If the flush of food is now happening earlier, what are the consequences for birds if they are not able to adapt and breed earlier? This is the phenological mismatch: events that used to be synchronised are no longer, as they are shifting at different rates. These changes and their consequences are the subjects of active research.',
      type: DYKType.general,
      image: 'assets/greattit2.png',
    ),
    DYK(
      question:
          'Will any of the nest boxes in Redland Green be used by coal tits?',
      answer:
          'Coal tits nest in tree hollows or old mouse holes in the ground. They will nest in boxes, although they prefer boxes with a small hole to prevent larger birds from being able to evict them. While coal tits do live in this area, it is unlikely any of our boxes will be used by coal tits, as they prefer to nest in boxes hung in conifers rather than deciduous trees. Perhaps we should plant a few more conifers?',
      type: DYKType.nestBoxes,
      image: 'assets/coaltit2.png',
    ),
    DYK(
      question: 'Will long-tailed tits use the nest boxes in Redland Green?',
      answer:
          'Long-tailed tits nest in trees or bushes, or even brambles, making ball-shaped nests out of moss, hair and feathers, and camouflaging them with lichen and spiders’ webs. The nests may take several weeks to build and can be lined with 1,500 or more feathers, to make them soft enough for their 8-12 eggs. Long-tailed tits are frequently seen or heard in the allotments next to Redland Green, but they are not very likely to use nest boxes to nest in. However, they will sometimes use nest boxes as communal roosting sites in winter.',
      type: DYKType.nestBoxes,
      image: 'assets/longtailedtit.png',
    ),
    DYK(
      question: 'Will goldfinches use the nest boxes in Redland Green?',
      answer:
          'Goldfinches are not cavity nesters. They prefer to nest in trees or dense hedgerows and tend to nest in small, loose colonies. The female will weave moss, leaves, grass and other materials brought to her by the male into a cup-like structure, using vertical branches as a framework. The nest is lined with wool or plant material. It is most unlikely that a goldfinch would use a nest box.',
      type: DYKType.nestBoxes,
      image: 'assets/goldfinch1.png',
    ),
    DYK(
      question: 'Will dunnocks use the nest boxes in Redland Green?',
      answer:
          'Dunnocks are not cavity nesters, and so are very unlikely to use our nest boxes. They make their nests in dense vegetation such as shrubs and hedges, and tend to breed in groups, rather than pairs.\n\nSadly, cuckoos are not as common as they once were, but the dunnock is one of the species that cuckoos like to lay their eggs in. ',
      type: DYKType.nestBoxes,
      image: 'assets/dunnock1.png',
    ),
    DYK(
      question: 'Will starlings use the nest boxes in Redland Green?',
      answer:
          'Starlings will use nest boxes, and Redland Green Community Group erected one starling box in 2022 as a trial near to the Redland Tennis Club; if used, the group may install more. As starlings are gregarious, new boxes could be located in close proximity to the existing box. Several boxes may be located within a few metres of each other.\n\nStarlings prefer nest boxes with large holes of around 45mm and also prefer slightly larger boxes than the boxes used by smaller birds such as tits.',
      type: DYKType.nestBoxes,
      image: 'assets/starling5.png',
    ),
    DYK(
      question: 'Will swifts use the nest boxes in Redland Green?',
      answer:
          'Swifts are summer visitors, migrating to the UK from as far away as Mozambique. Their populations have declined severely in the UK. Swifts nest under eaves and within roof cavities; one of the reasons they are declining is that modern buildings have fewer holes for them to nest in. Swifts will use nest boxes, but these need to be located high up, usually on buildings; some far-sighted developers now incorporate swift bricks into the walls and near the roof line of new-build houses. These are in effect hollow bricks with entrance holes. Some people also put swift boxes on the outside of their houses, near the roof line. None of our boxes are suitable for swifts, either in type or location.',
      type: DYKType.nestBoxes,
      image: 'assets/bird_boxes/alicante.jpg',
    ),
    DYK(
      question: 'What birds will use nest boxes as winter roosts?',
      answer:
          'Many birds that nest in cavities will use nest boxes as winter roosts. In particular, very small birds will congregate together in boxes overnight, seeking protection from the weather and predators, and sharing body heat. Blue tits, coal tits, house sparrows and wrens are all known to use nesting boxes to roost in over the winter months. In fact, the maximum number of wrens to occupy a nest box as a roost, according to the British Trust for Ornithology, is 63 individuals!',
      type: DYKType.nestBoxes,
      image: 'assets/wren.png',
    ),
    DYK(
      question:
          'What are the group, or collective names for different corvids?',
      answer:
          'Some of the corvids have several collective nouns, but some of the best known are: a murder of crows, a chattering of choughs, a clattering of jackdaws, a scold of jays, a mischief of magpies, a conspiracy of ravens, and a parliament of rooks.',
      type: DYKType.birdNames,
      image: 'assets/crow2.png',
    ),
    DYK(
      question: 'Do birds besides the corvids have group or collective names?',
      answer:
          'Many birds do. Some of the collective names of birds found around Redland Green are: a worm of robins, a murmuration of starlings, a hermitage of thrushes, a chime of wrens, a booby of nuthatches, a quarrel of sparrows, a descent of woodpeckers, a banditry of titmice, a trembling of finches, a confusion of chiffchaffs, a charm of goldfinches and a wisdom of owls.',
      type: DYKType.birdNames,
      image: 'assets/goldfinch2.png',
    ),
    DYK(
      question:
          'The robin’s breast is more orange than red. So why do we call it red?',
      answer:
          "The robin was originally known as the ‘red breast’ in the medieval period. At that time, there was no word for the colour orange. It was only during the Tudor period, when oranges were first imported from the Himalayan foothills, that the word ‘orange’ entered the language and became used to name a colour. By then the bird’s name was well established.\n\nIt is more common today for the ‘red breast’ to be dropped, and the bird is generally simply known as ‘robin’.",
      type: DYKType.birdNames,
      image: 'assets/robin.png',
    ),
    DYK(
      question: 'What sort of bird is a tom tit?',
      answer:
          "The blue tit used to be known as ‘Tom titmouse’ or ‘tom tit’, or, more remotely ‘pickcheese’. Birds in the tit family, Paridae, used to be known as ‘titmouses’ (or ‘titmice’) and occasionally today the full name ‘titmouse’ is still used, as in ‘blue titmouse’ or ‘great titmouse’. The ‘tit’ component is of Norse origin, and means ‘small object or creature’, although an alternative view is that the word might have evolved in the fourteenth century as an echo of the bird’s song. ‘Mouse’, evolved from a Norse word ‘mose’ meaning “small bird”. The name ‘titomose’ first appeared in the fourteenth century and gradually evolved into ‘titmouse’. ",
      type: DYKType.birdNames,
      image: 'assets/bluetit1.png',
    ),
    DYK(
      question: "What bird used to be known as a ‘mud dabbler’?",
      answer:
          "This is an old country name for the nuthatch, and reflects the bird’s habit of plastering the entrance hole to its nest with mud. Other old country names were ‘mud stopper’ and ‘nut jobber’.",
      type: DYKType.birdNames,
      image: 'assets/nuthatch1.png',
    ),
    DYK(
      question: "What other old country names does a green woodpecker have?",
      answer:
          "The green woodpecker is sometimes known as the laughing bird, the yuckel or the yaffler. The last of these is an example of onomatopoeia (in which the word resembles the sound that it describes). The high-pitched yaffle is a sound resembling a loud laugh that the bird makes when it is startled, or when it is communicating with other green woodpeckers. Another example of onomatopoeia is the chiffchaff, a bird which migrates to Europe from west Africa and which is heard singing “chiffchaff chiffchaff” in the spring and summer. It can be heard in Redland Green.",
      type: DYKType.birdNames,
      image: 'assets/woodpecker.png',
    ),
    DYK(
      question: "What other names does a dunnock have?",
      answer:
          "The dunnock is also known as the hedge sparrow, or as the hedge accentor. An old country name for it was the shufflewing.",
      type: DYKType.birdNames,
      image: 'assets/dunnock1.png',
    ),
    DYK(
      question: "What are other examples of old country names for birds?",
      answer:
          "There are hundreds of old names for birds (as well as other animals and plants) which varied from county to county, or even from one village to another, and which have fallen out of use with the standardisation of nomenclature. Such names were often based on a bird’s appearance, behaviour or song and can be quite vivid. Some examples are ‘sharp saw’ and ‘bee-biter’ (great tit), ‘sheep-stare’ (starling), ‘Mavis’ (song thrush), ‘stumpy toddy’ (wren), ‘devil scritch’ (jay), ‘sweet william’, ‘king harry’ and ‘thistlefinch’ (goldfinch) and ‘bumbarrel’, ‘jack-in-a-bottle’ and ‘hedge mumruffin’ (long-tailed tit). ",
      type: DYKType.birdNames,
      image: 'assets/goldfinch3.png',
    ),
    DYK(
      question: "What is a passerine?",
      answer:
          "A passerine is any bird of the order Passeriformes. They are also known as perching birds and as songbirds. A distinguishing characteristic of the passerines is that they have three toes directed forwards and one directed backwards; an arrangement which makes it easier to perch on branches. Their legs have a further adaptation: a tendon, which runs from the toes to a muscle in the leg tightens when the leg bends. This causes the foot to curl and tighten when the bird lands on the branch. This is the reason that passerines can perch in trees while asleep without falling off. With more than 6,500 species belonging to more than 140 families, passerines include more than half of all bird species. Many of the birds in Redland Green, including the corvids (crow family) are passerines. However,  the sparrowhawk, the wood pigeon and the two species of woodpecker found here belong to different orders.",
      type: DYKType.passerines,
      image: 'assets/crow2.png',
    ),
    DYK(
      question: "How long do songbirds (passerines) live?",
      answer:
          "While some birds have extremely long lives (for example, most species of albatross live for over 50 years), many birds, including the passerines (‘songbirds’ or ‘perching birds’ - see the question ‘What is a passerine?’) have quite short lives. Robins, wrens, goldfinches, long-tailed tits, coal tits, nuthatches, pied flycatchers and pied wagtails live on average for two years. Blackbirds and song thrushes, the house sparrow, and blue and great tits average three years. Starlings live on average for five years. However, sometimes individuals greatly exceed the average lifespan. The oldest known pied flycatcher was over 16 years old and one pied wagtail reached 11. A house sparrow was recorded as over 13 years old. The oldest known robin reached 19, and the oldest known blackbird made it to 20 years old!",
      type: DYKType.passerines,
      image: 'assets/wren3.png',
    ),
    DYK(
      question:
          "What causes the chest and abdomen of some blue tits to be a brighter sulphur yellow than others?",
      answer:
          "Brightness varies according to how many yellow-green caterpillars are eaten, as such caterpillars contain high levels of the carotene (red, orange, yellow) pigments.",
      type: DYKType.passerines,
      image: 'assets/bluetit1.png',
    ),
    DYK(
      question: "What do goldfinches eat?",
      answer:
          "Goldfinches, with their long beaks, are seed specialists, and prefer the seeds of thistles, teasels, ragwort, dandelion and groundsels. Their scientific name (Carduelis carduelis) derives from the Latin for thistle (Cardus). In recent years, goldfinches have frequented gardens more often, to take advantage of the sunflower or nyger seeds often put in bird feeders. Males tend to have longer beaks than females, and this means that only males can extract seeds from teasels. After hatching, chicks are fed on insects and seeds, but as the chicks grow, the parents reduce the proportion of insects in their diet.",
      type: DYKType.passerines,
      image: 'assets/goldfinch4.png',
    ),
    DYK(
      question:
          "The brighter the yellow chest of the male great tit, the more attractive he is to female great tits. Why might this be?",
      answer:
          "Brighter yellow chests are caused by the presence of carotenoids, which are red, orange and yellow pigments produced by some plants. Carotenoids cannot be made by the bird, and have to be obtained from food. A bright yellow chest signifies to the female that the male is healthy and well fed, and will therefore also be able to feed his young brood. Colours also change after the annual moult. More dominant males also tend to have thicker stripes running down the middle of their undersides.",
      type: DYKType.passerines,
      image: 'assets/greattit1.png',
    ),
    DYK(
      question:
          "If a blue tit is raised in a nest of great tits, what is its future?",
      answer:
          "Initially, the bird is likely to be confused about its species. However, it will recover from this. It is likely to go on to breed.",
      type: DYKType.passerines,
      image: 'assets/bluetit3.png',
    ),
    DYK(
      question:
          "If a great tit is raised in a nest of blue tits, what is its future?",
      answer:
          "The great tit is likely to be successfully raised along with the rest of the brood, but it will be confused about its species. It won’t recover from this, and will not be able to breed.",
      type: DYKType.passerines,
      image: 'assets/greattit3.png',
    ),
    DYK(
      question: "Why did Victorians keep goldfinches as cage birds?",
      answer:
          "Goldfinches have a beautiful call and song, variously described as “liquid and silken” or a “melodic liquid twittering”. Because of their striking red and gold appearance, but particularly because of the beauty of their song, goldfinches were trapped in their thousands to be sold as caged birds. This, along with persecution, caused a severe decline in the bird’s numbers. One of the first campaigns of the Royal Society for the Protection of Birds, which formed in 1889, was to stop this trade.",
      type: DYKType.passerines,
      image: 'assets/goldfinch3.png',
    ),
    DYK(
      question: "How can you tell a dunnock from a house sparrow?",
      answer:
          "From a distance, dunnocks can be mistaken for house sparrows, as at 14cm long they are a similar size and have similar colours. The most significant difference in appearance is that they have a fine pointed bill like a robin, not the thick bill of the sparrow. Another clue is that house sparrows congregate in flocks, while dunnocks are usually seen alone or in pairs. While having a superficial resemblance to sparrows, they are not related to them, and belong to a different family. Dunnocks are common, and often found in gardens. However, they are shy birds, not venturing much out into the open, and so may not be noticed. They spend a lot of time near to the ground, and usually search for invertebrates and seeds on the ground. They generally fly at a low level. ",
      type: DYKType.passerines,
      image: 'assets/dunnock2.png',
    ),
    DYK(
      question: "Why do pied wagtails wag their tails up and down?",
      answer:
          "It has been suggested that the wagging tail might be a device to disturb insects as the wagtails move through the grass. Pied wagtails will also follow livestock such as cattle. Livestock both attract flying insects and also disturb them as they move around – which the wagtails then snap up.",
      type: DYKType.passerines,
      image: 'assets/wagtail.png',
    ),
    DYK(
      question: "What is the most widely distributed bird in the world?",
      answer:
          "The house sparrow. While native to most of Europe and part of Asia, it has been both deliberately and accidentally introduced to many other parts of the world, including Australasia, the Americas and Africa.",
      type: DYKType.passerines,
      image: 'assets/sparrow_3.png',
    ),
    DYK(
      question: "Why does the robin have such a brightly coloured breast?",
      answer:
          "Red feathers make birds much more vulnerable to predation, so it seems strange that robins have such bright chests. It’s thought, however, that the males’ red breasts could signal fitness and good survival skills to female robins, making them attractive potential mates. Adding support to this theory, it’s also been found that the older a male robin is, the larger the area of red on his chest. This also signals to other robins that the bird is a capable survivor. The larger area of red of older males may also signal to juveniles that they would be wise not to intrude into the bird’s territory. They are likely to lose any fight they take on! In many bird species, females are much less colourful than the males. This makes them harder to spot when they are incubating eggs – a clear survival strategy. When female robins incubate their eggs, their breast is normally out of view, facing downwards in close contact with the eggs. Only her brown back is showing – and this is excellent camouflage. Females also defend their territories, and so their red breast acts as a signal to other robins to keep out of their territory.",
      type: DYKType.passerines,
      image: 'assets/robin.png',
    ),
    DYK(
      question: "What is the mating behaviour of dunnocks?",
      answer:
          "Dunnocks are unlike most other song birds in that they have a variety of mating systems, and which may differ from one breeding season to another. In polyandry, females mate with two or more males. In polygyny, two or more females mate with one male, and only that male. They also practice polygynandry, in which males and females both mate with two or more mates, and monogamy (the female and male mate only with each other) in a breeding season. The system that is adopted depends upon a multiplicity of factors. One is the ratio of females to males in an area; another is the degree to which territories overlap. Monogamy is likely if one female and one male territory overlap. If two or three female territories overlap one male territory, the birds are likely to be polygamous. If two males co-operate to defend a territory that has several females, they will adopt polygynandry. Polyandry is the most common breeding system overall. With respect to an individual bird’s success in passing on its genes, polygyny favours males, and polyandry favours females. Another factor that influences breeding behaviour is the availability of food. Female territories reduce in size if food is plentiful. This makes it easier for males to have exclusive access to females. These factors mean that different mating behaviours will be adopted by the same birds in different breeding seasons.",
      type: DYKType.passerines,
      image: 'assets/dunnock2.png',
    ),
    DYK(
      question: "Why do robins feature so often on Christmas cards?",
      answer:
          "In the Victorian era, postmen wore red jackets. The tradition of sending cards began in the same era. The Victorians were very fond of robins, and robins began to feature on Christmas cards, delivering letters like tiny postmen. And so it was that postmen acquired the nickname of “robins”, thus beginning this long association.",
      type: DYKType.passerines,
      image: 'assets/robin1.png',
    ),
    DYK(
      question: "Why don’t I see greenfinches very often?",
      answer:
          "Sadly, greenfinches have suffered a very dramatic decline in their numbers, as the result of a disease called avian trichomonosis. This appeared in the UK in 2005 and is caused by a parasitic organism called Trichomonas gallinae which contaminates water and food. Birds afflicted with the parasite become unable to eat or drink and die of starvation or thirst. It’s thought that poor hygiene at bird feeders and bird baths contributed to the rapid spread of the disease, as it is highly contagious, with multiple ways of spreading between birds. It’s thought that around 12% of the UK’s former population of 4 million birds might have died as the result of this disease. There are concerns that the greenfinch could become endangered as the result of this disease. The greenfinch is not the only bird that may be affected by this parasite, although it appears to have suffered most seriously from it. Chaffinches, goldfinches, house sparrows and bullfinches can also be infected.",
      type: DYKType.passerines,
      image: 'assets/greenfinch.png',
    ),
    DYK(
      question:
          "Which birds on Redland Green are members of the corvid family?",
      answer:
          "On Redland Green, resident corvids, or members of the crow family, include carrion crows, jackdaws, jays and magpies. But occasionally, if you’re lucky, you might see or hear a raven (Corvus corax) flying high above the green. \n\nRavens used to be common residents of towns and cities, but persecution reduced their numbers to just 1,000 pairs, most of which were far from urban areas. Ravens have more recently been expanding their range once again, and they now number around 12,000 breeding pairs in the UK, a rare conservation success story. \n\nWhile they have not in general returned to urban areas, ravens now breed in the Avon Gorge. The raven is the largest of the corvids in the UK with a wingspan of 120-150cm: bigger than that of a buzzard. \n\nIt has a thick neck with shaggy throat feathers, a thick black bill, and a long, diamond or wedge-shaped tail. \n\nThe raven’s call is very distinctive: a deep “cronk”. By contrast, the carrion crow, the bird most likely to be confused with a raven, has a wingspan of 93-104cm. Its tail has a rounded fan-like shape, and its call is a higher pitched “caw caw”.",
      type: DYKType.corvids,
      image: 'assets/crow1.png',
    ),
    DYK(
      question: "Do carrion crows have predators?",
      answer:
          "As carrion crows are large birds with good defensive abilities and that will act together to drive potential predators away, they do not have many predators. While sparrowhawks nest in Redland, carrion crows are both larger and heavier than female sparrowhawks (which are larger and heavier than male sparrowhawks). Adult crows are not likely to be bothered by the presence of sparrowhawks, although sparrowhawks could attempt to prey on fledgling crows. However, birds such as the peregrine falcon and the golden eagle will hunt crows. Those crows local to Redland Green are unlikely to have much to worry about from avian predation, although perhaps they should not be too complacent, as peregrine falcons do breed in the Avon Gorge, and elsewhere in Bristol.",
      type: DYKType.corvids,
      image: 'assets/crow2.png',
    ),
    DYK(
      question: "How long do the UK’s corvids live?",
      answer:
          "On average, carrion crows, hooded crows and jays live for 4 years. Magpies and jackdaws average 5, rooks 6, and chough 7 years. Ravens live 10-15 years. However, as with other birds, there is great variability. The oldest known magpie lived for over 21 years, and a carrion crow lived to be 20.",
      type: DYKType.corvids,
      image: 'assets/magpie.png',
    ),
    DYK(
      question: "Does the jay have any predators in Redland Green?",
      answer:
          "Yes. A female sparrowhawk, despite being only slightly larger than a jay, but weighing more, is capable of catching and killing a jay. The much smaller male sparrowhawk would not be able to do this.",
      type: DYKType.corvids,
      image: 'assets/jay1.png',
    ),
    DYK(
      question: "Are there tawny owls in Redland?",
      answer:
          "Yes. Tawny owls can be heard in several places around Redland, including the green. The female’s ‘ke-wick’ and the male’s answering ‘hoo hoo’ can be heard at night. Tawnies favour deciduous woodland and nest in tree cavities and old buildings. Their main prey are mice and voles, but they also eat frogs and invertebrates, and sometimes small birds. They are ambush predators, and typically watch for prey from a perch, hunting at dusk and during the night. Females typically weigh about 500g and males rather less than 400g. There are estimated to be 50,000 breeding pairs in the UK. Their conservation status is amber. ",
      type: DYKType.birdsOfPrey,
      image: 'assets/owl.png',
    ),
    DYK(
      question: "Do sparrowhawks control how many small birds are in an area?",
      answer:
          "Although sparrowhawks prey on small birds, the short answer is “no, they don’t”. That’s because the number of sparrowhawks in a given area is limited by the “carrying capacity” of the habitat, which means that the amount of food and availability of nesting sites constrain how many individuals can survive. Young birds don’t pair and breed until there is vacant territory and plentiful food. This means that there is a close relationship between the number of small birds and sparrowhawks. Both increases and decreases in small bird populations are mirrored by corresponding changes in the number of sparrowhawks. Sparrowhawks are therefore indicators of the health of an ecosystem.",
      type: DYKType.birdsOfPrey,
      image: 'assets/sparrowhawk_2.png',
    ),
    DYK(
      question: "What’s the average lifespan of a sparrowhawk?",
      answer:
          "Sparrowhawks live on average for 4 years, but the oldest known sparrowhawk was over 20 years old when it died.",
      type: DYKType.birdsOfPrey,
      image: 'assets/sparrowhawk_3.png',
    ),
    DYK(
      question: "Are there any kestrels in Redland?",
      answer:
          "There aren’t any known sightings of kestrels in Redland, although kestrels have adapted to live in cities. The kestrel, a member of the falcon family, and with the long, scythe-like wings of that family, hunts by hovering 10-20 metres over grassland, spotting prey with its extremely sharp eyesight and plummeting to the ground in pursuit of a kill. Females are larger than males. Kestrels’ main prey are small mammals such as voles, shrews and mice, although they may also take small birds, lizards and invertebrates. When hovering, the kestrel’s tail is spread into a fan shape. Sparrowhawks do not hover, being ambush predators of mainly birds, so hunting technique is one of the ways of telling these two species apart."
          "\n\nKestrel populations have fallen, and they are now on the "
          "amber list of conservation concern. This may be because modern farming practices have eliminated wide field margins, therefore also eliminating the habitat of the kestrel’s main prey items. The UK population of kestrels may be as low as 30,000 pairs. ",
      type: DYKType.birdsOfPrey,
      image: 'assets/kestrel.png',
    ),
    DYK(
      question: "Which bird used to be known as a “quisty”?",
      answer:
          "The quisty is an old Somerset term for the woodpigeon. Other names for the woodpigeon were cushat, cushy-do and ringdow. ",
      type: DYKType.birdNames,
      image: 'assets/pigeon.png',
    ),
    DYK(
      question: "What is special about the long-tailed tit’s tail?",
      answer:
          "The long-tailed tit has the longest tail in proportion to its body of any British bird.",
      type: DYKType.passerines,
      image: 'assets/longtailedtit3.png',
    ),
    DYK(
      question: "Which famous composer had a pet starling?",
      answer:
          "The 18th century Austrian composer Wolfgang Amadeus Mozart had a pet starling. Starlings are famous for their ability as mimics, and in the wild will mimic other birds’ songs. Apparently, Mozart’s starling could sing a theme from the final movement of his 17th Piano Concerto.",
      type: DYKType.passerines,
      image: 'assets/starling2.png',
    ),
    DYK(
      question: "What is a ‘murmuration’?",
      answer:
          "Murmuration derives from the word “murmur”, which is a low sound, such as a rumble. In winter, many small groups of starlings join together at dusk to form a huge flock (thousands, or even millions of individuals) and fly in a tight, synchronised formation, making spectacular and ever shifting patterns in the sky for a variable period of time, before they descend into their chosen communal roost for the night. They roost communally both for protection and to share bodily warmth. The noise made by the beating of many pairs of wings as they perform these spectacular airborne manoeuvrings sounds rather like murmuring – hence the name. It is thought that starlings murmurate to avoid predation by dazzling and confusing their predators. These include peregrine falcons, marsh harriers and several other raptors.",
      type: DYKType.passerines,
      image: 'assets/starling4.png',
    ),
    DYK(
      question:
          "How do starlings avoid colliding with each other in a murmuration?",
      answer:
          "In a murmuration, starlings may be flying in close formation at speeds of over 90mph, and although the flock performs frequent changes of direction, collisions don’t happen. Although murmurations are far from fully understood, it is thought that a process known as “scale-free correlation” ensures individuals don’t collide. It seems that each bird in the flock communicates only with its 6 or 7 nearest neighbours, following their cues and copying their movements. A change of direction by a single bird will be copied by its neighbours, and then by their neighbours, thus propagating through all or most of the flock. An analogy with this is the way in which particles move in an avalanche, with the same process of scale-free correlation.",
      type: DYKType.passerines,
      image: 'assets/starling.png',
    ),
    DYK(
      question: "Do birds other than starlings form murmurations?",
      answer:
          "Many other birds, such as jackdaws, form large airborne flocks, particularly at dusk, but starlings are the only birds to show the particular swirling, synchronised formation known as a murmuration. So no, other birds do not murmurate.",
      type: DYKType.passerines,
      image: 'assets/jackdaw1.png',
    ),
    DYK(
      question: "Where can I see a murmuration?",
      answer:
          "The closest place to Bristol is probably Ham Wall or Shapwick Heath in Somerset. The winter murmuration there is thought to be the largest one in the UK and contains birds which have been feeding in a radius of 20 miles around the area, many of which are winter visitors from northern Europe and Scandinavia. Other famous murmuration sites include Brighton Pier in Sussex and RSPB Minsmere in Suffolk.",
      type: DYKType.passerines,
      image: 'assets/starling.png',
    ),
  ];
}
