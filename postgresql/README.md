# PostgreSQL manual translation to pt_BR

## Draft

The main idea is to make the translations manually or automagic (e.g. Weblate), build automatic html files and push to PostgreSQL Brasil site. 

### build po files
- copy SGML directory from PostgreSQL source code to current direcoty 
- convert from SGML to XML
- convert XML to po file
- 
- push to weblate or manual translate by git

### translation
- pull po files
- translate
- send to pgbr-dev list | weblate to revision
- revision
- push back to git master branch

### Update version 
- merge files using msgmerge or weblate???
 

### Generate html files
- convert po files to xml
- convert xml to html
- push to p.o.b/translate or traducoes.p.o.b site.


## Todo

- script/function to build po files
- script/function to update po files
- script/function to merge po files
- script/function to generate html files
