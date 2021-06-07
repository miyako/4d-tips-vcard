//%attributes = {"invisible":true,"preemptive":"capable"}
C_PICTURE:C286($1;$src)
C_TEXT:C284($2;$name;$3;$mime;$0;$dst;$encoded)

$src:=$1
$name:=$2
$mime:=$3

Case of 
	: ($mime="image/png")
		
		$header:=$name+";ENCODING=b;TYPE=PNG:"
		
	Else 
		
		$mime:="image/jpeg"
		$header:=$name+";ENCODING=b;TYPE=JPEG:"
		
End case 

C_BLOB:C604($data)
PICTURE TO BLOB:C692($src;$data;$mime)
BASE64 ENCODE:C895($data;$encoded)

$0:=$header+$encoded