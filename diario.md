20181018
========

project.init ();

Empezamos con esta nueva ida de olla. Voy a empezar con el MK1_NES "Cheril Perils Classic", que tiene muchas cosas chulas y todos los sprites de 16x16. Tendr‚ que componer varios spritesets que se cargar n por separado (remember, VRAM para patrones):
- General: Cheril e items.
- Levels: uno por nivel, con los enemigos que se empl‚en en cada uno.

Por lo pronto ya he pasado los sprites a formato SG. Estar¡a bien empezar trabajando en el mkts de mk1 para hacer funcionar con el script el modo SG-1000, o quiz , viendo como es el tema, basarme en el mkts_om por las caracter¡sticas de la plataforma.

Luego tendr‚ que coger la SGLib y darle un laneo para quitar morralla y luego hacerme un rotador de sprites autom tico, en el que yo env¡e sprites a la SAT pero que los vaya ciclando, usando m¢dulo todo el rollo de primos.

Voy a pasar unos tiles y lo dejo descansar. 8x1, yippie.

20181019
========

Me encantan estas distracciones. Me hacen volver a los proyectos en serio con más fuerza (principalmente, diseñar y hacer un juego molón en AGNES doble width).

Veamos: tengo que conseguir exportar gráficos desde un script. Creo que como tengo que generar muchos binarios y luego comprimirlos con aplib de forma independiente, lo mejor es que modifique `mkts_om` que tien un script más dado a esto. Vamos al lío y a añadirle la plataforma sg1000 a `mkts_om`.

20181022
========

Parece que tengo `mkts_om` básicamente apañado (al menos para chars, metatiles y sprites, que es lo básico). Ahora sería el momento de empezar a diseñar cómo montar el juego (portar AGNES, dicho con la boca chica), pero antes quiero hacer que `mkts_om` te saque ya los tilesets comprimidos en un array.

~

Ok! Tengo esto funcionando. Mira el script:

```
	mapfile mapfile.h

	reset patterns
	reset tmaps

	open ts0.png
	metatileset 0, 0, 16, 2, 2, 2

	write tmaps ts0
	output patterns ts0.patterns.bin ts0.colours.bin
	write patterns ts0_patterns_c ts0_colours_c packed
	reset patterns

	open ss.png

	reset metasprites
	reset patterns
	reset sprite_pattern_index
	spriteset 0, 0, 8, 1, 1, 1, 0, 0
	write metasprites ss_pl
	write patterns ss_pl_patterns_c packed

	reset metasprites
	reset patterns
	set sprite_pattern_index 64
	spriteset 0, 2, 8, 2, 1, 1, 0, 0
	write metasprites ss_en1
	write patterns ss_en0_patterns_c packed

	reset metasprites
	reset patterns
	set sprite_pattern_index 64
	spriteset 0, 6, 8, 2, 1, 1, 0, 0
	write metasprites ss_en2
	write patterns ss_en1_patterns_c packed

	reset patterns
```

El script va recortando y escribiendo los datos a un .h. También puede sacar binarios (es la forma de trabajar en la versión para ZX o CPC) pero para hacer juegos con esto lo suyo es así.

¡De este modo tendré ya preparado mi .h con todos los tiestos! Voy a meter que crée constantes automáticamente con los tamaños, que siempre viene bien.

~~

Veamos, los tiestos de esto serán muy parecidos a como funciona AGNES en NES, de hecho iguales, pero cambiará el tema de cómo se cargan los patrones / colores en VRAM y cómo se referencian los metasprites (aunque será muy parecido). Vamos a organizar las cosas. En este juego sólo usamos metasprites bicolor, así que estamos ocupando el doble. En otros juegos ajustaremos más.

- El metaspriteset de Cheril (player) formado por 8 metasprites de 2 sprites cada 1 (8 * 2 * 4 = 64 patrones) será fijo e irá cargado al principio de la tabla de patrones para sprites.

- Los enemigos irán cargados después:
	- 3 (enemigos) * 2 (frames) * 2 (direcciones) * 2 (colores) * 4 patrones = 96 patrones para enemigos lineales básicos 1-3, a partir de 64.
	- 1 (fantasma) * 2 (frames) * 2 (direcciones) * 2 (colores) * 4 patrones = 32 patrones para fanty, a partir de 64+96 = 160
	- 1 (plataforma) * 2 (frames) * 2 (colores) * 4 patrones = 16 patrones, a partir de 160+32 = 192

Ahora mismo estamos en el patrón 192 + 16 = 208. Me quedan 48 patrones, o sea, 12 sprites monocolor, o 6 bicolor. ¡que son justo los que necesito: el set de spr_it compuesto por corazón, bragas, resonador apagado, resonador encendido, coco y explosión.

El único trozo que cambia es el de los 96 patrones situados a partir de 64, que cambian por nivel. El resto permanece fijo. Por tanto, siempre habrá que cargar:

- Jugador en patrón 0 (offset 0)
- Fantasma en patrón 160 (offset 1280)
- Plataforma en patrón 192 (offset 1536)
- Items y cosas en patrón 208 (offset 1664)

Voy a reordenar para poder juntar todos los patrones fijos en un único bloque, que así comprimirá mucho mejor y necesitará menos tiestos para descomprimir. Nos quedaría:

- Jugador en patrón 0 (offset 0), 64 patrones.
- Fantasma en patrón 64 (offset 512), 32 patrones.
- Plataforma en patrón 96 (offset 768), 16 patrones.
- Items y cosas en patrón 112 (offset 896), 48 patrones.

Todo eso en un binario, y por separado:

- Enemigos lineales en patrón 160 (offset 1289), 96 patrones.

Este juego en concreto va a quedar muy bonito porque no he tenido que sacrificar nada.

Lo primero entonces es hacer el binario completo con los patrones de los sprites para las cosas fijas. Sería algo así (ojo: el tipo de enemigo 3 de la fase 3 sólo lleva 2 frames, porque es igual a izquierda y derecha: eso se tomará en cuenta al construir los arrays de metasprites - no importaría desperdiciar espacio en VRAM, pero mola ahorrarse unos bytes en el cartucho ¿no?)

```
	mapfile spriteset.h

	reset patterns
	reset sprite_pattern_index

	reset metasprites
	spriteset 0, 0, 8, 1, 1, 1, 0, 0
	write metasprites ss_pl

	reset metasprites
	spriteset 0, 2, 4, 1, 1, 1, 0, 0
	write metasprites ss_fanty

	reset metasprites
	spriteset 8, 2, 2, 1, 1, 1, 0, 0
	write metasprites ss_plat

	reset metasprites
	spriteset 0, 4, 6, 1, 1, 1, 0, 0
	write metasprites ss_it

	write patterns ss_fixed_patterns_c packed

	# Enems level 0
	reset patterns
	set sprite_pattern_index 160
	spriteset 0, 6, 8, 2, 1, 1, 0, 0, 12
	write metasprites ss_en_0
	write patterns ss_en_0_patterns_c packed

	# Enems level 1
	reset patterns
	set sprite_pattern_index 160
	spriteset 0, 10, 8, 2, 1, 1, 0, 0, 12
	write metasprites ss_en_1
	write patterns ss_en_1_patterns_c packed

	# Enems level 2
	reset patterns
	set sprite_pattern_index 160
	spriteset 0, 14, 8, 2, 1, 1, 0, 0, 10
	write metasprites ss_en_2
	write patterns ss_en_2_patterns_c packed
```

Todo esto, por ahora, se importa que es un gusto. Y lo que ocupan los patrones (estructuras de metasprites aparte) son 835 + 542 + 550 + 521 = 2448 bytes. Mola.

~~

Siguiendo con esto, y aunque aún me falta pasar gráficos, los metatiles irán parecido: habrá una zona "fija" y una zona "móvil". A unas malas, tengo 48 metatiles (en la fase 3 hay chac chacs) que, si tienen todos los patrones diferentes, ocuparían 48*4 = 192 patrones. Estos irán a partir del patrón 128, por tanto. A partir de 0 habrá 64 patrones con la fuente.

20181023
========

He hecho el tileset de la segunda fase (fábrica) y he preparado mkts_om para que genere parejas .h / .c para compilar en módulos separados y ahorrar algo de tiempo en SDCC.

~~

Ya tengo todo convertido (lo básico : tiles + sprites) y creo que es el momento de empezar a montar esto.

Para este (dicho con la boca chica) AGNES para SG-1000, tendré un nuevo punto de inyección que propagaré al principal: algo que se ejecute justo después de saltar del menú, un `on_game_reset.h` que será donde cargue los assets principales y compartidos.

Pues bien, es el momento de copiar el código y empezar a adaptar las llamadas. Para ello primero echaré un vistazo a Super Uwol y veré las inicializaciones y demás miserias y haré unos pequeños apuntitos justo aqui:

~~

Primero:

```c
	#include "lib/SGlib.h"
	#include "lib/PSGlib.h"
	#include "lib/aPLib.h"
```

Esto creo que es necesario. Puedo intentar poner la mía de z88dk:

```c
	// Please please pretty please change this

	#include "rand.h"
```

¡Ya es algo que tengo que hacer!

Y empezamos por:

```c
	ticks = 60;

	SG_displayOff ();
	SG_setSpriteMode (SG_SPRITEMODE_LARGE);
```

Y parece que nada más. Veamos las tareas normales y corrientes. 

## Tiles

Por ejemplo, echar tiles para la pantalla:

```c
	SG_setTileatXY (x, y, c);
```

Pone un tile en (x, y) y mueve el cursor al siguiente, por lo que luego se puede ir llamando a 

```c
	SG_setTile (c);
```

para poner los siguientes. Para sólo mover el cursor tenemos otra:

```c
	SG_setNextTileatXY (x, y);
```

## Sprites

Para poner un sprite simple 

```c
	SG_addSprite (x, y, pat, clr);
```

Pone un sprite con el patron pat o con ese y los tres siguientes, según el modo de sprites.

```c
	SG_addMetaSprite (x, y, *meta);
```

Pone un metasprite de tamaño general, pero esto es más rápido:

```c
	SG_addMetaSprite1x1 (x, y, *meta);
```

Porque asume que el meta es 2x2 y hace menos historias.

Toda a historia de los sprites:

```c
	SG_initSprites ();
	// Mandar sprites
	SG_finalizeSprites ();
```

## Tramolla 

vBlank:

```c
	SG_waitForVBlank ();
	UNSAFE_SG_copySpritestoSAT ();

	// Aquí hay tiempo para copiar muchas cosas a SAT, unos 256 bytes fácil
	// Pero no lo necesito en este juego.
```

Apagar y encender:

```c 
	SG_displayOff ();
	SG_displayOn ();
```

Callar el PSG:

```c
	PSGStop ();
	PSGSFXStop ();
```

Música:

```c
	PSGPlay (tune);
```

Sonido:

```c
	PSGSFXPlay (sfx, vch)
```

Pads:



¿Estamos preparados?

~~

Lo primero es empezar a crear el script de compilación para que se genere todo. Creo que lo suyo es que todo sea más SDCC friendly, por lo que voy a actualizar todos los conversores para que, mediante switch, saquen un par .h / .c.

~~

Sí, estoy retrasando el momento de ponerme a liarla, pero es que con un buen toolchain luego se curra menos.

20181024
========

Todo acabado, voy a hacer el script de construcción de assets y a recordar cómo se montaba el makefile fácil.

~~

Ya tengo m ontado el proyecto, con el compilador, el crt0 custom, y toda la mierda necesaria. Ahora sólamente necesito ito coger el game.c y toda su mierda y adaptarlo :*)

Empieza el port, y yo voy a tomarme un shocolara.

20181025
========

Un cambio en el set de sprites: en vez de 6 spr_it, habrá 7, pero los dos últimos sólo llevan un sprite: disparo y NO!. Habíamos dicho que los items se cargaban a partir del patrón 112. 5 objetos de 2 capas más tarde son 40 patrones más tarde, por lo que *el disparo empieza en el patrón 152 y la explosión en el 156*. La explosión es `ss_it_06`, que uso metasprite en el motor para poder tener explosiones más elaboradas.

He pensado que necesito hacer que `SG_addMetaSprite1x1` debería comprobar que lo que le paso sólo lleva un sprite. Tampoco pierdo mucho tiempo y gano mucha flexibilidad a la hora de hacer los sets, teniendo en cuenta que en estos juegos lo normal es tener bichos de 1 o 2 colores.

Luego tendré que repasar qué cosas tengo que quitar completamente de AGNES por la poca RAM y cosas asín

- Persistent enemies.
- Cualquier cosa CHR_ROM.

Otia, las cosas echas en ASM XD tengo que deshacerlas.

Deshacer también `SET_FROM_PTR`

20181029
========

Tengo $480 bytes libres en VRAM en la dirección $1B80 que puedo usar para `PERSISTENT_TILE_GET` y quizá otras cosas como `PERSISTENT_ENEMS`. Son 1152 bytes, joder, no es moco de pavo :O

Ya compila todo. AHora voy a empezar a adaptar cosas. Lo primero es descomprimir tablas de patrones y color. Acabo de recordar viendo código que hay que descomprimirlas tres veces: una para cada "tercio" de pantalla. Voy a hacerme un nuevo módulo para estas cosas.

~~

Pantalla negra, y yo sin saber dónde mirar. Busquemos a ver con emulicius.

~~

Parece ser que el problema es que me he colado con la RAM. Ocupo más de 1Kb. Quiero ver cuanto a ver qué se puede hacer.

~~

Es muy divertido, porque todo lo mío termina en C38B. Y luego viene la RAM que emplea la PSGlib y la SGlib. En concreto, la RAM se acaba a la mitad del `SpriteTable`, que son 128 bytes. La última varaible está en C438. Digamos que nos pasamos $40 bytes (64 bytes).

He estado pensando en modificar todo para fumarme una de las tablas: la de atributos, `map_attr`, y usar sólo `map_buff`, de forma que todas las comprobaciones de atributos sean indirectas. Eso significa overhead, pero al menos me ahorro 192 bytes ¡que es el puto 15% de la RAM! Esto me jodería la habilidad de AGNES de engañar y modificar sólo los behs sin tocar los tiles que se muestran, y ahora de cabeza no sé si es requerimiento.

Voy a investigar esta linea de acción.

Obviamente, tengo que dejar por ahí un switch porque esta versión me valdrá para SMS y ahí sí que se podrá pitufar!

~~

Veamos: se asigna a `map_attr` directamente para los propellers, o sea, para marcar "volable" el tile. Esto habrá que implementarlo de otra forma: tener un tile especial "volable" y sustituir todo el tile por este.

~~

Con este cambio las variables terminan en $C37F, lo que deja una micurria para la pila... Veamos qué tal se comporta.

~~

AHora llego a la pantalla del menú. Puedo mover el sprite pero no puedo avanzar más allá. De entrada la rotación automática de sprites que diseñé está mal implementada, y tendré que revisarla. Pero no sé por qué no puedo seleccionar una opción.

Revisar!

~~

Antes de nada, voy a comparar las variables de la versión 2.0 de AGNES porque eliminé un montón de morralla y eso siempre viene bien cuando sólo tienes 1Kb.

~~

Aún no es perfecto el rotado pero ya veo más cosas. Por el momento veo que he exportado mal los patrones, me he equivocado del orden de fila / columna.

