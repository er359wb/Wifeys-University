# Набор объектов - Guess Its Size

В этой папке 160 объектов для игры. Один общий список: любой объект можно
угадывать, а 15 обычных, всем знакомых объектов (`reference = true`) ещё и
показываются как эталон.

| Файл                | Что в нём                                                    |
|---------------------|--------------------------------------------------------------|
| `ObjectLibrary.lua` | Данные для игры: готовый ModuleScript для Roblox             |
| `README.md`         | Этот файл: правила для картинок и список всех объектов       |
| `images/`           | PNG-силуэты (на твоём компьютере; в репозиторий не выкладываются) |

Все размеры в `ObjectLibrary.lua` - в метрах. В таблицах ниже они для
удобства показаны в cm / m / km.

> Размеры примерные: средние значения для животных и предметов,
> официальные высоты для зданий и гор. Перед выпуском игры их стоит
> проверить, особенно у животных и динозавров - у них разброс большой.

---

## 1. Картинки - правила

Каждая картинка должна быть такой:

1. **PNG с прозрачным фоном.**
2. **Белая основа с серыми деталями** (только белый и оттенки серого, без
   цвета). Игра умножает картинку на цвет игрока: белое становится цветом
   игрока, серые детали - его более тёмным оттенком. Так объект узнаётся
   по деталям (полоски тигра, окна автобуса, дверца стиральной машины), а
   не только по контуру. Самый тёмный оттенок - не темнее ~35% серого,
   иначе детали станут почти чёрными.
3. **Вид сбоку.** Длина - это ширина силуэта на картинке (слева направо),
   высота - его высота (снизу вверх). Исключения, где вид сверху: бабочка,
   орёл, птерозавр (размах крыльев), краб-паук (размах ног), пицца.
4. **Обрезана вплотную по краям силуэта** - без пустых полей.
5. **Пропорции берутся из картинки.** Точным должен быть только размер,
   который угадывают (высота или длина). Второй размер в таблице
   пересчитан по пропорциям готовой картинки - у объектов с отметкой
   "есть" он уже подогнан. Если заменишь картинку, второй размер нужно
   пересчитать заново.
6. **Размер считается по всему силуэту:** с хвостом, рогами, ушами,
   антенной на крыше и т. д.
7. Не больше **1024 x 1024** пикселей.
8. **Имя файла - ровно как в таблице**, например `giraffe.png`.


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
- `ObjectLibrary.Objects` - one list of 160 objects. Every object can be
  the mystery object. Objects with `reference = true` (15 everyday,
  well-known things) can also be the reference.
- Fields: `id`, `name` (shown in UI), `category`, `guess` (`"height"` or
  `"length"` - the size players guess), `height` and `length` in metres,
  `difficulty` (`easy` / `medium` / `hard`), `reference` (can be the
  reference), `image` (asset id, empty
  until uploaded), `imageFile` (PNG file name).
- **Panel size:** a silhouette panel is `length` wide and `height` tall
  (times the stage scale). Use `ScaleType = Stretch` so the guessed size
  always matches the data exactly.
- **Placeholder:** if `image == ""`, show a plain flat panel of the same
  size with the object's `name` on it. Do not change Material and do not
  add textures.
- **Reference choice:** for each round pick, among objects with
  `reference = true` and a different `id` from the mystery object, the one
  whose guessed size (its `height` or `length`, per its `guess`) is closest
  to the mystery object's guessed size on a log scale:
  `abs(math.log10(ref / mystery))` - smallest wins. The worst ratio in
  this pack is about 11x (Mount Everest vs Burj Khalifa).
- **Stage scale:** choose studs-per-metre each round so that both the
  reference and the mystery object (at the largest possible slider value)
  fit on the stage.
- Accuracy uses only the guessed size:
  `min(guess, true) / max(guess, true) * 100`.

---

## 4. Эталоны (7)


### Предметы (Everyday) - 35

| # | Файл картинки | Название | Угадываем | Высота | Длина | Эталон | Картинка |
|---|---------------|----------|-----------|--------|-------|--------|----------|
| 1 | `one_cent_coin.png` | One Cent Coin | высоту | 1.91 cm | 1.91 cm | да | есть |
| 2 | `bank_card.png` | Bank Card | длину | 5.4 cm | 8.56 cm | да | есть |
| 3 | `a4_sheet.png` | A4 Sheet | высоту | 29.7 cm | 21 cm | да | есть |
| 4 | `door.png` | Door | высоту | 2 m | 90 cm | да | есть |
| 5 | `adult_person.png` | Adult Person | высоту | 1.7 m | 53.2 cm | да | есть |
| 6 | `pencil.png` | Pencil | длину | 0.705 cm | 19 cm | да | есть |
| 7 | `paperclip.png` | Paperclip | длину | 1.52 cm | 3.3 cm |  | есть |
| 8 | `aa_battery.png` | AA Battery | длину | 1.45 cm | 5.05 cm | да | есть |
| 9 | `iphone_18.png` | iPhone 18 | высоту | 15 cm | 7.21 cm | да | есть |
| 10 | `coffee_mug.png` | Coffee Mug | высоту | 9.5 cm | 12 cm |  |  |
| 11 | `toothbrush.png` | Toothbrush | длину | 2 cm | 19 cm |  |  |
| 12 | `tennis_ball.png` | Tennis Ball | высоту | 6.7 cm | 6.7 cm |  |  |
| 13 | `basketball.png` | Basketball | высоту | 24 cm | 24 cm |  |  |
| 14 | `soccer_ball.png` | Soccer Ball | высоту | 22 cm | 22 cm |  |  |
| 15 | `golf_ball.png` | Golf Ball | высоту | 4.3 cm | 4.3 cm |  |  |
| 16 | `acoustic_guitar.png` | Acoustic Guitar | длину | 38 cm | 1 m |  |  |
| 17 | `violin.png` | Violin | длину | 21 cm | 59 cm |  |  |
| 18 | `grand_piano.png` | Grand Piano | длину | 1 m | 2.74 m |  |  |
| 19 | `refrigerator.png` | Refrigerator | высоту | 1.8 m | 70 cm |  |  |
| 20 | `washing_machine.png` | Washing Machine | высоту | 85 cm | 60 cm | да | есть |
| 21 | `bicycle.png` | Bicycle | длину | 1.05 m | 1.75 m |  |  |
| 22 | `office_chair.png` | Office Chair | высоту | 1.1 m | 65 cm |  |  |
| 23 | `traffic_cone.png` | Traffic Cone | высоту | 70 cm | 36 cm |  |  |
| 24 | `fire_hydrant.png` | Fire Hydrant | высоту | 75 cm | 45 cm |  |  |
| 25 | `lego_brick_2x4.png` | LEGO Brick 2x4 | длину | 1.13 cm | 3.2 cm |  | есть |
| 26 | `dice.png` | Dice | высоту | 1.6 cm | 1.6 cm |  |  |
| 27 | `skateboard.png` | Skateboard | длину | 10 cm | 80 cm |  |  |
| 28 | `surfboard.png` | Surfboard | длину | 10 cm | 1.8 m |  |  |
| 29 | `bathtub.png` | Bathtub | длину | 55 cm | 1.7 m |  |  |
| 30 | `king_size_bed.png` | King Size Bed | длину | 60 cm | 2.03 m |  |  |
| 31 | `wine_bottle.png` | Wine Bottle | высоту | 30 cm | 7.6 cm |  |  |
| 32 | `soda_can.png` | Soda Can | высоту | 12.2 cm | 6.6 cm |  |  |
| 33 | `computer_keyboard.png` | Computer Keyboard | длину | 3 cm | 44 cm |  |  |
| 34 | `tennis_racket.png` | Tennis Racket | длину | 27 cm | 68.5 cm |  |  |
| 35 | `bowling_pin.png` | Bowling Pin | высоту | 38.1 cm | 12.1 cm |  |  |

### Еда (Food) - 12

| # | Файл картинки | Название | Угадываем | Высота | Длина | Эталон | Картинка |
|---|---------------|----------|-----------|--------|-------|--------|----------|
| 36 | `banana.png` | Banana | длину | 10.8 cm | 19 cm |  | есть |
| 37 | `apple.png` | Apple | высоту | 8 cm | 8 cm |  |  |
| 38 | `watermelon.png` | Watermelon | длину | 25 cm | 40 cm |  |  |
| 39 | `pineapple.png` | Pineapple | высоту | 40 cm | 15 cm |  |  |
| 40 | `strawberry.png` | Strawberry | высоту | 3.5 cm | 3 cm |  |  |
| 41 | `chicken_egg.png` | Chicken Egg | высоту | 5.7 cm | 4.3 cm |  |  |
| 42 | `large_pizza.png` | Large Pizza | длину | 3 cm | 36 cm |  |  |
| 43 | `baguette.png` | Baguette | длину | 6 cm | 65 cm |  |  |
| 44 | `hot_dog.png` | Hot Dog | длину | 6.61 cm | 15 cm |  | есть |
| 45 | `coconut.png` | Coconut | высоту | 25 cm | 20 cm |  |  |
| 46 | `grain_of_rice.png` | Grain of Rice | длину | 0.2 cm | 0.6 cm |  | есть |
| 47 | `pumpkin.png` | Pumpkin | высоту | 30 cm | 35 cm |  |  |

### Животные (Animals) - 38

| # | Файл картинки | Название | Угадываем | Высота | Длина | Эталон | Картинка |
|---|---------------|----------|-----------|--------|-------|--------|----------|
| 48 | `ant.png` | Ant | длину | 0.2 cm | 0.5 cm |  |  |
| 49 | `honeybee.png` | Honeybee | длину | 0.6 cm | 1.3 cm |  |  |
| 50 | `ladybug.png` | Ladybug | длину | 0.4 cm | 0.7 cm |  |  |
| 51 | `monarch_butterfly.png` | Monarch Butterfly | длину | 7 cm | 10 cm |  |  |
| 52 | `hummingbird.png` | Hummingbird | длину | 4 cm | 8 cm |  |  |
| 53 | `house_mouse.png` | House Mouse | длину | 4 cm | 17 cm |  |  |
| 54 | `hamster.png` | Hamster | длину | 7 cm | 15 cm |  |  |
| 55 | `chicken.png` | Chicken | высоту | 40 cm | 40 cm |  |  |
| 56 | `house_cat.png` | House Cat | высоту | 30 cm | 70 cm |  |  |
| 57 | `chihuahua.png` | Chihuahua | высоту | 25 cm | 35 cm |  |  |
| 58 | `labrador_retriever.png` | Labrador Retriever | высоту | 80 cm | 1.1 m |  |  |
| 59 | `emperor_penguin.png` | Emperor Penguin | высоту | 1.15 m | 50 cm |  |  |
| 60 | `ostrich.png` | Ostrich | высоту | 2.5 m | 1.8 m |  |  |
| 61 | `red_kangaroo.png` | Red Kangaroo | высоту | 1.6 m | 1.8 m |  |  |
| 62 | `horse.png` | Horse | высоту | 2.3 m | 2.4 m |  |  |
| 63 | `cow.png` | Cow | высоту | 1.5 m | 2.5 m |  |  |
| 64 | `grizzly_bear_standing.png` | Grizzly Bear (standing) | высоту | 2.4 m | 90 cm |  |  |
| 65 | `gorilla_standing.png` | Gorilla (standing) | высоту | 1.7 m | 80 cm |  |  |
| 66 | `giraffe.png` | Giraffe | высоту | 5.5 m | 5.19 m |  | есть |
| 67 | `african_elephant.png` | African Elephant | высоту | 3.4 m | 6.5 m |  |  |
| 68 | `hippopotamus.png` | Hippopotamus | длину | 1.5 m | 4 m |  |  |
| 69 | `white_rhinoceros.png` | White Rhinoceros | длину | 1.8 m | 4 m |  |  |
| 70 | `grevys_zebra.png` | Grevy's Zebra | длину | 1.9 m | 2.7 m |  |  |
| 71 | `saltwater_crocodile.png` | Saltwater Crocodile | длину | 50 cm | 5 m |  |  |
| 72 | `reticulated_python.png` | Reticulated Python | длину | 20 cm | 6 m |  |  |
| 73 | `great_white_shark.png` | Great White Shark | длину | 1.5 m | 4.5 m |  |  |
| 74 | `orca.png` | Orca | длину | 2.8 m | 7.5 m |  |  |
| 75 | `blue_whale.png` | Blue Whale | длину | 4.5 m | 25 m |  |  |
| 76 | `japanese_spider_crab.png` | Japanese Spider Crab | длину | 2.46 m | 3 m |  | есть |
| 77 | `giant_squid.png` | Giant Squid | длину | 1 m | 12 m |  |  |
| 78 | `bald_eagle_wingspan.png` | Bald Eagle (wingspan) | длину | 80 cm | 2 m |  |  |
| 79 | `flamingo.png` | Flamingo | высоту | 1.4 m | 1.15 m |  | есть |
| 80 | `moose.png` | Moose | высоту | 2.5 m | 3.79 m |  | есть |
| 81 | `dromedary_camel.png` | Dromedary Camel | высоту | 2.2 m | 3 m |  |  |
| 82 | `bengal_tiger.png` | Bengal Tiger | длину | 1.75 m | 3 m |  | есть |
| 83 | `polar_bear.png` | Polar Bear | длину | 1.5 m | 2.5 m |  |  |
| 84 | `komodo_dragon.png` | Komodo Dragon | длину | 40 cm | 2.6 m |  |  |
| 85 | `atlantic_salmon.png` | Atlantic Salmon | длину | 23.5 cm | 75 cm |  | есть |

### Динозавры (Dinosaurs) - 10

| # | Файл картинки | Название | Угадываем | Высота | Длина | Эталон | Картинка |
|---|---------------|----------|-----------|--------|-------|--------|----------|
| 86 | `tyrannosaurus_rex.png` | Tyrannosaurus Rex | высоту | 4.5 m | 4.08 m |  | есть |
| 87 | `triceratops.png` | Triceratops | длину | 3 m | 9 m |  |  |
| 88 | `stegosaurus.png` | Stegosaurus | длину | 4 m | 9 m |  |  |
| 89 | `velociraptor.png` | Velociraptor | длину | 50 cm | 2 m |  |  |
| 90 | `brachiosaurus.png` | Brachiosaurus | высоту | 12.5 m | 22 m |  |  |
| 91 | `argentinosaurus.png` | Argentinosaurus | длину | 8 m | 35 m |  |  |
| 92 | `woolly_mammoth.png` | Woolly Mammoth | высоту | 3.3 m | 5 m |  |  |
| 93 | `pteranodon_wingspan.png` | Pteranodon (wingspan) | длину | 1.8 m | 6 m |  |  |
| 94 | `megalodon.png` | Megalodon | длину | 4 m | 15 m |  |  |
| 95 | `spinosaurus.png` | Spinosaurus | длину | 5 m | 14 m |  |  |

### Транспорт (Transport) - 24

| # | Файл картинки | Название | Угадываем | Высота | Длина | Эталон | Картинка |
|---|---------------|----------|-----------|--------|-------|--------|----------|
| 96 | `car.png` | Car | длину | 1.47 m | 4.5 m | да | есть |
| 97 | `school_bus.png` | School Bus | длину | 4.29 m | 12 m | да | есть |
| 98 | `motorcycle.png` | Motorcycle | длину | 1.1 m | 2.1 m |  |  |
| 99 | `pickup_truck.png` | Pickup Truck | длину | 1.95 m | 5.9 m |  |  |
| 100 | `double_decker_bus.png` | Double-Decker Bus | высоту | 4.4 m | 11.2 m |  |  |
| 101 | `semi_truck_with_trailer.png` | Semi Truck with Trailer | длину | 4.1 m | 21 m |  |  |
| 102 | `m1_abrams_tank.png` | M1 Abrams Tank | длину | 2.4 m | 9.8 m |  |  |
| 103 | `hot_air_balloon.png` | Hot Air Balloon | высоту | 25 m | 18 m |  |  |
| 104 | `cessna_172.png` | Cessna 172 | длину | 2.7 m | 8.3 m |  |  |
| 105 | `boeing_747.png` | Boeing 747 | длину | 13.1 m | 70.7 m | да | есть |
| 106 | `airbus_a380.png` | Airbus A380 | длину | 24.1 m | 72.7 m |  |  |
| 107 | `space_shuttle.png` | Space Shuttle | длину | 17.3 m | 37.2 m |  |  |
| 108 | `saturn_v_rocket.png` | Saturn V Rocket | высоту | 111 m | 10.1 m |  |  |
| 109 | `falcon_9_rocket.png` | Falcon 9 Rocket | высоту | 70 m | 3.7 m |  |  |
| 110 | `titanic.png` | Titanic | длину | 53 m | 269 m |  |  |
| 111 | `nimitz_aircraft_carrier.png` | Nimitz Aircraft Carrier | длину | 60 m | 333 m |  |  |
| 112 | `largest_container_ship.png` | Largest Container Ship | длину | 70 m | 400 m |  |  |
| 113 | `ohio_class_submarine.png` | Ohio-Class Submarine | длину | 12 m | 170 m |  |  |
| 114 | `icon_of_the_seas_cruise_ship.png` | Icon of the Seas Cruise Ship | длину | 70 m | 365 m |  |  |
| 115 | `canoe.png` | Canoe | длину | 40 cm | 5 m |  |  |
| 116 | `venetian_gondola.png` | Venetian Gondola | длину | 1.5 m | 11 m |  |  |
| 117 | `subway_car.png` | Subway Car | длину | 3.7 m | 18 m |  |  |
| 118 | `formula_1_car.png` | Formula 1 Car | длину | 95 cm | 5.6 m |  |  |
| 119 | `monster_truck.png` | Monster Truck | высоту | 3.5 m | 5.5 m |  |  |

### Здания (Buildings) - 26

| # | Файл картинки | Название | Угадываем | Высота | Длина | Эталон | Картинка |
|---|---------------|----------|-----------|--------|-------|--------|----------|
| 120 | `statue_of_liberty.png` | Statue of Liberty | высоту | 46 m | 16 m | да | есть |
| 121 | `eiffel_tower.png` | Eiffel Tower | высоту | 330 m | 190 m | да | есть |
| 122 | `great_pyramid_of_giza.png` | Great Pyramid of Giza | высоту | 139 m | 170 m |  | есть |
| 123 | `burj_khalifa.png` | Burj Khalifa | высоту | 828 m | 196 m | да | есть |
| 124 | `empire_state_building.png` | Empire State Building | высоту | 443 m | 130 m |  |  |
| 125 | `big_ben.png` | Big Ben | высоту | 96 m | 30.9 m |  | есть |
| 126 | `leaning_tower_of_pisa.png` | Leaning Tower of Pisa | высоту | 56 m | 30.3 m |  | есть |
| 127 | `christ_the_redeemer_with_pedestal.png` | Christ the Redeemer (with pedestal) | высоту | 38 m | 28 m |  |  |
| 128 | `colosseum.png` | Colosseum | высоту | 48 m | 189 m |  |  |
| 129 | `taj_mahal.png` | Taj Mahal | высоту | 73 m | 95 m |  |  |
| 130 | `sydney_opera_house.png` | Sydney Opera House | высоту | 65 m | 183 m |  |  |
| 131 | `golden_gate_bridge_tower_height.png` | Golden Gate Bridge (tower height) | высоту | 227 m | 2.74 km |  |  |
| 132 | `tower_bridge.png` | Tower Bridge | высоту | 65 m | 244 m |  |  |
| 133 | `cn_tower.png` | CN Tower | высоту | 553 m | 60 m |  |  |
| 134 | `oriental_pearl_tower.png` | Oriental Pearl Tower | высоту | 468 m | 213 m |  | есть |
| 135 | `petronas_towers.png` | Petronas Towers | высоту | 452 m | 110 m |  |  |
| 136 | `one_world_trade_center.png` | One World Trade Center | высоту | 541 m | 61 m |  |  |
| 137 | `tokyo_skytree.png` | Tokyo Skytree | высоту | 634 m | 68 m |  |  |
| 138 | `space_needle.png` | Space Needle | высоту | 184 m | 42 m |  |  |
| 139 | `gateway_arch.png` | Gateway Arch | высоту | 192 m | 192 m |  |  |
| 140 | `mount_rushmore_one_head.png` | Mount Rushmore (one head) | высоту | 18 m | 12 m |  |  |
| 141 | `great_sphinx_of_giza.png` | Great Sphinx of Giza | длину | 20 m | 73 m |  |  |
| 142 | `london_eye.png` | London Eye | высоту | 135 m | 120 m |  |  |
| 143 | `pont_du_gard.png` | Pont du Gard | высоту | 49 m | 275 m |  |  |
| 144 | `moai_statue.png` | Moai Statue | высоту | 4 m | 1.6 m |  |  |
| 145 | `hollywood_sign.png` | Hollywood Sign | высоту | 13.7 m | 107 m |  | есть |

### Природа (Nature) - 15

| # | Файл картинки | Название | Угадываем | Высота | Длина | Эталон | Картинка |
|---|---------------|----------|-----------|--------|-------|--------|----------|
| 146 | `mount_everest.png` | Mount Everest | высоту | 8.85 km | 15 km |  | есть |
| 147 | `mount_fuji.png` | Mount Fuji | высоту | 3.78 km | 35 km |  |  |
| 148 | `mount_kilimanjaro.png` | Mount Kilimanjaro | высоту | 5.89 km | 40 km |  |  |
| 149 | `angel_falls.png` | Angel Falls | высоту | 979 m | 150 m |  |  |
| 150 | `niagara_falls_horseshoe.png` | Niagara Falls (Horseshoe) | высоту | 51 m | 670 m |  |  |
| 151 | `hyperion_tallest_tree.png` | Hyperion (tallest tree) | высоту | 116 m | 44.4 m |  | есть |
| 152 | `general_sherman_tree.png` | General Sherman Tree | высоту | 84 m | 30 m |  |  |
| 153 | `baobab_tree.png` | Baobab Tree | высоту | 25 m | 20 m |  |  |
| 154 | `sunflower.png` | Sunflower | высоту | 3 m | 60 cm |  |  |
| 155 | `grand_canyon_depth.png` | Grand Canyon (depth) | высоту | 1.8 km | 16 km |  |  |
| 156 | `old_faithful_geyser_eruption.png` | Old Faithful Geyser (eruption) | высоту | 40 m | 10 m |  |  |
| 157 | `coconut_palm.png` | Coconut Palm | высоту | 25 m | 8 m |  |  |
| 158 | `saguaro_cactus.png` | Saguaro Cactus | высоту | 12 m | 5.72 m |  | есть |
| 159 | `rafflesia_flower.png` | Rafflesia Flower | длину | 74 cm | 1 m |  | есть |
| 160 | `giant_bamboo.png` | Giant Bamboo | высоту | 30 m | 3 m |  |  |
