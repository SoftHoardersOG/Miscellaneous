start powershell.exe -noexit -Command "Set-Location D://Desktop/Documents` Robotics/platform-tools;  echo "Verifing` connection..."; $devices = ./adb devices; if(!$devices[2]) { echo "Connecting..."; $a = ipconfig; $line=0; for($o=1; !($a[$o-1] -match 'Default Gateway'); $o=$o+1){if($a[$o] -match 'Default Gateway'){ $line=$o; break; }; }; $ip4Net = $null;  for($i=39; $a[$line][$i+1]; $i++) {$ip4Net+=$a[$line][$i];}; $ip4Net;  1..254|ForEach-Object{ Start-Process  ping.exe -WindowStyle Hidden -Argumentlist ("$ip4Net"+"$_"); $name = nslookup ("$ip4Net"+"$_") | Select-String 'name' -ErrorAction SilentlyContinue; Start-Sleep 0.5; if($name -match 'A70'){ $ip6 =("$ip4Net"+"$_");};};  ./adb tcpip 5555; Start-Sleep 3; echo $ip6; ./adb connect $ip6;} else{echo "Already` connected"; };"
