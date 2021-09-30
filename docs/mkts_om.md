A falta de doc real, estos apuntes...

```
# Cut tileset

mapfile ../dev/assets/tileset.c
headerfile ../dev/assets/tileset.h
```

primero corta los tiles de fondo. Define que va a guardar esas cosas en `tileset.c/h` y luego lo que hace es recortar patrones a la cola de patrones interna y luego los va exportando a los archivos

```
reset patterns
open font.png
charset 0, 0, 32, 2

open box.png
charset 0, 0, 8, 1
```

Esto borra la cola de patrones. Luego abre font.png y saca un charset de 32x2 patrones (la fuente). Luego abre box.png y saca 8x1 patrones más. Esto deja 72 patrones en la cola

```
# Hud, uses chars from the already available 72.
open hud.png
nametablerle
write nametablerle frame_rle

# Language selection, uses chars from the already available 72.
open language.png
nametablerle
write nametablerle language_rle
```

El Hud y la pantalla de selección de idioma (de cheman) usan estos patrones, así que aprovecho para cargar los pngs y convertir los nametables. nametablerle extrae el nametable y lo guarda en la memoria del conversor.  `write nametablerle <array>` lo escribe en `tileset.c`

Como me he asegurado de que estas pantallas usen solo los patrones que ya están importados, no generarán ninguno más. En la cola seguimos teniendo 72

```
# write 72 patterns (64 + 8)
write patterns tsFONT_patterns_c tsFONT_colours_c packed
```

Con esto se escriben en el archivo los patrones que ya hay. write patterns <array_bitmaps> <array_colours> [packed] escribe *todos* los patrones que hay (72 en este caso). Packed los comprime con aplib.

Ahora un tileset.

```
# Metatiles level 0
open ts0.png
set patterns 72
reset tmaps
metatileset 0, 0, 8, 6, 2, 2, 41
write tmaps ts0_tmaps
write patterns ts0_patterns_c ts0_colours_c r:72:* packed
```

Abre ts0.png, pone el puntero de la cola de patrones en el número 72 (lo cual es redundante en este caso, pero bueno), resetea la cola de tilemaps (o metatiles). Recorta un metatileset. Escribe los tmaps (metadatos con los metatiles) en el array `ts0_tmaps` y escribe los patrones que ha generado. `r:72:*` hace que de la cola de patrones se escriba desde el 72 hasta el último que haya.

Esto es necesario porque hay más:

```
# Metatiles level 1
open ts1.png
set patterns 72
reset tmaps
metatileset 0, 0, 8, 6, 2, 2, 41
write tmaps ts1_tmaps
write patterns ts1_patterns_c ts1_colours_c r:72:* packed
```

se vuelve a hacer lo mismo. Los patrones nuevos que se recorten se colocarán a partir del 72 de nuevo. Los tilemaps se sobrescriben todos. Y luego se escriben esos tilemaps y los patrones.

Con esto lo que conseguimos es que los tilemaps se generen referenciando patrones a partir del 72

Así podemos tener todos los tilesets que queramos, sin tener que guardar los 256 patrones cada vez.
