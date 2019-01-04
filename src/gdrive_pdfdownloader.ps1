##################################################################################
#               gdrive_pdfdownloader                                             #
#                   -Akshay Mohan                                                #
# Last update : 5th of January, 2019                                             #
#                                                                                #
# This is a very quick workaround to download PDF files, mostly                  #
# the read-only versions from Google drive. I created this for                   #
# personal use, which is why the script is very limited.                         #
#                                                                                #
#                                                                                #
#                                                                                #
# Please consider reading the README file on the repository                      #
# for usage details.                                                             #
#                                                                                #
# 	LICENSE:                                                                 #
# 	                                                                         #
# 	MIT License                                                              #
#                                                                                #
# Copyright (c) 2019 Akshay Mohan                                                #
#                                                                                #
# Permission is hereby granted, free of charge, to any person obtaining a copy   #
# of this software and associated documentation files (the "Software"), to deal  #
# in the Software without restriction, including without limitation the rights   #
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell      #
# copies of the Software, and to permit persons to whom the Software is          #
# furnished to do so, subject to the following conditions:                       #
#                                                                                #
# The above copyright notice and this permission notice shall be included in all #
# copies or substantial portions of the Software.                                #
#                                                                                #
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR     #
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,       #
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE    #
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER         #
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,  #
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE  #
# SOFTWARE.                                                                      #
##################################################################################

$imageLink = Read-Host -Prompt "Enter any page/image link"
$numImages = Read-Host -Prompt "Enter the number of pages/images to be downloaded"
$saveLocat = Read-Host -Prompt "Download to location"

if(!(Test-Path $saveLocat)) {

    New-Item -Path $saveLocat -ItemType Directory | Out-Null
}
$i = 0
$downloadCount = 0
$webClient = New-Object net.webclient
while($i -lt $numImages) {

    $imageLink = $imageLink -replace '(?<=&page=).*?(?=&)', $i
    try {

        $webClient.DownloadFile($imageLink, "$saveLocat\$i.png")
        
        $downloadCount++
        Write-Progress -Activity "Download in Progress" -Status "$downloadCount/$numImages completed" -PercentComplete (($downloadCount / $numImages) * 100)
    } catch [System.Net.WebException] {

       Write-Host "Downloading page" ($i + 1) "failed! (Reason : Possibly expired links or invalid page counts)"
       Write-Host "Check exceptions.txt for further information."

       Get-Date | Out-File "exceptions.txt" -Append
       $_ | Out-File "exceptions.txt" -Append
    }
    finally {

        $i++
    }
}
Write-Host "Program exiting..."
Start-Sleep -s 10
