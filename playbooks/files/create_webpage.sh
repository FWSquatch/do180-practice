#!/bin/bash

index="/var/www/html/index.html"

echo -e "<HTML>
<head><title>DO180 Registry</title></head>
<body>" > $index

echo -e "<div align="center"><H2>Welcome to the DO180 Practice Registry</H2></div>
<p>The following images are available of this server:</br><ul>" >> $index
for image in hello-world httpd mariadb ;
do
	k=$(ls -l /var/lib/registry/docker/registry/v2/repositories/$image/_manifests/tags | grep -v total | awk '{print "<li>" $NF "</li>"}')
	echo -e "</ul><ul><b>$image</b>"  >> $index
	echo -e "$k" >> $index
done
echo -e "</ul>
</body>
</HTML>" >> $index
