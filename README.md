# :fire: movie_app :fire:

# :computer: Aplicación Android-IOS desarrollada en Flutter para visualizar las Peliculas más Populares en las Carteleras de Cine :computer:

## :star: Introducción a la Aplicación :star:

Aplicación creada en Flutter usando el manejador de estado Bloc y la API de https://www.themoviedb.org/ donde "The Movie Database" (TMDB) es una base de datos de películas y TV creada por la comunidad, aplicación creada como parte del proceso de selcción de Desarrolladores Flutter para la empresa Avilatek.com.

## :books: Tabla de contenido

- [Versiones](#star-versiones)
- [Dependencias](#package-dependencias)
- [Instalación](#hammer_and_wrench-instalación)
- [Apariencia](#camera-apariencia)
- [Uso](#rocket-uso) 
- [Support](#hammer_and_wrench-support)
- [Contributing](#memo-contributing)
- [License](#scroll-license)

## :star: Versiones

*  Version de Flutter 3.3.2
*  Version de la Aplicacion 1.0.0

## :package: Dependencias

* [google_fonts: ^3.0.1](https://pub.dev/packages/google_fonts)
* [http: ^0.13.5](https://pub.dev/packages/http)
* [flutter_dotenv: ^5.0.2](https://pub.dev/packages/flutter_dotenv)
* [flutter_bloc: ^8.1.1](https://pub.dev/packages/bloc)
* [equatable: ^2.0.5](https://pub.dev/packages/flutter_bloc)
* [bloc: ^8.1.0](https://pub.dev/packages/equatable)

## :hammer_and_wrench: Instalación

**Paso 0:**

Crea un archivo con el nombre de: `.env` (debe ser exacto) en el mismo nivel que el archivo `.gitignore` y agrega la cleve de tu API de  https://www.themoviedb.org/ como se muestra debajo, sin espacios:

```sh
API_KEY=********Your_API_Key********
```

**Paso 1:**

Clonar el repositorio use el siguiente comando en la temrinal:

```sh
git pull https://github.com/JeancarlosCarvajal/Prueba-Tecnica-AvilaTek 
```

**Paso 2:**

Limpiar las dependencias antiguas de Flutter (en caso de las haya):

```sh
flutter clean
```

**Paso 3:**

Cargar las dependencias establecidas en el archivo pubspec.yaml:

```sh
flutter pub get
```

**Paso 4:**

Correr la aplicacion con el comando:

```sh
flutter run
```
Luego la terminal te preguntará que dispositivo quieres desplegar y escoje uno y escribe el numero correspondiente luego click en enter.


## :rocket: Uso

* Primero se desplegará la [pantalla principal](https://github.com/JeancarlosCarvajal/Prueba-Tecnica-AvilaTek/blob/master/appearance/3-min.png) que mostrará las peliculas más populares en cartera de cine, puedes bajar con el scroll y seguirás obteniendo peliculas a medida que existan más disponibles en la API.

* Puedes hace touch sobre alguna pelicula de interes y te llevrá a la [pantalla de detalles](https://github.com/JeancarlosCarvajal/Prueba-Tecnica-AvilaTek/blob/master/appearance/4-min.png), donde verás la imagen principal de la pelicula en pantalla compelta, luego si hace touch sobre la pantalla se despliegara los [3 actores mas importantes](https://github.com/JeancarlosCarvajal/Prueba-Tecnica-AvilaTek/blob/master/appearance/5-min.png) de la pelicula así como tambien un boton para ocularlos de la pantalla.

* Puedes hacer touch sobre el artista que quieras y te mostrará la siguiente pantalla donde se observará una [Biografia del artista](https://github.com/JeancarlosCarvajal/Prueba-Tecnica-AvilaTek/blob/master/appearance/7-min.png) y todas sus peliculas de cine realizadas y documentadas al momento en la API.



## :camera: Apariencia

![Appearance 1](appearance/1-min.png)
![Appearance 2](appearance/2-min.png)
![Appearance 3](appearance/3-min.png)
![Appearance 4](appearance/4-min.png)
![Appearance 5](appearance/5-min.png)
![Appearance 6](appearance/6-min.png)
![Appearance 7](appearance/7-min.png)

### :camera: UI de Guia para crear la Aplicación

![Appearance 8](appearance/UI.png)


## :hammer_and_wrench: Support

Por favor [open an issue](https://github.com/JeancarlosCarvajal/Prueba-Tecnica-AvilaTek/issues/new) para soporte.

## :memo: Contributing

Contribuye usando [Github Flow](https://guides.github.com/introduction/flow/). Crea una rama y realiza commits y [open a pull request](https://github.com/JeancarlosCarvajal/Prueba-Tecnica-AvilaTek).

## :scroll: License

[MIT Licence © Jeancarlos Carvajal](https://github.com/JeancarlosCarvajal/Prueba-Tecnica-AvilaTek/blob/master/LICENCE.txt)