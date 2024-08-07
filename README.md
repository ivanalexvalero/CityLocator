# CityLocator

**CityLocator** es una aplicación nativa de iOS desarrollada en SwiftUI. La aplicación permite a los usuarios ver un listado de ciudades, un buscador para filtrar por nombre, seleccionar una ciudad y poder ver su localizacion en un mapa, ademas, con posibilidad de obtener mas informacion respecto de esa localidad con presionar un boton adicional.

## Características

- **Buscador de Ciudades**: Permite buscar ciudades por nombre en un listado.
- **Listado de Ciudades**: Muestra una lista de ciudades con nombre, nomenclatura del país, longitud y latitud.
- **Vista en Mapa**: Permite ver la ubicación de la ciudad en un mapa.
- **Vista Detalle**: Muestra detalles de la ciudad seleccionada al presionar el botón de "Más info".
- **Modo Landscape**: La aplicación se adapta para ser visualizada en modo landscape.

## Explicación de Uso

Cada ciudad se muestra con su nombre y nomenclatura del país (por ejemplo, "Alabama, US"), junto con su latitud y longitud. Las ciudades se presentan en un listado, y al seleccionar una de ellas, se desplegará una nueva pantalla mostrando un mapa donde el usuario podrá ubicarla y navegar en él. También habrá un botón en la parte inferior que proporcionará más información sobre la ciudad seleccionada.

## Desarrollo de la App

Se tomó la decisión de incluir un buscador en la parte superior de la aplicación para un mejor manejo y centrado en la usabilidad. Además, se utilizó un diseño simple para el listado de las ciudades. 

En cuanto al mapa, se priorizó el uso de la presentación nativa Sheet de iOS, que permite un mejor uso del mapa y facilita que el usuario vuelva al listado anterior deslizando la pantalla hacia abajo. Lo mismo ocurrió con la pantalla de más información, ya que se decidió desarrollar una vista que cubra la pantalla por completo para que el usuario pueda leer toda la información relevante sobre la ciudad. Un icono de "X" en rojo en la esquina superior derecha permite cerrar esta pantalla y regresar al mapa.

## Algunas Capturas del Funcionamiento de la Aplicación

<img width="310px" src="https://github.com/user-attachments/assets/ef03b93a-a684-481b-91dc-79aca6f952ad" alt="Captura 1">
<img width="310px" src="https://github.com/user-attachments/assets/64e5baee-7cb4-4a53-ba9c-4340d926705c" alt="Captura 2">
<img width="310px" src="https://github.com/user-attachments/assets/d2c2cbc1-f63b-4ab1-af26-f3fa41729348" alt="Captura 3">
<img width="310px" src="https://github.com/user-attachments/assets/76cde394-9b17-43a0-ad1c-eec6a09d296a" alt="Captura 4">
<img width="310px" src="https://github.com/user-attachments/assets/b817323d-20ca-4623-a5da-36f4cfab953d" alt="Captura 5">
