$imagePath = $args[0]

if ((get-filehash $imagePath).hash -eq (get-filehash "art.jpg").hash) {
    # do nothing if image hasn't changed
    exit
}

Copy-Item -Path $imagePath -Destination "art.jpg"

$command = "wsl.exe './send-image' -g 64x64 -h 192.168.1.45 art.jpg"
$powershell = Start-Process powershell.exe -PassThru -windowstyle hidden -ArgumentList $command
Start-Sleep -s 1
Stop-Process $powershell
