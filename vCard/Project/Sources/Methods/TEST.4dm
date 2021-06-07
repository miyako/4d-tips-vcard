//%attributes = {}
$vcf:=New object:C1471("ORG";New collection:C1472("company"))
$vcf.N:=New collection:C1472("Fuller";"Andrew";"";"";"")  //"lastName";"firstName";"otherNames";"prefix";"suffix"
$vcf.FN:="Andrew Fuller"
$vcf.TITLE:="Vice President, Sales"

C_PICTURE:C286($PHOTO)
$file:=Folder:C1567(fk resources folder:K87:11).file("image.bmp")
$data:=$file.getContent()
BLOB TO PICTURE:C682($data;$PHOTO;$file.extension)
$vcf.PHOTO:=$PHOTO

$vCard:=vCard_v3_Create ($vcf)

BLOB TO DOCUMENT:C526(Folder:C1567(fk desktop folder:K87:19).file("test.vcf").platformPath;$vcard)