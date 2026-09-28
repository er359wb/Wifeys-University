# Набор объектов - Guess Its Size

В этой папке 150 загадочных объектов и 8 эталонов для игры.

| Файл                | Что в нём                                                    |
|---------------------|--------------------------------------------------------------|
| `ObjectLibrary.lua` | Данные для игры: готовый ModuleScript для Roblox             |
| `README.md`         | Этот файл: правила для картинок и список всех объектов       |
| `images/`           | Сюда кладутся PNG-силуэты (создаёшь сам)                     |

Все размеры в `ObjectLibrary.lua` - в метрах. В таблицах ниже они для
удобства показаны в cm / m / km.

> Размеры примерные: средние значения для животных и предметов,
> официальные высоты для зданий и гор. Перед выпуском игры их стоит
> проверить, особенно у животных и динозавров - у них разброс большой.

---

## 1. Картинки - правила

Каждая картинка должна быть такой:

1. **PNG с прозрачным фоном.**
2. **Белый силуэт одним цветом.** Игра перекрашивает его в цвет игрока, а
   перекрасить можно только белый.
3. **Вид сбоку.** Длина - это ширина силуэта на картинке (слева направо),
   высота - его высота (снизу вверх). Исключения, где вид сверху: бабочка,
   орёл, птерозавр (размах крыльев), краб-паук (размах ног), пицца.
4. **Обрезана вплотную по краям силуэта** - без пустых полей.
5. **Пропорции совпадают с таблицей:** ширина картинки / высота картинки
   = длина / высота из таблицы. Игра растягивает картинку ровно под эти
   размеры, поэтому при других пропорциях силуэт исказится.
   Пример: жираф 5.5 m в высоту и 4 m в длину -> картинка, например,
   400 x 550 пикселей.
6. **Размер считается по всему силуэту:** с хвостом, рогами, ушами,
   антенной на крыше и т. д.
7. Не больше **1024 x 1024** пикселей.
8. **Имя файла - ровно как в таблице**, например `giraffe.png`.

Эталоны (файлы `ref_...png`) делаются по тем же правилам.

## 2. Как добавить картинки в игру

1. Положи готовые PNG в папку `images/`.
2. В Roblox Studio: **View -> Asset Manager -> Import** (Bulk Import),
   выбери все PNG.
3. Дождись модерации, потом у каждой картинки: правый клик ->
   **Copy Asset ID**.
4. Попроси Claude Code вписать ID: у каждого объекта в
   `ObjectLibrary.lua` поле `image = ""` должно стать
   `image = "rbxassetid://<номер>"`. Удобнее всего прислать список вида
   `giraffe.png = rbxassetid://1234567890`.

Пока у объекта `image = ""`, игра показывает вместо картинки плоскую
панель-заглушку нужных пропорций с названием объекта.

---

## 3. For Claude Code - how to use this pack

- `ObjectLibrary.lua` is a ModuleScript. Put it in **ServerScriptService**
  (or ServerStorage), never in ReplicatedStorage: the true sizes must not
  reach clients before the reveal (GAME_DESIGN.md, section 8.3).
- `ObjectLibrary.References` - the 8 reference objects.
  `ObjectLibrary.Objects` - the 150 mystery objects.
- Fields: `id`, `name` (shown in UI), `category`, `guess` (`"height"` or
  `"length"` - the size players guess), `height` and `length` in metres,
  `difficulty` (`easy` / `medium` / `hard`), `image` (asset id, empty
  until uploaded), `imageFile` (PNG file name).
- **Panel size:** a silhouette panel is `length` wide and `height` tall
  (times the stage scale). Use `ScaleType = Stretch` so the guessed size
  always matches the data exactly.
- **Placeholder:** if `image == ""`, show a plain flat panel of the same
  size with the object's `name` on it. Do not change Material and do not
  add textures.
- **Reference choice:** for each round pick the reference whose guessed
  size (its `height` or `length`, per its `guess`) is closest to the
  mystery object's guessed size on a log scale:
  `abs(math.log10(ref / mystery))` - smallest wins. The worst ratio in
  this pack is about 27x (Mount Everest vs Eiffel Tower).
- **Stage scale:** choose studs-per-metre each round so that both the
  reference and the mystery object (at the largest possible slider value)
  fit on the stage.
- Accuracy uses only the guessed size:
  `min(guess, true) / max(guess, true) * 100`.

---

## 4. Эталоны (8)

| Файл картинки | Название | Показываем | Высота | Длина |
|---------------|----------|------------|--------|-------|
| `ref_bank_card.png` | Bank Card | длину | 5.4 cm | 8.56 cm |
| `ref_a4_sheet.png` | A4 Sheet | высоту | 29.7 cm | 21 cm |
| `ref_adult_person.png` | Adult Person | высоту | 1.7 m | 50 cm |
| `ref_door.png` | Door | высоту | 2 m | 90 cm |
| `ref_car.png` | Car | длину | 1.5 m | 4.5 m |
| `ref_school_bus.png` | School Bus | длину | 3.2 m | 12 m |
| `ref_statue_of_liberty.png` | Statue of Liberty | высоту | 93 m | 50 m |
| `ref_eiffel_tower.png` | Eiffel Tower | высоту | 330 m | 125 m |

## 5. Загадочные объекты (150)

### Предметы (Everyday)

| # | Файл картинки | Название | Угадываем | Высота | Длина | Сложность |
|---|---------------|----------|-----------|--------|-------|-----------|
| 1 | `pencil.png` | Pencil | длину | 0.7 cm | 19 cm | easy |
| 2 | `paperclip.png` | Paperclip | длину | 0.8 cm | 3.3 cm | medium |
| 3 | `aa_battery.png` | AA Battery | длину | 1.45 cm | 5.05 cm | medium |
| 4 | `smartphone.png` | Smartphone | высоту | 14.7 cm | 7.2 cm | easy |
| 5 | `coffee_mug.png` | Coffee Mug | высоту | 9.5 cm | 12 cm | easy |
| 6 | `toothbrush.png` | Toothbrush | длину | 2 cm | 19 cm | easy |
| 7 | `tennis_ball.png` | Tennis Ball | высоту | 6.7 cm | 6.7 cm | medium |
| 8 | `basketball.png` | Basketball | высоту | 24 cm | 24 cm | easy |
| 9 | `soccer_ball.png` | Soccer Ball | высоту | 22 cm | 22 cm | easy |
| 10 | `golf_ball.png` | Golf Ball | высоту | 4.3 cm | 4.3 cm | medium |
| 11 | `acoustic_guitar.png` | Acoustic Guitar | длину | 38 cm | 1 m | medium |
| 12 | `violin.png` | Violin | длину | 21 cm | 59 cm | medium |
| 13 | `grand_piano.png` | Grand Piano | длину | 1 m | 2.74 m | hard |
| 14 | `refrigerator.png` | Refrigerator | высоту | 1.8 m | 70 cm | easy |
| 15 | `washing_machine.png` | Washing Machine | высоту | 85 cm | 60 cm | easy |
| 16 | `bicycle.png` | Bicycle | длину | 1.05 m | 1.75 m | easy |
| 17 | `office_chair.png` | Office Chair | высоту | 1.1 m | 65 cm | easy |
| 18 | `traffic_cone.png` | Traffic Cone | высоту | 70 cm | 36 cm | medium |
| 19 | `fire_hydrant.png` | Fire Hydrant | высоту | 75 cm | 45 cm | medium |
| 20 | `lego_brick_2x4.png` | LEGO Brick 2x4 | длину | 1.13 cm | 3.2 cm | hard |
| 21 | `dice.png` | Dice | высоту | 1.6 cm | 1.6 cm | medium |
| 22 | `skateboard.png` | Skateboard | длину | 10 cm | 80 cm | easy |
| 23 | `surfboard.png` | Surfboard | длину | 10 cm | 1.8 m | medium |
| 24 | `bathtub.png` | Bathtub | длину | 55 cm | 1.7 m | medium |
| 25 | `king_size_bed.png` | King Size Bed | длину | 60 cm | 2.03 m | medium |
| 26 | `wine_bottle.png` | Wine Bottle | высоту | 30 cm | 7.6 cm | easy |
| 27 | `soda_can.png` | Soda Can | высоту | 12.2 cm | 6.6 cm | easy |
| 28 | `computer_keyboard.png` | Computer Keyboard | длину | 3 cm | 44 cm | medium |
| 29 | `tennis_racket.png` | Tennis Racket | длину | 27 cm | 68.5 cm | medium |
| 30 | `bowling_pin.png` | Bowling Pin | высоту | 38.1 cm | 12.1 cm | medium |

### Еда (Food)

| # | Файл картинки | Название | Угадываем | Высота | Длина | Сложность |
|---|---------------|----------|-----------|--------|-------|-----------|
| 31 | `banana.png` | Banana | длину | 4 cm | 19 cm | easy |
| 32 | `apple.png` | Apple | высоту | 8 cm | 8 cm | easy |
| 33 | `watermelon.png` | Watermelon | длину | 25 cm | 40 cm | medium |
| 34 | `pineapple.png` | Pineapple | высоту | 40 cm | 15 cm | medium |
| 35 | `strawberry.png` | Strawberry | высоту | 3.5 cm | 3 cm | medium |
| 36 | `chicken_egg.png` | Chicken Egg | высоту | 5.7 cm | 4.3 cm | easy |
| 37 | `large_pizza.png` | Large Pizza | длину | 3 cm | 36 cm | easy |
| 38 | `baguette.png` | Baguette | длину | 6 cm | 65 cm | medium |
| 39 | `hot_dog.png` | Hot Dog | длину | 5 cm | 15 cm | medium |
| 40 | `coconut.png` | Coconut | высоту | 25 cm | 20 cm | medium |
| 41 | `grain_of_rice.png` | Grain of Rice | длину | 0.2 cm | 0.6 cm | hard |
| 42 | `pumpkin.png` | Pumpkin | высоту | 30 cm | 35 cm | easy |

### Животные (Animals)

| # | Файл картинки | Название | Угадываем | Высота | Длина | Сложность |
|---|---------------|----------|-----------|--------|-------|-----------|
| 43 | `ant.png` | Ant | длину | 0.2 cm | 0.5 cm | medium |
| 44 | `honeybee.png` | Honeybee | длину | 0.6 cm | 1.3 cm | medium |
| 45 | `ladybug.png` | Ladybug | длину | 0.4 cm | 0.7 cm | medium |
| 46 | `monarch_butterfly.png` | Monarch Butterfly | длину | 7 cm | 10 cm | medium |
| 47 | `hummingbird.png` | Hummingbird | длину | 4 cm | 8 cm | hard |
| 48 | `house_mouse.png` | House Mouse | длину | 4 cm | 17 cm | medium |
| 49 | `hamster.png` | Hamster | длину | 7 cm | 15 cm | medium |
| 50 | `chicken.png` | Chicken | высоту | 40 cm | 40 cm | easy |
| 51 | `house_cat.png` | House Cat | высоту | 30 cm | 70 cm | easy |
| 52 | `chihuahua.png` | Chihuahua | высоту | 25 cm | 35 cm | medium |
| 53 | `labrador_retriever.png` | Labrador Retriever | высоту | 80 cm | 1.1 m | easy |
| 54 | `emperor_penguin.png` | Emperor Penguin | высоту | 1.15 m | 50 cm | medium |
| 55 | `ostrich.png` | Ostrich | высоту | 2.5 m | 1.8 m | medium |
| 56 | `red_kangaroo.png` | Red Kangaroo | высоту | 1.6 m | 1.8 m | medium |
| 57 | `horse.png` | Horse | высоту | 2.3 m | 2.4 m | medium |
| 58 | `cow.png` | Cow | высоту | 1.5 m | 2.5 m | medium |
| 59 | `grizzly_bear_standing.png` | Grizzly Bear (standing) | высоту | 2.4 m | 90 cm | medium |
| 60 | `gorilla_standing.png` | Gorilla (standing) | высоту | 1.7 m | 80 cm | medium |
| 61 | `giraffe.png` | Giraffe | высоту | 5.5 m | 4 m | medium |
| 62 | `african_elephant.png` | African Elephant | высоту | 3.4 m | 6.5 m | medium |
| 63 | `hippopotamus.png` | Hippopotamus | длину | 1.5 m | 4 m | hard |
| 64 | `white_rhinoceros.png` | White Rhinoceros | длину | 1.8 m | 4 m | hard |
| 65 | `grevys_zebra.png` | Grevy's Zebra | длину | 1.9 m | 2.7 m | medium |
| 66 | `saltwater_crocodile.png` | Saltwater Crocodile | длину | 50 cm | 5 m | hard |
| 67 | `reticulated_python.png` | Reticulated Python | длину | 20 cm | 6 m | hard |
| 68 | `great_white_shark.png` | Great White Shark | длину | 1.5 m | 4.5 m | medium |
| 69 | `orca.png` | Orca | длину | 2.8 m | 7.5 m | medium |
| 70 | `blue_whale.png` | Blue Whale | длину | 4.5 m | 25 m | medium |
| 71 | `japanese_spider_crab.png` | Japanese Spider Crab | длину | 80 cm | 3 m | hard |
| 72 | `giant_squid.png` | Giant Squid | длину | 1 m | 12 m | hard |
| 73 | `bald_eagle_wingspan.png` | Bald Eagle (wingspan) | длину | 80 cm | 2 m | medium |
| 74 | `flamingo.png` | Flamingo | высоту | 1.4 m | 80 cm | medium |
| 75 | `moose.png` | Moose | высоту | 2.5 m | 3 m | hard |
| 76 | `dromedary_camel.png` | Dromedary Camel | высоту | 2.2 m | 3 m | medium |
| 77 | `bengal_tiger.png` | Bengal Tiger | длину | 1.1 m | 3 m | hard |
| 78 | `polar_bear.png` | Polar Bear | длину | 1.5 m | 2.5 m | medium |
| 79 | `komodo_dragon.png` | Komodo Dragon | длину | 40 cm | 2.6 m | hard |

### Динозавры (Dinosaurs)

| # | Файл картинки | Название | Угадываем | Высота | Длина | Сложность |
|---|---------------|----------|-----------|--------|-------|-----------|
| 80 | `tyrannosaurus_rex.png` | Tyrannosaurus Rex | длину | 4 m | 12.3 m | medium |
| 81 | `triceratops.png` | Triceratops | длину | 3 m | 9 m | hard |
| 82 | `stegosaurus.png` | Stegosaurus | длину | 4 m | 9 m | hard |
| 83 | `velociraptor.png` | Velociraptor | длину | 50 cm | 2 m | medium |
| 84 | `brachiosaurus.png` | Brachiosaurus | высоту | 12.5 m | 22 m | hard |
| 85 | `argentinosaurus.png` | Argentinosaurus | длину | 8 m | 35 m | hard |
| 86 | `woolly_mammoth.png` | Woolly Mammoth | высоту | 3.3 m | 5 m | medium |
| 87 | `pteranodon_wingspan.png` | Pteranodon (wingspan) | длину | 1.8 m | 6 m | hard |
| 88 | `megalodon.png` | Megalodon | длину | 4 m | 15 m | hard |
| 89 | `spinosaurus.png` | Spinosaurus | длину | 5 m | 14 m | hard |

### Транспорт (Transport)

| # | Файл картинки | Название | Угадываем | Высота | Длина | Сложность |
|---|---------------|----------|-----------|--------|-------|-----------|
| 90 | `motorcycle.png` | Motorcycle | длину | 1.1 m | 2.1 m | medium |
| 91 | `pickup_truck.png` | Pickup Truck | длину | 1.95 m | 5.9 m | medium |
| 92 | `double_decker_bus.png` | Double-Decker Bus | высоту | 4.4 m | 11.2 m | medium |
| 93 | `semi_truck_with_trailer.png` | Semi Truck with Trailer | длину | 4.1 m | 21 m | hard |
| 94 | `m1_abrams_tank.png` | M1 Abrams Tank | длину | 2.4 m | 9.8 m | hard |
| 95 | `hot_air_balloon.png` | Hot Air Balloon | высоту | 25 m | 18 m | hard |
| 96 | `cessna_172.png` | Cessna 172 | длину | 2.7 m | 8.3 m | hard |
| 97 | `boeing_747.png` | Boeing 747 | длину | 19.4 m | 70.7 m | medium |
| 98 | `airbus_a380.png` | Airbus A380 | длину | 24.1 m | 72.7 m | medium |
| 99 | `space_shuttle.png` | Space Shuttle | длину | 17.3 m | 37.2 m | hard |
| 100 | `saturn_v_rocket.png` | Saturn V Rocket | высоту | 110.6 m | 10.1 m | hard |
| 101 | `falcon_9_rocket.png` | Falcon 9 Rocket | высоту | 70 m | 3.7 m | hard |
| 102 | `titanic.png` | Titanic | длину | 53 m | 269 m | medium |
| 103 | `nimitz_aircraft_carrier.png` | Nimitz Aircraft Carrier | длину | 60 m | 333 m | hard |
| 104 | `largest_container_ship.png` | Largest Container Ship | длину | 70 m | 400 m | hard |
| 105 | `ohio_class_submarine.png` | Ohio-Class Submarine | длину | 12 m | 170 m | hard |
| 106 | `icon_of_the_seas_cruise_ship.png` | Icon of the Seas Cruise Ship | длину | 70 m | 365 m | hard |
| 107 | `canoe.png` | Canoe | длину | 40 cm | 5 m | medium |
| 108 | `venetian_gondola.png` | Venetian Gondola | длину | 1.5 m | 11 m | hard |
| 109 | `subway_car.png` | Subway Car | длину | 3.7 m | 18 m | medium |
| 110 | `formula_1_car.png` | Formula 1 Car | длину | 95 cm | 5.6 m | medium |
| 111 | `monster_truck.png` | Monster Truck | высоту | 3.5 m | 5.5 m | medium |

### Здания (Buildings)

| # | Файл картинки | Название | Угадываем | Высота | Длина | Сложность |
|---|---------------|----------|-----------|--------|-------|-----------|
| 112 | `great_pyramid_of_giza.png` | Great Pyramid of Giza | высоту | 139 m | 230 m | medium |
| 113 | `burj_khalifa.png` | Burj Khalifa | высоту | 828 m | 150 m | medium |
| 114 | `empire_state_building.png` | Empire State Building | высоту | 443 m | 130 m | medium |
| 115 | `big_ben.png` | Big Ben | высоту | 96 m | 12 m | medium |
| 116 | `leaning_tower_of_pisa.png` | Leaning Tower of Pisa | высоту | 56 m | 20 m | medium |
| 117 | `christ_the_redeemer_with_pedestal.png` | Christ the Redeemer (with pedestal) | высоту | 38 m | 28 m | hard |
| 118 | `colosseum.png` | Colosseum | высоту | 48 m | 189 m | hard |
| 119 | `taj_mahal.png` | Taj Mahal | высоту | 73 m | 95 m | hard |
| 120 | `sydney_opera_house.png` | Sydney Opera House | высоту | 65 m | 183 m | hard |
| 121 | `golden_gate_bridge_tower_height.png` | Golden Gate Bridge (tower height) | высоту | 227 m | 2.74 km | hard |
| 122 | `tower_bridge.png` | Tower Bridge | высоту | 65 m | 244 m | hard |
| 123 | `cn_tower.png` | CN Tower | высоту | 553 m | 60 m | medium |
| 124 | `shanghai_tower.png` | Shanghai Tower | высоту | 632 m | 128 m | hard |
| 125 | `petronas_towers.png` | Petronas Towers | высоту | 452 m | 110 m | hard |
| 126 | `one_world_trade_center.png` | One World Trade Center | высоту | 541 m | 61 m | hard |
| 127 | `tokyo_skytree.png` | Tokyo Skytree | высоту | 634 m | 68 m | hard |
| 128 | `space_needle.png` | Space Needle | высоту | 184 m | 42 m | hard |
| 129 | `gateway_arch.png` | Gateway Arch | высоту | 192 m | 192 m | medium |
| 130 | `mount_rushmore_one_head.png` | Mount Rushmore (one head) | высоту | 18 m | 12 m | hard |
| 131 | `great_sphinx_of_giza.png` | Great Sphinx of Giza | длину | 20 m | 73 m | hard |
| 132 | `london_eye.png` | London Eye | высоту | 135 m | 120 m | medium |
| 133 | `pont_du_gard.png` | Pont du Gard | высоту | 49 m | 275 m | hard |
| 134 | `moai_statue.png` | Moai Statue | высоту | 4 m | 1.6 m | hard |
| 135 | `hollywood_sign.png` | Hollywood Sign | высоту | 13.7 m | 107 m | hard |

### Природа (Nature)

| # | Файл картинки | Название | Угадываем | Высота | Длина | Сложность |
|---|---------------|----------|-----------|--------|-------|-----------|
| 136 | `mount_everest.png` | Mount Everest | высоту | 8.85 km | 20 km | medium |
| 137 | `mount_fuji.png` | Mount Fuji | высоту | 3.78 km | 35 km | hard |
| 138 | `mount_kilimanjaro.png` | Mount Kilimanjaro | высоту | 5.89 km | 40 km | hard |
| 139 | `angel_falls.png` | Angel Falls | высоту | 979 m | 150 m | hard |
| 140 | `niagara_falls_horseshoe.png` | Niagara Falls (Horseshoe) | высоту | 51 m | 670 m | medium |
| 141 | `hyperion_tallest_tree.png` | Hyperion (tallest tree) | высоту | 116 m | 30 m | hard |
| 142 | `general_sherman_tree.png` | General Sherman Tree | высоту | 84 m | 30 m | hard |
| 143 | `baobab_tree.png` | Baobab Tree | высоту | 25 m | 20 m | hard |
| 144 | `sunflower.png` | Sunflower | высоту | 3 m | 60 cm | medium |
| 145 | `grand_canyon_depth.png` | Grand Canyon (depth) | высоту | 1.8 km | 16 km | hard |
| 146 | `old_faithful_geyser_eruption.png` | Old Faithful Geyser (eruption) | высоту | 40 m | 10 m | hard |
| 147 | `coconut_palm.png` | Coconut Palm | высоту | 25 m | 8 m | medium |
| 148 | `saguaro_cactus.png` | Saguaro Cactus | высоту | 12 m | 5 m | hard |
| 149 | `rafflesia_flower.png` | Rafflesia Flower | длину | 30 cm | 1 m | hard |
| 150 | `giant_bamboo.png` | Giant Bamboo | высоту | 30 m | 3 m | hard |
