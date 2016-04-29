#!/bin/bash

LANG_DST="pt_BR"
VERSION="9.5"
SOURCE_DOC=
PGSQL_SOURCE="../postgresql-9.5.0"


#install packages to build po files.
#apt-get update && apt-get install -y docbook docbook-dsssl docbook-xsl libxml2-utils openjade1.3 opensp xsltproc make tidy gnome-doc-utils




if ! [ -d "xml" ]
then
  mkdir -p xml/ref 
fi

if ! [ -d "po" ]
then
  mkdir -p po/ref
fi


cp -R $PGSQL_SOURCE/doc/src/sgml .
cd sgml

for i in $(echo ref/allfiles.sgml filelist.sgml)
do
  cp $i ${i/%sgml/xml}
done

cd ..

for i in $(find . ! -name "standalone-install.sgml" ! -name "version.sgml" ! -name "allfiles.sgml" ! -name "filelist.sgml" ! -name "postgres.sgml" -name "*.sgml" -printf "%P\n") 
do

  FILE=${i#sgml/}
  echo "OSX $i"
  osx -D. -x lower -b UTF-8 -i include-xslt-index $i >  xml/${FILE/%sgml/xml} 2> /dev/null
  if [ $? = 2 ]; then exit ; fi
  echo "Tidy" $i
  tidy -i -q -xml -m xml/${FILE/%sgml/xml} xml/${FILE/%sgml/xml}
  if [ $? = 2 ]; then exit ; fi
  echo "xml2po" $i
  xml2po -o po/${FILE/%sgml/po} xml/${FILE/%sgml/xml}
  if [ $? = 2 ]; then exit ; fi 
done




