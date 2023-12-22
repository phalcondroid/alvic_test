# Alvic flutter test

Prueba técnica alvic frontend flutter.

## Getting Started

En el siguiente proyecto encontrarás los diferentes retos que debes completar en la prueba técnica.

### Criterios a tener en cuenta "IMPORTANTES!"

- Clean Architecture.
- SOLID.
- Null safety (Evitar nulls a toda costa), Programación funcional.
- Manejo correcto de hilos, async, await.
- Evitar a toda costa el "boiler plate" (código repetitivo).
- Implementación de Widgets génericos.
- Unit test (lógica de negocio y widgets).
- flutter test
- mockito

### Bonnus pack "Opcionales"

Si conoces los siguientes paquetes y sabes implementarlos es un punto a favor.

- freezed
- injectable
- getit
- bloc_test

### Instrucciones

La aplicación consiste en una interfaz, una lista de cards que esta poblando con un request a un api/rest, con base en los datos retornados por el api se deben mostrar una lista de personajes "characters" y se deben cumplir las buenas prácticas y minimos requerimientos para desarrollar una app en flutter tanto en la UI como en la lógica de negocio y modelos de datos.

A continuación debes refactorizar una aplicación hecha en flutter, actualmente la app esta hecha con set state, así que, debes refactorizar el código usando el manejador de estados bloc.

### Requerimientos

Cuando ejecutes el proyecto encontrarás una interfaz como la siguiente:

Encontrarás que en el widget `characters_view.dart` se esta haciendo la llamada a backend con `http.get` y se estan renderizando los resultados.

<img width="300" alt="Screenshot 2023-12-22 at 6 23 01 AM" src="https://github.com/phalcondroid/alvic_test/assets/13957703/75f2c447-99f5-42b1-a4b4-60d6c3e26c46">

La UI esperada es la siguiente:

<img width="300" alt="Screenshot 2023-12-22 at 6 23 01 AM" src="https://github.com/phalcondroid/alvic_test/assets/13957703/e98c681c-b240-4b4f-b128-682b2204125d">

1. Debes eliminar por completo el uso de `set state` y `statefull widget` e implementar bloc como manejador de estado en un widget tipo stateless.
2. Debes refactorizar el código de `characters_view.dart` para que luzca como el último screenshot!
3. Debes simplificar el código eliminando widgets que no estén cumpliendo con ninguna funcionalidad.
4. Debes eliminar el código repetitivo.
5. Debes implementar null safety.

Pistas!

- Debes crear widgets genericos para que se puedan reutilizar en la vista, ver los widgets pre fabricados en `widgets/custom_button_dialog.dart` y `widgets/generic_grid_content.dart`
- Evita no usar el `const` el helper de android studio o vscode ayudar a implementar el correcto uso null safety.
- Para el manejo de hilos recuerda solamente usar futures o streams estrictamente cuando necesitas generar un proceso o tarea asíncrona.

Manejo de estado

- En la carpeta `presentation/bloc` encontrarás las clases pre fabricadas para construir el nuevo manejador de estado con bloc y el nuevo widget stateless. 

<img width="304" alt="Screenshot 2023-12-22 at 6 23 01 AM" src="https://github.com/phalcondroid/alvic_test/assets/13957703/9ccba948-cec9-4977-b4a2-caed3ebbcbc8">

##### Implementación de 'Clean Architecture'

En los demas folders encontrarás la siguiente estructura:

<img width="279" alt="Screenshot 2023-12-22 at 6 26 27 AM" src="https://github.com/phalcondroid/alvic_test/assets/13957703/a09d419f-821b-40fa-86d4-9ec457ab3a5b">

Es imperativo que sepas donde implementar la extracción de datos y como esos datos llegan al componente de la lógica de negocio, finalmente renderizando los resultados en la vista!

6. Cuando implementes la capa de datos y llames el backend debes crear un modelo que hará de transporte entre componentes desde la fuente `el backend` hasta la vista, ese modelo debe tener la siguiente estructura.

<img width="166" alt="Screenshot 2023-12-22 at 6 35 14 AM" src="https://github.com/phalcondroid/alvic_test/assets/13957703/58cb3320-d11c-4472-900c-4cb43fb1c0a7">

PISTA IMPORTANTE!!! Recuerda que lo más importante en clean architecture y S.O.L.I.D es que la comunicación entre componentes y capas debe ser a través de contratos e interfaces!

7. Has el mapeo de datos en el lugar CORRECTO de dominio de negocio con lo que llega del backend a la estructura del modelo de datos requerido en la imagen anterior.
   
8. Desarrolla el unit test `test/components/...`. 


#### respuesta del backend

URL: GET
`https://mocki.io/v1/f9d4d62a-b25f-4c5a-bfdb-281e62008639`

```json
{
   "info":{
      "count":826,
      "pages":42,
      "next":"https://rickandmortyapi.com/api/character?page=2",
      "prev":null
   },
   "results":[
      {
         "id":1,
         "name":"Rick Sanchez",
         "status":"Alive",
         "species":"Human",
         "type":"",
         "gender":"Male",
         "origin":{
            "name":"Earth (C-137)",
            "url":"https://rickandmortyapi.com/api/location/1"
         },
         "location":{
            "name":"Citadel of Ricks",
            "url":"https://rickandmortyapi.com/api/location/3"
         },
         "image":"https://rickandmortyapi.com/api/character/avatar/1.jpeg",
         "episode":[
            "https://rickandmortyapi.com/api/episode/1"
         ],
         "url":"https://rickandmortyapi.com/api/character/1",
         "created":"2017-11-04T18:48:46.250Z"
      },
      {
         "id":2,
         "name":"Morty Smith",
         "status":"Alive",
         "species":"Human",
         "type":"",
         "gender":"Male",
         "origin":{
            "name":"unknown",
            "url":""
         },
         "location":{
            "name":"Citadel of Ricks",
            "url":"https://rickandmortyapi.com/api/location/3"
         },
         "image":"https://rickandmortyapi.com/api/character/avatar/2.jpeg",
         "episode":[
            "https://rickandmortyapi.com/api/episode/1"
         ],
         "url":"https://rickandmortyapi.com/api/character/2",
         "created":"2017-11-04T18:50:21.651Z"
      },
      {
         "id":3,
         "name":"Summer Smith",
         "status":"Alive",
         "species":null,
         "type":"",
         "gender":"Female",
         "origin":{
            "name":"Earth (Replacement Dimension)",
            "url":"https://rickandmortyapi.com/api/location/20"
         },
         "location":{
            "name":"Earth (Replacement Dimension)",
            "url":"https://rickandmortyapi.com/api/location/20"
         },
         "image":"https://rickandmortyapi.com/api/character/avatar/3.jpeg",
         "episode":[
            "https://rickandmortyapi.com/api/episode/6"
         ],
         "url":"https://rickandmortyapi.com/api/character/3",
         "created":"2017-11-04T19:09:56.428Z"
      }
   ]
}
```


