20181018
========

project.init ();

Empezamos con esta nueva ida de olla. Voy a empezar con el MK1_NES "Cheril Perils Classic", que tiene muchas cosas chulas y todos los sprites de 16x16. Tendr� que componer varios spritesets que se cargar�n por separado (remember, VRAM para patrones):
- General: Cheril e items.
- Levels: uno por nivel, con los enemigos que se empl�en en cada uno.

Por lo pronto ya he pasado los sprites a formato SG. Estar�a bien empezar trabajando en el mkts de mk1 para hacer funcionar con el script el modo SG-1000, o quiz�, viendo como es el tema, basarme en el mkts_om por las caracter�sticas de la plataforma.

Luego tendr� que coger la SGLib y darle un laneo para quitar morralla y luego hacerme un rotador de sprites autom�tico, en el que yo env�e sprites a la SAT pero que los vaya ciclando, usando m�dulo todo el rollo de primos.

Voy a pasar unos tiles y lo dejo descansar. 8x1, yippie.

20181019
========

Me encantan estas distracciones. Me hacen volver a los proyectos en serio con m�s fuerza (principalmente, dise�ar y hacer un juego mol�n en AGNES doble width).

Veamos: tengo que conseguir exportar gr�ficos desde un script. Creo que como tengo que generar muchos binarios y luego comprimirlos con aplib de forma independiente, lo mejor es que modifique `mkts_om` que tien un script m�s dado a esto. Vamos al l�o y a a�adirle la plataforma sg1000 a `mkts_om`.

20181022
========

Parece que tengo `mkts_om` b�sicamente apa�ado (al menos para chars, metatiles y sprites, que es lo b�sico). Ahora ser�a el momento de empezar a dise�ar c�mo montar el juego (portar AGNES, dicho con la boca chica), pero antes quiero hacer que `mkts_om` te saque ya los tilesets comprimidos en un array.

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

El script va recortando y escribiendo los datos a un .h. Tambi�n puede sacar binarios (es la forma de trabajar en la versi�n para ZX o CPC) pero para hacer juegos con esto lo suyo es as�.

�De este modo tendr� ya preparado mi .h con todos los tiestos! Voy a meter que cr�e constantes autom�ticamente con los tama�os, que siempre viene bien.

~~

Veamos, los tiestos de esto ser�n muy parecidos a como funciona AGNES en NES, de hecho iguales, pero cambiar� el tema de c�mo se cargan los patrones / colores en VRAM y c�mo se referencian los metasprites (aunque ser� muy parecido). Vamos a organizar las cosas. En este juego s�lo usamos metasprites bicolor, as� que estamos ocupando el doble. En otros juegos ajustaremos m�s.

- El metaspriteset de Cheril (player) formado por 8 metasprites de 2 sprites cada 1 (8 * 2 * 4 = 64 patrones) ser� fijo e ir� cargado al principio de la tabla de patrones para sprites.

- Los enemigos ir�n cargados despu�s:
	- 3 (enemigos) * 2 (frames) * 2 (direcciones) * 2 (colores) * 4 patrones = 96 patrones para enemigos lineales b�sicos 1-3, a partir de 64.
	- 1 (fantasma) * 2 (frames) * 2 (direcciones) * 2 (colores) * 4 patrones = 32 patrones para fanty, a partir de 64+96 = 160
	- 1 (plataforma) * 2 (frames) * 2 (colores) * 4 patrones = 16 patrones, a partir de 160+32 = 192

Ahora mismo estamos en el patr�n 192 + 16 = 208. Me quedan 48 patrones, o sea, 12 sprites monocolor, o 6 bicolor. �que son justo los que necesito: el set de spr_it compuesto por coraz�n, bragas, resonador apagado, resonador encendido, coco y explosi�n.

El �nico trozo que cambia es el de los 96 patrones situados a partir de 64, que cambian por nivel. El resto permanece fijo. Por tanto, siempre habr� que cargar:

- Jugador en patr�n 0 (offset 0)
- Fantasma en patr�n 160 (offset 1280)
- Plataforma en patr�n 192 (offset 1536)
- Items y cosas en patr�n 208 (offset 1664)

Voy a reordenar para poder juntar todos los patrones fijos en un �nico bloque, que as� comprimir� mucho mejor y necesitar� menos tiestos para descomprimir. Nos quedar�a:

- Jugador en patr�n 0 (offset 0), 64 patrones.
- Fantasma en patr�n 64 (offset 512), 32 patrones.
- Plataforma en patr�n 96 (offset 768), 16 patrones.
- Items y cosas en patr�n 112 (offset 896), 48 patrones.

Todo eso en un binario, y por separado:

- Enemigos lineales en patr�n 160 (offset 1289), 96 patrones.

Este juego en concreto va a quedar muy bonito porque no he tenido que sacrificar nada.

Lo primero entonces es hacer el binario completo con los patrones de los sprites para las cosas fijas. Ser�a algo as� (ojo: el tipo de enemigo 3 de la fase 3 s�lo lleva 2 frames, porque es igual a izquierda y derecha: eso se tomar� en cuenta al construir los arrays de metasprites - no importar�a desperdiciar espacio en VRAM, pero mola ahorrarse unos bytes en el cartucho �no?)

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

Siguiendo con esto, y aunque a�n me falta pasar gr�ficos, los metatiles ir�n parecido: habr� una zona "fija" y una zona "m�vil". A unas malas, tengo 48 metatiles (en la fase 3 hay chac chacs) que, si tienen todos los patrones diferentes, ocupar�an 48*4 = 192 patrones. Estos ir�n a partir del patr�n 128, por tanto. A partir de 0 habr� 64 patrones con la fuente.

20181023
========

He hecho el tileset de la segunda fase (f�brica) y he preparado mkts_om para que genere parejas .h / .c para compilar en m�dulos separados y ahorrar algo de tiempo en SDCC.

~~

Ya tengo todo convertido (lo b�sico : tiles + sprites) y creo que es el momento de empezar a montar esto.

Para este (dicho con la boca chica) AGNES para SG-1000, tendr� un nuevo punto de inyecci�n que propagar� al principal: algo que se ejecute justo despu�s de saltar del men�, un `on_game_reset.h` que ser� donde cargue los assets principales y compartidos.

Pues bien, es el momento de copiar el c�digo y empezar a adaptar las llamadas. Para ello primero echar� un vistazo a Super Uwol y ver� las inicializaciones y dem�s miserias y har� unos peque�os apuntitos justo aqui:

~~

Primero:

```c
	#include "lib/SGlib.h"
	#include "lib/PSGlib.h"
	#include "lib/aPLib.h"
```

Esto creo que es necesario. Puedo intentar poner la m�a de z88dk:

```c
	// Please please pretty please change this

	#include "rand.h"
```

�Ya es algo que tengo que hacer!

Y empezamos por:

```c
	ticks = 60;

	SG_displayOff ();
	SG_setSpriteMode (SG_SPRITEMODE_LARGE);
```

Y parece que nada m�s. Veamos las tareas normales y corrientes. 

## Tiles

Por ejemplo, echar tiles para la pantalla:

```c
	SG_setTileatXY (x, y, c);
```

Pone un tile en (x, y) y mueve el cursor al siguiente, por lo que luego se puede ir llamando a 

```c
	SG_setTile (c);
```

para poner los siguientes. Para s�lo mover el cursor tenemos otra:

```c
	SG_setNextTileatXY (x, y);
```

## Sprites

Para poner un sprite simple 

```c
	SG_addSprite (x, y, pat, clr);
```

Pone un sprite con el patron pat o con ese y los tres siguientes, seg�n el modo de sprites.

```c
	SG_addMetaSprite (x, y, *meta);
```

Pone un metasprite de tama�o general, pero esto es m�s r�pido:

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

	// Aqu� hay tiempo para copiar muchas cosas a SAT, unos 256 bytes f�cil
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

M�sica:

```c
	PSGPlay (tune);
```

Sonido:

```c
	PSGSFXPlay (sfx, vch)
```

Pads:



�Estamos preparados?

~~

Lo primero es empezar a crear el script de compilaci�n para que se genere todo. Creo que lo suyo es que todo sea m�s SDCC friendly, por lo que voy a actualizar todos los conversores para que, mediante switch, saquen un par .h / .c.

~~

S�, estoy retrasando el momento de ponerme a liarla, pero es que con un buen toolchain luego se curra menos.

20181024
========

Todo acabado, voy a hacer el script de construcci�n de assets y a recordar c�mo se montaba el makefile f�cil.

~~

Ya tengo m ontado el proyecto, con el compilador, el crt0 custom, y toda la mierda necesaria. Ahora s�lamente necesito ito coger el game.c y toda su mierda y adaptarlo :*)

Empieza el port, y yo voy a tomarme un shocolara.

20181025
========

Un cambio en el set de sprites: en vez de 6 spr_it, habr� 7, pero los dos �ltimos s�lo llevan un sprite: disparo y NO!. Hab�amos dicho que los items se cargaban a partir del patr�n 112. 5 objetos de 2 capas m�s tarde son 40 patrones m�s tarde, por lo que *el disparo empieza en el patr�n 152 y la explosi�n en el 156*. La explosi�n es `ss_it_06`, que uso metasprite en el motor para poder tener explosiones m�s elaboradas.

He pensado que necesito hacer que `SG_addMetaSprite1x1` deber�a comprobar que lo que le paso s�lo lleva un sprite. Tampoco pierdo mucho tiempo y gano mucha flexibilidad a la hora de hacer los sets, teniendo en cuenta que en estos juegos lo normal es tener bichos de 1 o 2 colores.

Luego tendr� que repasar qu� cosas tengo que quitar completamente de AGNES por la poca RAM y cosas as�n

- Persistent enemies.
- Cualquier cosa CHR_ROM.

Otia, las cosas echas en ASM XD tengo que deshacerlas.

Deshacer tambi�n `SET_FROM_PTR`

20181029
========

Tengo $480 bytes libres en VRAM en la direcci�n $1B80 que puedo usar para `PERSISTENT_TILE_GET` y quiz� otras cosas como `PERSISTENT_ENEMS`. Son 1152 bytes, joder, no es moco de pavo :O

Ya compila todo. AHora voy a empezar a adaptar cosas. Lo primero es descomprimir tablas de patrones y color. Acabo de recordar viendo c�digo que hay que descomprimirlas tres veces: una para cada "tercio" de pantalla. Voy a hacerme un nuevo m�dulo para estas cosas.

~~

Pantalla negra, y yo sin saber d�nde mirar. Busquemos a ver con emulicius.

~~

Parece ser que el problema es que me he colado con la RAM. Ocupo m�s de 1Kb. Quiero ver cuanto a ver qu� se puede hacer.

~~

Es muy divertido, porque todo lo m�o termina en C38B. Y luego viene la RAM que emplea la PSGlib y la SGlib. En concreto, la RAM se acaba a la mitad del `SpriteTable`, que son 128 bytes. La �ltima varaible est� en C438. Digamos que nos pasamos $40 bytes (64 bytes).

He estado pensando en modificar todo para fumarme una de las tablas: la de atributos, `map_attr`, y usar s�lo `map_buff`, de forma que todas las comprobaciones de atributos sean indirectas. Eso significa overhead, pero al menos me ahorro 192 bytes �que es el puto 15% de la RAM! Esto me joder�a la habilidad de AGNES de enga�ar y modificar s�lo los behs sin tocar los tiles que se muestran, y ahora de cabeza no s� si es requerimiento.

Voy a investigar esta linea de acci�n.

Obviamente, tengo que dejar por ah� un switch porque esta versi�n me valdr� para SMS y ah� s� que se podr� pitufar!

~~

Veamos: se asigna a `map_attr` directamente para los propellers, o sea, para marcar "volable" el tile. Esto habr� que implementarlo de otra forma: tener un tile especial "volable" y sustituir todo el tile por este.

~~

Con este cambio las variables terminan en $C37F, lo que deja una micurria para la pila... Veamos qu� tal se comporta.

~~

AHora llego a la pantalla del men�. Puedo mover el sprite pero no puedo avanzar m�s all�. De entrada la rotaci�n autom�tica de sprites que dise�� est� mal implementada, y tendr� que revisarla. Pero no s� por qu� no puedo seleccionar una opci�n.

Revisar!

~~

Antes de nada, voy a comparar las variables de la versi�n 2.0 de AGNES porque elimin� un mont�n de morralla y eso siempre viene bien cuando s�lo tienes 1Kb.

~~

A�n no es perfecto el rotado pero ya veo m�s cosas. Por el momento veo que he exportado mal los patrones, me he equivocado del orden de fila / columna.

20181030
========

Poco a poco voy montando esto m�s y mejor. He separado ya algunos includes en modulos. Ahora tocar� `player.h`, as� que har� `player.c`.  Tengo el renderer perfe, pero el sprite del jugador no se muestra. Voy a apa�arlo a ver.

~~

Tiene que ser el rotado de sprites lo que est� mal, porque el jugador se muestra depende de los elementos que haya en la pantalla. Voy a volver a revisarlo.

~~

OK - Rotador de sprites apa�ado (estaba incrementando el puntero y luego sumaba el primo, con lo que el resultado no era primo y sobrescrib�a sprites).

Ahora voy a hacer el actualizador de tiles en VBlank (igual que el de neslib):

```c
	void SG_setUpdateList (unsigned char *ul);
	void SG_do_update_list (void);
```

Se encargar� de recorrer el update_list y mandar todos los cambios a VRAM.

El contenido del update list no es m�s que un array que trae MSB y LSB de direcciones de VRAM y contenidos que copiar. Se termina con un 0xff.

�Listo!

~~

Llega el momento en el que tengo que hacer el compresor de pantallas en RLE para las fijas, en concreto el marco.

~~

Genial con el HUD, pero se jode al cambiar de fase (corrupci�n creciente) y adem�s parece que sigue habiendo alg�n glitch (se ve algo en el BG que no deber�a estar en algunas pantallas y adem�s NO es consistente!).

Busco y tal.

�No! No es al pasar de fase, es al cargar las fases siguientes. �Ser� que los assets est�n mal? Porque es bien raro que los patterns sets ocupen:

Ts0: 519 bytes
Ts1: 870 bytes!
Ts2: 1074 bytes!!

Sobre todo cuando al construir me dice que:

Ts0: 79 patterns.
Ts1: 68 patterns.
Ts2: 81 patterns.

Como que no, esto est� mal.

�Vale! set patterns deber�a tambi�n establecer el index del main bin y el colour bin en mkts_om!

Ahora parecen resultados m�s normales:

Ts0: 519 bytes
Ts1: 397 bytes
Ts2: 537 bytes

Ahora mapa fase 2 mal, �mal convertido? No creo no? Jodo.

El forest (fase 3) directamente no va, pero supongo que ser� por los `tile_chac_chacs`. Pues no, pero la cosa es que tengo instant game over!

Bueno, lo dejo ah�, sigo con la fase 2 �por qu� se ve mal?

Esp�rate que me da a mi que esto son decoraciones dando por saco (las decos deber�an ser s�lo y �nicamente para el tile 31, la trampa "spring", pero el hecho de que se vea la pantalla "bien" y sobre ella un mont�n de mierda me da muy mala espina. Y si veo que hay mierda de la buena quiz� incluso tenga que revisar MK1_NES!

~~

BINGOW - son las decos. Los datos est�n bien. Revisemos el c�digo. Vale, lo de las otras veces. He deshecho mal los `WRITE_FROM_PTR` del original.

~~

Bosque funcionando tambi�n, con Chac Chacs del tirona dando chac chacazos. Ahora habr� que ponerse a pulir y buscar glitches a base de jugar. Es posible que tenga que tocar las conexiones verticales entre pantallas por el tema de que creo que la SG no deja poner sprites en el borde.

Tambi�n quiero terminar de modularizar el engine, por lo menos los enemigos, para que los rebuilds sean m�s cortos.

~~

Ay, pues no, las conexiones verticales son super geniales.

20181031
========

El motor necesita persistencia de enemigos. Hablamos de que ten�amos $480 bytes en VRAM a partir de $1B80.

Los enemigos persistentes necesitan almacenar 4 bytes por enemigo y por pantalla: ep_x, ep_y, ep_mx y ep_my. Esto significa que ocupar�an en VRAM el n�mero de pantallas por 12. En el caso de Cheril Perils tenemos 24 pantallas m�ximo que tomar�an 288 bytes, �lo cual es bastante usable!

Necesito antes que nada un `enems_persistent_load` que se encargue de precargar todos estos datos.

Para escribir en VRAM uso el m�todo milton, claro.

~~

��Persistencia funcionando!! Jod�, qu� crack, a la puta primera y sin un fallo. Me flipo.

Ahora quiero investigar por qu� aparecen dos patrones glitcheros de vez en cuando en el fondo. Tengo sue�o pero puedo permitirme mirar en que punto del proceso aparecen. Como he sacado `enengine.h` a un m�dulo esto compila mucho m�s r�pido, incluso en el Core 2 Duo de 2007 que estoy usando ahora.

20181102
========

�Pues creo que, a falta de m�sica y probaturas, el tema est� terminado! Ahora s�lo hace falta ampliar con el tema de los destructibles con m�s de un disparo para el Sgt. Helmet y esto estar� bastante presentable. 

Antes quiero adecentar un poco el c�digo de algunas partes. Voy a ello r�pidow.

20181105
========

Vamos a empezar a montar sgt. helmet. Para ello estoy reuniendo tiestos, y me faltar�a por convertir el .ene de MK2 a MK1, lo de siempre.

Anda que todos los remakes me tocan de ida y vuelta, macho XD Al final voy a terminar habiendo convertido todos los .ene de MK1 a MK2 y viceversa.

Ya tengo todas las arogas entregagas. Ahora es cuando veo qu� sustituciones / mejoras puedo hacer a los mapas para conseguir mejor compresi�n y, por tanto, m�s espacio libre.

Level 0/1 (son iguales los TS, pero de colores distintos): 

- Cambiar tile 0 por 25 si el tile de arriba no es 0 y es menor que 14.
- Cambiar tile 1 por 0 en el mapa y sustituir 0 por 1 al azar (50%) en el renderer. Cambiar cada (100/8)% por tile 27.
- Sustituir tiles 7 y 9 por 8 (bordes de valla por valla), y luego en el renderer hacer que si rda == 8, mirar a la izquierda y si no 8 ni 7 cambiar a 7 y mirar a la derecha y si no 8 cambiar a 9, �siempre que no est� aislada!

Level 2

- Cambiar tile 0 por 25 si el tile de arriba no es 0 y es menor que 14.
- Cambiar le tile 0 cada (100/8)% por tile 27.

En realidad podemos poner las dos cosas de Level 2 como generales en todos, y adem�s pintar el ordenador y las bombas si ya est�n puestas, aunque esto lo dejar� para el final: no pienso usar scripting, sino inyecci�n de c�digo.

Vamos a convertir a ver c�mo se van quedando los tiestos...

Armar build_assets.bat
======================

Stats:

- BG: 254 patrones, 2032*2 bytes -> 1377 + 762 bytes = 2139 bytes.
- Metatile: 112 * 3 = 336 bytes.
- RLE: 515 + 295 + 86 = 896 bytes. Title takes TOO MUCH!
- SS: 184 patrones, 1472 bytes -> 1039 bytes.
- Metasprite: meh
- Map0: 1749 bytes (packed: 2304 bytes)
- Map1: 2065 bytes (packed: 2304 byztes)
- Map2: 1854 bytes (packed: 2304 bytes)

Total data: 10078 bytes m�s los metasprites. Alrededor de 11K. 

Creo que si me apetece podr� meter un cuarto nivel reaprovechando gr�ficos de los otros tres, pero ya veremos. No es necesario.

So assets entregagos. Next: 

config.h
========

Copio el original y sigo la receta. En este punto comento `ENABLE_BREAKABLE` porque a�n lo tengo que implementar usando VRAM.

El patr�n para coco / bala (`COCO_PATTERN`, `BULLET_PATTERN`) ser� el 64 (player) + 64 (enemigos) + 36 (otros items) = 164

metasprites.h
=============

Hay que modificar los arrays de `metasprites.h` con los sprites de este juego, que son pocos y repes.

Por ahora en este juego puedo usar el mismo `spr_enems0` para TODOS los niveles.

behs.h
======

Copio del original y completo con el nuevo.

levelset.h
==========

Remember que metasprites y otros tiestos se reaprovechan.

pres.h
======

Copio del original y adapto.

~~

Bueno, esto compila y funciona puto todo. S� que tengo que retocar algunos gr�ficos, pero ahora toca reimplementar los breakables para que tiren de VRAM y listow!

B�sicamente se trata de sustituir `brk_buff` por una ubicaci�n en VRAM. Necesito 192 bytes que puedo pedirle al cacho sin ocupar que est� en $1B80, por ejemplo, al final: en $2000-192 = $1F40.

~~

Montado y funcionando.

No me gustan algunos gr�ficos, lo pongo de nuevo. No me gusta el entamado de rocas b�sico, no tiene contraste y queda feo. Ya lo cambiar�, pero reitero que no me gusta para que cuando me entre la vaguitis no diga meh.

Ahora es cuando tengo que montar el script. Por lo pronto no tengo texto porque no s� donde me voy a meter la linea de texto. A unas malas monto algo para una microcaja de texto, pero no me apetece y creo que no es necesario.

Por tanto, he de:

1.- Establecer una variable que se llame `bombs_set` y que se ponga a 0 al inicio.
2.- Al entrar en la pantalla 0, dibujar el _evil computer_.

3.- Al entrar en la pantalla 0, ver si `bombs_set` vale 1 para as� dibujar toda la mandanga.

20181113
========

Joer, no escribo aqu� ni pa tr�s. Esperando m�sicas he portado Jet Paco, con Jet Puri opcional. Ahora quiero darle un poco de age a la �ltima fase, poniendo chac chacs customizados.  Para ver como integrar esto de forma chula (para que no haya que tocar core) voy a mirar como estaban hechos los chac chacs.

En `engine/tile_chac_chac.c` se colocan con `chac_chacs_add`, que los a�ade a la estructura de datos pertinente. Luego hay un updater que se llama `chac_chacs_do`, que es quien va ciclando los estados y manejando la cola de actualizaci�n.

En esta funci�n, cuando hay que consumir una actualizaci�n de la cola. Para eso se lee el estado (ciclando de 0 a 5, o sea, 6 fases), y ocurren dos cosas:

- Si el estado es el 3, sonido de golpe.
- Se pinta el gr�fico tal y como se especifica en `chac_chacs_t1` a `t3`.

Los tiempos de cada fase se controlan con `chac_chacs_times`. Todo esto se define en `engine/precalcs.h`. Lo que puedo hacer es que si se define `USE_CUSTOM_CHAC_CHAC` se ignoren estos arreglos y se lean de `my/chac_chacs_config.h`. Adem�s, parametrizar�a el estado en el que se da el golpe.

Vamos al lolo.

Nota: Ahora los tiempos son 1/2/3 * 48. Para que esto sea configurable le tengo que dar una werters original. Quiz� simplemente con otro array que est� predefinido.

TODO: Pasar las mejoras de los chac chacs a MK1_NES:
	- Mover `precalcs.h` a `engine`, a�adir inclusi�n de `my/chac_chacs_config.h` via `USE_CUSTOM_CHAC_CHAC`.
	- A�adir `my/chac_chacs_config.h` 
	- Modificaciones en `engine/tile_chac_chac.c` (constantes)
	- Cambio en `map_renderer_complex.h`.
	- Modificadores de tiempo. 

~~

�S�lo quedar�a a�adir unos propellers a la fase B y listo!

