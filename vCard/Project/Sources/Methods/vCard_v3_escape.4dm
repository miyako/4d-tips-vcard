//%attributes = {"invisible":true,"preemptive":"capable"}
C_TEXT:C284($1;$src;$0;$dst)
C_BOOLEAN:C305($2;$ignoreComma)

$src:=$1

If (Count parameters:C259>1)
	$ignoreComma:=$2
End if 

For ($i;1;Length:C16($src))
	
	$char:=$src[[$i]]
	$code:=Character code:C91($char)
	
	Case of 
		: ($code=0x000D)
			$dst:=$dst+"\\\n"
		: ($code=0x000A)
			  //native 4D text (unless imported from external origin) is always CR but let's be sure...
			If ($i=1)
				$dst:=$dst+"\\\n"
			Else 
				If (Character code:C91($src[[$i-1]])=0x000D)
					  //already printed
				Else 
					$dst:=$dst+"\\\n"
				End if 
			End if 
		: ($code=0x002C) & (Not:C34($ignoreComma))  //comma
			$dst:=$dst+"\\,"
		: ($code=0x003B)  //semi-colon
			$dst:=$dst+"\\;"
		: ($code=0x005C)  //anti-slash
			$dst:=$dst+"\\\\"
		Else 
			$dst:=$dst+$char
	End case 
	
End for 

$0:=$dst