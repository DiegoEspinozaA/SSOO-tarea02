#!/bin/bash
#~ # -*- ENCODING: UTF-8 -*-

declare -a PAQUETES_REQUERIDOS=('jq' 'curl')

#Verificar que esten instalados los paquetes.
for i in "${PAQUETES_REQUERIDOS[@]}"
do
	PKG_ESTADO=$(dpkg-query -W --showformat='${Status}\n' $i | grep "install ok installed")
	if [ "" = "$PKG_ESTADO" ]; then
	sudo apt-get --yes install $i
	echo " ✓ $i instalado"
	
	else
	echo " ✓ $i instalado."
	
	fi
done

#Creando archivo
echo "Ejecutando script..."
curl -s https://api.warframe.market/v1/items | jq -S '.payload.items[] |= del(.url_name, .thumb)' > items.json
echo "El archivo json fue creado exitosamente!."
exit

