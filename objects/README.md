# Набор объектов - Guess Its Size

В этой папке 138 объектов для игры. Один общий список: любой объект можно
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
- `ObjectLibrary.Objects` - one list of 138 objects. Every object can be
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
| 9 | `iphone_18.png` | iPhone 18 | высоту | 15 cm | 7.65 cm | да | есть |
| 10 | `coffee_mug.png` | Coffee Mug | высоту | 9.5 cm | 11.8 cm |  | есть |
| 11 | `toothbrush.png` | Toothbrush | длину | 1.98 cm | 19 cm |  | есть |
| 12 | `tennis_ball.png` | Tennis Ball | высоту | 6.7 cm | 6.7 cm |  | есть |
| 13 | `basketball.png` | Basketball | высоту | 24 cm | 24 cm |  | есть |
| 14 | `soccer_ball.png` | Soccer Ball | высоту | 22 cm | 22 cm |  | есть |
| 15 | `golf_ball.png` | Golf Ball | высоту | 4.3 cm | 4.3 cm |  | есть |
| 16 | `acoustic_guitar.png` | Acoustic Guitar | длину | 29.9 cm | 1 m |  | есть |
| 17 | `violin.png` | Violin | длину | 15.4 cm | 59 cm |  | есть |
| 18 | `grand_piano.png` | Grand Piano | длину | 1.55 m | 2.74 m |  | есть |
| 19 | `refrigerator.png` | Refrigerator | высоту | 1.8 m | 72.2 cm |  | есть |
| 20 | `washing_machine.png` | Washing Machine | высоту | 85 cm | 60 cm | да | есть |
| 21 | `bicycle.png` | Bicycle | длину | 98 cm | 1.75 m |  | есть |
| 22 | `office_chair.png` | Office Chair | высоту | 1.1 m | 68.8 cm |  | есть |
| 23 | `traffic_cone.png` | Traffic Cone | высоту | 70 cm | 36.2 cm |  | есть |
| 24 | `fire_hydrant.png` | Fire Hydrant | высоту | 75 cm | 55.9 cm |  | есть |
| 25 | `lego_brick_2x4.png` | LEGO Brick 2x4 | длину | 1.13 cm | 3.2 cm |  | есть |
| 26 | `dice.png` | Dice | высоту | 1.6 cm | 1.6 cm |  | есть |
| 27 | `skateboard.png` | Skateboard | длину | 10.9 cm | 80 cm |  | есть |
| 28 | `surfboard.png` | Surfboard | длину | 43.6 cm | 1.8 m |  | есть |
| 29 | `bathtub.png` | Bathtub | длину | 75.1 cm | 1.7 m |  | есть |
| 30 | `king_size_bed.png` | King Size Bed | длину | 1.1 m | 2.03 m |  | есть |
| 31 | `wine_bottle.png` | Wine Bottle | высоту | 30 cm | 6.73 cm |  | есть |
| 32 | `soda_can.png` | Soda Can | высоту | 12.2 cm | 6.53 cm |  | есть |
| 33 | `computer_keyboard.png` | Computer Keyboard | длину | 13.9 cm | 44 cm |  | есть |
| 34 | `tennis_racket.png` | Tennis Racket | длину | 27.5 cm | 68.5 cm |  | есть |
| 35 | `bowling_pin.png` | Bowling Pin | высоту | 38.1 cm | 11.8 cm |  | есть |

### Еда (Food) - 12

| # | Файл картинки | Название | Угадываем | Высота | Длина | Эталон | Картинка |
|---|---------------|----------|-----------|--------|-------|--------|----------|
| 36 | `banana.png` | Banana | длину | 10.8 cm | 19 cm |  | есть |
| 37 | `apple.png` | Apple | высоту | 8 cm | 7.28 cm |  | есть |
| 38 | `watermelon.png` | Watermelon | длину | 24.9 cm | 40 cm |  | есть |
| 39 | `pineapple.png` | Pineapple | высоту | 40 cm | 16.2 cm |  | есть |
| 40 | `strawberry.png` | Strawberry | высоту | 3.5 cm | 2.56 cm |  | есть |
| 41 | `chicken_egg.png` | Chicken Egg | высоту | 5.7 cm | 4.28 cm |  | есть |
| 42 | `large_pizza.png` | Large Pizza | длину | 36 cm | 36 cm |  | есть |
| 43 | `baguette.png` | Baguette | длину | 9.45 cm | 65 cm |  | есть |
| 44 | `hot_dog.png` | Hot Dog | длину | 6.61 cm | 15 cm |  | есть |
| 45 | `coconut.png` | Coconut | высоту | 25 cm | 22.2 cm |  | есть |
| 46 | `grain_of_rice.png` | Grain of Rice | длину | 0.2 cm | 0.6 cm |  | есть |
| 47 | `pumpkin.png` | Pumpkin | высоту | 30 cm | 39.3 cm |  | есть |

### Животные (Animals) - 24

| # | Файл картинки | Название | Угадываем | Высота | Длина | Эталон | Картинка |
|---|---------------|----------|-----------|--------|-------|--------|----------|
| 48 | `ant.png` | Ant | длину | 0.227 cm | 0.5 cm |  | есть |
| 49 | `honeybee.png` | Honeybee | длину | 0.74 cm | 1.3 cm |  | есть |
| 50 | `ladybug.png` | Ladybug | длину | 0.621 cm | 0.7 cm |  | есть |
| 51 | `monarch_butterfly.png` | Monarch Butterfly | длину | 6.91 cm | 10 cm |  | есть |
| 52 | `hummingbird.png` | Hummingbird | длину | 4.51 cm | 8 cm |  | есть |
| 53 | `hamster.png` | Hamster | длину | 7.52 cm | 15 cm |  | есть |
| 54 | `chicken.png` | Chicken | высоту | 40 cm | 32.7 cm |  | есть |
| 55 | `house_cat.png` | House Cat | высоту | 30 cm | 53.3 cm |  | есть |
| 56 | `emperor_penguin.png` | Emperor Penguin | высоту | 1.15 m | 47.7 cm |  | есть |
| 57 | `ostrich.png` | Ostrich | высоту | 2.5 m | 1.63 m |  | есть |
| 58 | `giraffe.png` | Giraffe | высоту | 5.5 m | 5.19 m |  | есть |
| 59 | `saltwater_crocodile.png` | Saltwater Crocodile | длину | 77.6 cm | 5 m |  | есть |
| 60 | `reticulated_python.png` | Reticulated Python | длину | 81.5 cm | 6 m |  | есть |
| 61 | `great_white_shark.png` | Great White Shark | длину | 1.55 m | 4.5 m |  | есть |
| 62 | `orca.png` | Orca | длину | 2.88 m | 7.5 m |  | есть |
| 63 | `blue_whale.png` | Blue Whale | длину | 3.15 m | 25 m |  | есть |
| 64 | `japanese_spider_crab.png` | Japanese Spider Crab | длину | 2.46 m | 3 m |  | есть |
| 65 | `giant_squid.png` | Giant Squid | длину | 2.74 m | 12 m |  | есть |
| 66 | `bald_eagle_wingspan.png` | Bald Eagle (wingspan) | длину | 74.3 cm | 2 m |  | есть |
| 67 | `flamingo.png` | Flamingo | высоту | 1.4 m | 1.15 m |  | есть |
| 68 | `moose.png` | Moose | высоту | 2.5 m | 3.79 m |  | есть |
| 69 | `bengal_tiger.png` | Bengal Tiger | длину | 1.75 m | 3 m |  | есть |
| 70 | `komodo_dragon.png` | Komodo Dragon | длину | 40.7 cm | 2.6 m |  | есть |
| 71 | `atlantic_salmon.png` | Atlantic Salmon | длину | 23.5 cm | 75 cm |  | есть |

### Динозавры (Dinosaurs) - 10

| # | Файл картинки | Название | Угадываем | Высота | Длина | Эталон | Картинка |
|---|---------------|----------|-----------|--------|-------|--------|----------|
| 72 | `tyrannosaurus_rex.png` | Tyrannosaurus Rex | высоту | 4.5 m | 4.08 m |  | есть |
| 73 | `triceratops.png` | Triceratops | длину | 3.49 m | 9 m |  | есть |
| 74 | `stegosaurus.png` | Stegosaurus | длину | 3.55 m | 9 m |  | есть |
| 75 | `velociraptor.png` | Velociraptor | длину | 63.9 cm | 2 m |  | есть |
| 76 | `brachiosaurus.png` | Brachiosaurus | высоту | 12.5 m | 22 m |  | есть |
| 77 | `argentinosaurus.png` | Argentinosaurus | длину | 8.21 m | 35 m |  | есть |
| 78 | `woolly_mammoth.png` | Woolly Mammoth | высоту | 3.3 m | 3.71 m |  | есть |
| 79 | `pteranodon_wingspan.png` | Pteranodon (wingspan) | длину | 2.04 m | 6 m |  | есть |
| 80 | `megalodon.png` | Megalodon | длину | 5.65 m | 15 m |  | есть |
| 81 | `spinosaurus.png` | Spinosaurus | длину | 5.36 m | 14 m |  | есть |

### Транспорт (Transport) - 24

| # | Файл картинки | Название | Угадываем | Высота | Длина | Эталон | Картинка |
|---|---------------|----------|-----------|--------|-------|--------|----------|
| 82 | `car.png` | Car | длину | 1.47 m | 4.5 m | да | есть |
| 83 | `school_bus.png` | School Bus | длину | 4.29 m | 12 m | да | есть |
| 84 | `motorcycle.png` | Motorcycle | длину | 1.15 m | 2.1 m |  | есть |
| 85 | `pickup_truck.png` | Pickup Truck | длину | 1.9 m | 5.9 m |  | есть |
| 86 | `double_decker_bus.png` | Double-Decker Bus | высоту | 4.4 m | 11 m |  | есть |
| 87 | `semi_truck_with_trailer.png` | Semi Truck with Trailer | длину | 4.2 m | 21 m |  | есть |
| 88 | `m1_abrams_tank.png` | M1 Abrams Tank | длину | 2.42 m | 9.8 m |  | есть |
| 89 | `hot_air_balloon.png` | Hot Air Balloon | высоту | 25 m | 17.7 m |  | есть |
| 90 | `cessna_172.png` | Cessna 172 | длину | 2.78 m | 8.3 m |  | есть |
| 91 | `boeing_747.png` | Boeing 747 | длину | 13.1 m | 70.7 m | да | есть |
| 92 | `airbus_a380.png` | Airbus A380 | длину | 23.2 m | 72.7 m |  | есть |
| 93 | `space_shuttle.png` | Space Shuttle | длину | 15.5 m | 37.2 m |  | есть |
| 94 | `saturn_v_rocket.png` | Saturn V Rocket | высоту | 111 m | 17.2 m |  | есть |
| 95 | `falcon_9_rocket.png` | Falcon 9 Rocket | высоту | 70 m | 4.96 m |  | есть |
| 96 | `titanic.png` | Titanic | длину | 51.4 m | 269 m |  | есть |
| 97 | `nimitz_aircraft_carrier.png` | Nimitz Aircraft Carrier | длину | 59.7 m | 333 m |  | есть |
| 98 | `largest_container_ship.png` | Largest Container Ship | длину | 70.3 m | 400 m |  | есть |
| 99 | `ohio_class_submarine.png` | Ohio-Class Submarine | длину | 19.7 m | 170 m |  | есть |
| 100 | `icon_of_the_seas_cruise_ship.png` | Icon of the Seas Cruise Ship | длину | 73.4 m | 365 m |  | есть |
| 101 | `canoe.png` | Canoe | длину | 50.1 cm | 5 m |  | есть |
| 102 | `venetian_gondola.png` | Venetian Gondola | длину | 1.74 m | 11 m |  | есть |
| 103 | `subway_car.png` | Subway Car | длину | 3.82 m | 18 m |  | есть |
| 104 | `formula_1_car.png` | Formula 1 Car | длину | 92 cm | 5.6 m |  | есть |
| 105 | `monster_truck.png` | Monster Truck | высоту | 3.5 m | 5.75 m |  | есть |

### Здания (Buildings) - 22

| # | Файл картинки | Название | Угадываем | Высота | Длина | Эталон | Картинка |
|---|---------------|----------|-----------|--------|-------|--------|----------|
| 106 | `statue_of_liberty.png` | Statue of Liberty | высоту | 46 m | 16 m | да | есть |
| 107 | `eiffel_tower.png` | Eiffel Tower | высоту | 330 m | 190 m | да | есть |
| 108 | `great_pyramid_of_giza.png` | Great Pyramid of Giza | высоту | 139 m | 170 m |  | есть |
| 109 | `burj_khalifa.png` | Burj Khalifa | высоту | 828 m | 196 m | да | есть |
| 110 | `empire_state_building.png` | Empire State Building | высоту | 443 m | 119 m |  | есть |
| 111 | `big_ben.png` | Big Ben | высоту | 96 m | 30.9 m |  | есть |
| 112 | `leaning_tower_of_pisa.png` | Leaning Tower of Pisa | высоту | 56 m | 30.3 m |  | есть |
| 113 | `colosseum.png` | Colosseum | высоту | 48 m | 113 m |  | есть |
| 114 | `taj_mahal.png` | Taj Mahal | высоту | 73 m | 99 m |  | есть |
| 115 | `sydney_opera_house.png` | Sydney Opera House | высоту | 65 m | 152 m |  | есть |
| 116 | `golden_gate_bridge_tower_height.png` | Golden Gate Bridge (tower height) | высоту | 227 m | 2.64 km |  | есть |
| 117 | `tower_bridge.png` | Tower Bridge | высоту | 65 m | 169 m |  | есть |
| 118 | `cn_tower.png` | CN Tower | высоту | 553 m | 57.7 m |  | есть |
| 119 | `oriental_pearl_tower.png` | Oriental Pearl Tower | высоту | 468 m | 213 m |  | есть |
| 120 | `petronas_towers.png` | Petronas Towers | высоту | 452 m | 139 m |  | есть |
| 121 | `one_world_trade_center.png` | One World Trade Center | высоту | 541 m | 99.4 m |  | есть |
| 122 | `tokyo_skytree.png` | Tokyo Skytree | высоту | 634 m | 68.3 m |  | есть |
| 123 | `space_needle.png` | Space Needle | высоту | 184 m | 80 m |  | есть |
| 124 | `gateway_arch.png` | Gateway Arch | высоту | 192 m | 199 m |  | есть |
| 125 | `london_eye.png` | London Eye | высоту | 135 m | 109 m |  | есть |
| 126 | `pont_du_gard.png` | Pont du Gard | высоту | 49 m | 166 m |  | есть |
| 127 | `hollywood_sign.png` | Hollywood Sign | высоту | 13.7 m | 107 m |  | есть |

### Природа (Nature) - 11

| # | Файл картинки | Название | Угадываем | Высота | Длина | Эталон | Картинка |
|---|---------------|----------|-----------|--------|-------|--------|----------|
| 128 | `mount_everest.png` | Mount Everest | высоту | 8.85 km | 15 km |  | есть |
| 129 | `mount_fuji.png` | Mount Fuji | высоту | 3.78 km | 15 km |  | есть |
| 130 | `mount_kilimanjaro.png` | Mount Kilimanjaro | высоту | 5.89 km | 31.7 km |  | есть |
| 131 | `angel_falls.png` | Angel Falls | высоту | 979 m | 558 m |  | есть |
| 132 | `hyperion_tallest_tree.png` | Hyperion (tallest tree) | высоту | 116 m | 44.4 m |  | есть |
| 133 | `general_sherman_tree.png` | General Sherman Tree | высоту | 84 m | 26.5 m |  | есть |
| 134 | `sunflower.png` | Sunflower | высоту | 3 m | 91.9 cm |  | есть |
| 135 | `coconut_palm.png` | Coconut Palm | высоту | 25 m | 9.95 m |  | есть |
| 136 | `saguaro_cactus.png` | Saguaro Cactus | высоту | 12 m | 5.72 m |  | есть |
| 137 | `rafflesia_flower.png` | Rafflesia Flower | длину | 74 cm | 1 m |  | есть |
| 138 | `giant_bamboo.png` | Giant Bamboo | высоту | 30 m | 7.29 m |  | есть |
