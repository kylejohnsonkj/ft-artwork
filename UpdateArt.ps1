$imagePath = $args[0]

if ((get-filehash $imagePath).hash -eq (get-filehash "art.jpg").hash) {
    # do nothing if image hasn't changed
    exit
}

Copy-Item -Path $imagePath -Destination "art.jpg"

$cmd = "wsl.exe ./send-image -g 64x64 -h 192.168.1.44 art.jpg"
$ps = Start-Process PowerShell.exe -ArgumentList $cmd -WindowStyle Hidden
$ps.WaitForExit()