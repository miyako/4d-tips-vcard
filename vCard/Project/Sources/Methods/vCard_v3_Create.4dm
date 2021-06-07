//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($1)
C_BLOB:C604($0)

  //https://evertpot.com/escaping-in-vcards-and-icalendar/
$path:=Get 4D folder:C485(Current resources folder:K5:16)+"templates"+Folder separator:K24:12+"Simple-vCard_3_0.4dtag"

If (Test path name:C476($path)=Is a document:K24:1)
	
	$template:=Document to text:C1236($path;"utf-8";Document with CRLF:K24:20)
	
	PROCESS 4D TAGS:C816($template;$template;$1)
	
	  //no BOM (can't use TEXT TO DOCUMENT) 
	CONVERT FROM TEXT:C1011($template;"utf-8";$vcard)
	
	$0:=$vcard
	
End if 