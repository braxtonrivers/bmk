SuperStrict

Extern
?bmxng
	Function popen:Byte Ptr(command:Byte Ptr, Mode:Byte Ptr)
?Not bmxng
	Function popen:Int(command:Byte Ptr, Mode:Byte Ptr)
?
End Extern

Function GetCoreCount:Int()
	Global count:Int

	If Not count Then
		Local buf:Byte[128]
?bmxng
		Local fp:Byte Ptr = popen("/bin/cat /proc/cpuinfo |grep -c '^processor'", "r")
?Not bmxng
		Local fp:Int = popen("/bin/cat /proc/cpuinfo |grep -c '^processor'", "r")
?
		fread_(buf, 1, 127, fp)
		fclose_(fp)
		count = String.FromCString(buf).ToInt()
	End If

	Return count
End Function
