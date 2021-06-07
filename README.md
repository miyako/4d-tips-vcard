# 4d-tips-vcard
simple vCard template

```4d
$vcf:=New object("ORG";New collection("company"))
$vcf.N:=New collection("Fuller";"Andrew";"";"";"")//"lastName";"firstName";"otherNames";"prefix";"suffix"
$vcf.FN:="Andrew Fuller"
$vcf.TITLE:="Vice President, Sales"

C_PICTURE($PHOTO)
$file:=Folder(fk resources folder).file("image.bmp")
$data:=$file.getContent()
BLOB TO PICTURE($data;$PHOTO;$file.extension)
$vcf.PHOTO:=$PHOTO

$vCard:=vCard_v3_Create ($vcf)

BLOB TO DOCUMENT(Folder(fk desktop folder).file("test.vcf").platformPath;$vcard)
```
