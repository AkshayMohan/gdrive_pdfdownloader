# gdrive_pdfdownloader
A simple powershell script that downloads all the PDF pages from a given google drive view. This was meant for personal use so the features are very limited for now. In future, I might automate the script completely and not just limit only to Windows.

## Usage
Suppose there's a read-only, download restricted [PDF file](https://drive.google.com/file/d/1ihK6L8y_SpZf9eE4NElbsT_KgugVuyUz/view). The following are the steps for a Firefox user. I assume these steps are similar for Chrome and other browsers too.

- Right click and select "Inspect Element".
- Navigate to "Network" tab.
- On the 'filter' bar, type in "img?". If you don't find any results, simply refresh the page by pressing F5 button. Once the page starts loading, scroll downwards until you get atleast one file name having the substring "img?".
![a.png](https://raw.githubusercontent.com/AkshayMohan/gdrive_pdfdownloader/master/Screenshots/a.png)
- Right click on any one of the file names and copy the URL.
![b.png](https://raw.githubusercontent.com/AkshayMohan/gdrive_pdfdownloader/master/Screenshots/b.png)

- Open the powershell script and paste the link.
- Mention the number of pages you want to download. In this case, there's 5 pages so I enter 5.
- Type in the destination where the downloaded images should be stored at.

![c.png](https://raw.githubusercontent.com/AkshayMohan/gdrive_pdfdownloader/master/Screenshots/c.png)

![d.png](https://raw.githubusercontent.com/AkshayMohan/gdrive_pdfdownloader/master/Screenshots/d.png)

## Changelogs
v1.0.0 - 5th of January, 2019
- Initial release.

## LICENSE
Licensed under MIT.
