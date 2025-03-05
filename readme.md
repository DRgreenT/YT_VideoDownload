I created this batch file out of frustration with the standard procedure,</br> 
because I was trying to download a 31-hour YouTube video and it kept failing.</br>
With this script it took me a hole night to download it.</br>

Maybe there is a builtin solution, but I was to lazy to read the hole documentation.</br>

***How to:***</br></br>
1.  download [yt-dlp](https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe)</br> 
2.  download [ffmpeg](https://github.com/GyanD/codexffmpeg/releases/download/2025-03-03-git-d21ed2298e/ffmpeg-2025-03-03-git-d21ed2298e-essentials_build.7z) unpack it. </br> 
3.  download [YT_VDownload](https://github.com/DRgreenT/YT_VideoDownload/blob/master/Downloads/Release.7z)
4.  unpack Release.7z
5.  unpack ffmpeg and navigate to the bin folder, unpack ffmpeg into source folder of YT_VD Release...
6.  copy yt-dlp in source folder too. 

7.  run ytdl.bat.</br>
8.  paste the YouTube link when prompted.</br>
9.  good luck! Sometimes YouTube just doesn't want you to download long videos.</br>
10. a folder with the file will be created on your desktop. </br>
    If the download is successful, you will find your video there afterwards.</br>

***Additonal info:***</br></br>
    The current setting is optimized for YouTube videos longer than 2 hours.</br>
    The script runs until it has successfully downloaded the video.</br>
    You can close the window, the programm will continue where it stoped before you closed,</br> 
    if you haven´t deleted the temporary files in the target folder.</br>
    
    There is a one minute pause between each failed attempt.</br>

    If necessary, you can edit the values in config.ini.</br> 
    More information: [HERE](https://github.com/yt-dlp/yt-dlp/blob/master/README.md).</br>
    The limit-rate value in the config.ini is very likely the one you want to adjust (eg. 500K or 2M and so on).</br>
    In my case ~200K worked best. </br> 
    
    If the script continues to fail, restart your router - YouTube has probably blocked your IP address.</br>
    You can edit the script as you wish.</br></br>
    
***Disclaimer:***</br></br>
Use this script at your own risk.</br>
I take no responsibility for any damages, problems or any consequences that may occur.</br>
All credit goes to the creators of yt-dlp and ffmpeg.</br>