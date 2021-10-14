# TSSOO-tarea02

Este proyecto está basado en el aprendizaje de comandos del Shell de Linux, utilización de opciones y parámetros y la manera en la que estos se pueden conectar para formar operaciones "anidadas" y así utilizarlos en scripts para resolver problemas.

En este caso el problema consta de capturar la informacion de la api https://api.warframe.market/v1/items, transformarla a formato json y eliminar alguna de sus keys para generar un archivo json con las keys restantes.




### Pre-requisitos

*Sistema operativo basado en Linux, por ejemplo, Ubuntu.

*Máquina virtual con un sistema basado en Linux.

*Paquete **jq** instalado.

*Paquete **curl** instalado



### Explicación

Antes de proceder a ejecutar el comando que resuelve el problema se hace un checkeo de existencia en el sistema de los paquetes **jq** y **curl** utilizando el comando **dpkg-query -W --showformat='${Status}\n' $i | grep "install ok installed"**, si el paquete se encuentra en el sistema retornara el texto "install ok installed" de lo contrario retornara un texto vacio, si lo anterior ocurre se instala el paquete con el comando **sudo apt-get --yes install $i**.

Una vez que se cuente con los paquetes necesarios se procede a ejecutar el comando **curl -s https://api.warframe.market/v1/items | jq -S '.payload.items[] |= del(.url_name, .thumb)' > items.json**.


1. **curl -s https://api.warframe.market/v1/items**: Captura de manera silenciosa los datos de la url.

2. **jq -S**: Generar los campos de cada objeto con las claves de manera ordenada.

3. **.payload.items[] |= del(.url_name, .thumb)' > items.json**: Acceder en forma de lista a las claves del archivo ya parseado anteriormente con **jq** para eliminar las claves **url_name** y **thum**. Se finaliza redireccionado la salida a un archivo con el nombre **items.json**. 



### Ejecución 

Utilizando la consola posicionarse dentro de **src/** y ejecutar la instrucción **./script.sh**.
O simplemente dar doble click sobre el archivo **script.sh**.



## Wiki
Puedes encontrar informacion detallada de los comandos utilizados en los siguientes enlaces.
* [jq](https://stedolan.github.io/jq/manual/) - json parser.
* [curl](https://www.mit.edu/afs.new/sipb/user/ssen/src/curl-7.11.1/docs/curl.html) - data transfer.


## Autor

**Diego Espinoza** - 20.479.538-8 - diego.espinozaa@alumnos.uv.cl
