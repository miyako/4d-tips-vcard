//%attributes = {"invisible":true,"preemptive":"capable"}
C_COLLECTION:C1488($1;$src)
C_TEXT:C284($0;$dst)

$src:=$1

For ($i;0;$src.length-1)
	
	$valueType:=Value type:C1509($src[$i])
	
	Case of 
		: ($valueType=Is collection:K8:32)  //do not escape the comma inside the list
			
			$dst:=$dst+Choose:C955($i#0;";";"")
			For ($j;0;$src[$i].length-1)
				$dst:=$dst+Choose:C955($j#0;",";"")
				$dst:=$dst+vCard_v3_escape (Choose:C955($src[$i][$j]=Null:C1517;"";String:C10($src[$i][$j]));True:C214)
			End for 
			
		: ($valueType=Is null:K8:31)
			$dst:=$dst+Choose:C955($i#0;";";"")
			
		Else 
			
			$dst:=$dst+Choose:C955($i#0;";";"")+vCard_v3_escape (String:C10($src[$i]))
			
	End case 
	  //the String function returns "null"
	
	
End for 

$0:=$dst