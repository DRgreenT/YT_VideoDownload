***Exe files from:***</br>
<ins>Special thanks to these guys!</ins></br>

yt-dlp.exe → [HERE](https://github.com/yt-dlp/yt-dlp)</br>
ffmpeg.7z →  [HERE](https://github.com/GyanD/codexffmpeg/releases/tag/2025-03-03-git-d21ed2298e)</br></br>

***Important!***</br></br>
1. download 7z file and unpack it</br>    
2. run ytdl.bat.</br>
3. paste the YouTube link when prompted.</br>
4. good luck! Sometimes YouTube just doesn't want you to download long videos.</br>
5. a folder with the file will be created on your desktop. </br>
    If the download is successful, you will find your video there afterwards.</br>

    The current setting is optimized for YouTube videos longer than 2 hours.</br>
    The script runs until it has successfully downloaded the video.</br>
    You can close the window, the programm will continue where it stoped before you closed,</br> 
    if you haven´t deleted the temporary files in the target folder.</br>
    
    If necessary, you can edit the values in config.ini.</br> 
    More information: [HERE](https://github.com/yt-dlp/yt-dlp/blob/master/README.md).</br>
    The limit-rate value in the config.ini is very likely the one you want to adjust (eg. 500K or 2M and so on).</br>
    In my case ~200K worked best. </br> 

    I created this batch file out of frustration with the standard procedure,</br> 
	because I was trying to download a 31-hour YouTube video and it kept failing.</br>

    There is a one minute pause between each failed attempt.</br>
    If the script continues to fail, restart your router - YouTube has probably blocked your IP address.</br>
    You can edit the script as you wish.</br></br>
    
***Disclaimer:***</br></br>
Use this script at your own risk.</br>
I take no responsibility for any damages, problems or any consequences that may occur.</br>
All credit goes to the creators of yt-dlp and ffmpeg.</br>