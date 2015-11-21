@echo off
TITLE CONVERT ALL FILE VIDEO TO MP4
set PATH=%PATH%;C:\Program Files\ffmpeg
set i = 1

set /p driver="Enter Driver(C or D or E ... ): "
set /p outFolder="Enter Output Folder etc:   D:\out\ " ::  D:\out\

for /R %driver%:\ %%f in (*.avi *.mov *.mkv *.3gp) do (
    @echo  process "%%f"
    @echo  file name "%%~nf"
	ffmpeg -i "%%f" -acodec libfaac -b:a 128k -vcodec mpeg4 -b:v 1200k -flags +aic+mv4 "%%f.mp4"
	ffmpeg -i "%%f" -ss 00:00:02 -vframes 1 "%%f.jpg"
	mkdir "%outFolder%""%%~nf"
	move /Y "%%f.mp4" "%outFolder%""%%~nf\""%%~nf.mp4" >nul
	move /Y "%%f.jpg" "%outFolder%""%%~nf\""%%~nf.jpg" >nul
)
pause