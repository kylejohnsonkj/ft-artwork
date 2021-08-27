# ft-artwork

Measure hooks and PowerShell script for the [Monstercat Visualizer Rainmeter skin](https://github.com/marcopixel/monstercat-visualizer) to send now playing album artwork to a running flaschen-taschen server. In my case, this allows displaying live album art from iTunes/Apple Music on a 64x64 rgb led matrix connected to my raspberry pi.

Files go in `C:\Users\<username>\Documents\Rainmeter\Skins\monstercat-visualizer\Song Information\Cover`

### Notes

* send-image is from the [flaschen-tachen](https://github.com/hzeller/flaschen-taschen/tree/master/client) project and was compiled in a unix environment
* the powershell script executes it using WSL (v1)
* if the skin shows album art for an alternative media player, it's compatible

![pi screenshot](screenshot.png)
![matrix screenshot](https://i.imgur.com/YwgyrJU.jpeg)


If you have modified the skin already or just want the changes to Cover.ini, here you go!

`[Rainmeter]` \
`OnRefreshAction=...[!CommandMeasure MeasureUpdateArt "Run"]`

`[MeasureUpdateArt]` \
`Measure=Plugin` \
`Plugin=RunCommand` \
`Program=PowerShell.exe` \
`Parameter=-ExecutionPolicy Bypass -Command ".\UpdateArt.ps1 [MeasureCover]"` \
`OutputType=ANSI` \
`DynamicVariables=1` \
`FinishAction=[!CommandMeasure MeasureUpdateArt "Run"]`