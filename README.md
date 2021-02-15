# CIU practica PONG

```
Autor Leopoldo lopez reveron 
Escuela de ingeniería informática
Universidad de las palmas de Gran Canaria
```

# Requisitos

```
 Para la ejecucion en processing es necesesario instalar la libreria de sonidos
 oficial de processing

```

# Controles:
```
Para empezar la partida se pulsa la barra espaciadora
  * en ocasiones al ejecutar el código la ventana del proyecto no tiene el foco
    para solucionarlo clicar en la ventana


Jugador 1:
  tecla w -> subir barra
  tecla s -> bajar barra

Jugador 2:

  tecla UP-arrow   -> subir barra
  tecla DOWN-arrow -> bajar barra
  
Control de juego:
  
  tecla barra espaciadora -> inicio juego, si ya está iniciada la partida resetea la bola
  tecla r -> reseta por completo el juego
  
```  
# Mecánicas de juego
```
  Ball colision box
  
  De forma intencional la colisión de la bola con las barras solo ocurre con el punto central de la misma
  de esta forma un jugador hábil puede rescatar una bola en el límite con el grosor de la barra
  
  Ball speed
  
  Cada vez que la bola rebota en una barra su vector de velocidad se ve incrementado en 1
```
  
  
# Trabajo realizado
```
  Se ha desarrollado el juego clásico "PONG", mediante la herramienta processing, en la cual se han tenido en
  cuenta las siguientes características:
    
    - Contador puntuación de juego
    - Representación del campo de juego
    - Feedback auditivo frente a eventos del juego
    - Lógica de colisiones
    
 ```   
    
# Decisiones adoptadas para la solución propuesta
```
  Para las físicas de movimiento de la bola se ha simplificado su cálculo, reduciéndolo a la tercera ley de newton
  
  Las teclas de juego han sido elegidas según la inercia de la industria
  
  Para resolver el problema del uso simultaneo de varias teclas, se utiliza un sistema de mascara donde 
  periódicamente se consulta el estado de las teclas, evitando de esta forma el bloqueo que genera dejar una tecla pulsada
  
  Para el movimiento inicial aleatorio se ha definido la imposibilidad de bolas con una velocidad mayor a 10 pixeles por frame,
  y que el incremento de la coordenada x sea 0, lo cual imposibilitaria el juego

```

# Referencias y herramientas utilizadas

  - ## Recursos de edición y Audio
  - * [Recorte de audio](https://audiotrimmer.com/)
  - * [Obtencion de Audio](https://yt1s.com/youtube-to-mp3)
  - * [Sonido barra](https://www.youtube.com/watch?v=jKVtoh05N-s)
  - * [Sonido puntuacion](https://www.youtube.com/watch?v=UfumsRKSpeo)
  
  - ## Funcionamiento Processing
  - * [Documentacion Audio](https://processing.org/reference/libraries/sound)
  - * [Manejo evento de teclado](https://forum.processing.org/two/discussion/9275/how-to-handle-more-keys-at-once)
  - * [Documentacion dibujar texto](https://processing.org/reference/text_.html)
  
  - ## Definición de especificación del proyecto
  - [Guion practica](https://ncvt-aep.ulpgc.es/cv/ulpgctp21/pluginfile.php/412240/mod_resource/content/37/CIU_Pr_cticas.pdf)




