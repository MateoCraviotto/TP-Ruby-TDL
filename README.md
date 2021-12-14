# Trabajo Práctico - Teoría del Lenguaje

Ecommerce desarrollado en Ruby on Rails - Trabajo práctico para la materia Teoría de Lenguaje [75.31 - 95.07] - FIUBA, 2c2021

## Integrantes:
- Balmaceda, Fernando - [ferbalmaceda23](https://github.com/ferbalmaceda23)
- Craviotto, Mateo - [MateoCraviotto](https://github.com/MateoCraviotto)
- Diem, Walter Gabriel - [walgab](https://github.com/walgab)
- Lazzaro, Melina - [Melzr](https://github.com/Melzr)

## Corrector:
- Ferrigno, Leandro

## Ejecución
Una vez realizado el clone del repositorio, se deberán instalar los programas necesarios para poder ejecutar el trabajo. Entre ellos, se encuentran:

- Ruby (versión 3.0.0)
- Rails (versión 6.1.4.1)
- MySQL y MySQLd (mysql2 versión 0.5) 

Además, se deben instalar las dependencias de node.js, requeridas para que funcione Rails, con el comando ```yarn install```.

### Instalación de Gemas
Se deben instalar las Gemas utilizadas con el comando ```bundle install```.
Para más detalles sobre las gemas y sus versiones, ver el [Gemfile](https://github.com/MateoCraviotto/TP-Ruby-TDL/blob/main/ecommerce/Gemfile).

### Configuración de la base de datos

Primero, se debe ejecutar el setup de la base de datos, que carga los datos del archivo [seeds.rb] al inicio, para que aparezca una cuenta administradora con autos precargados al iniciar el servidor. Esto se hace con el comando ```rails db:setup```.

Luego, se deberán ejecutar las migraciones de la base de datos, lo que se hace con el comando ```rails db:migrate```


### Ejecución del servidor

Finalmente, para ejecutar el servidor que muestra el sitio web en local, se debe ejecutar el comando ```rails s```

Esto iniciará el servidor para que el sitio web se vea en ```http://localhost:3000/```

En un futuro, se pondrá el sitio web construido a la vista mediante Heroku.
