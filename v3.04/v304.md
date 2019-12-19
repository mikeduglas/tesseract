# v3.04

A .NET wrapper for [tesseract-ocr 3.04](https://github.com/tesseract-ocr/tesseract/releases/tag/3.04.01).  
Since tesseract and leptonica binaries are compiled with Visual Studio 2015 you'll need to ensure you have the [Visual Studio 2015 Runtime](https://www.microsoft.com/en-us/download/details.aspx?id=48145) installed.  
You will also need to download the [language data files](https://github.com/tesseract-ocr/tessdata/tree/3.04.00) for tesseract 3.04 from tesseract-ocr.  

### Requirements  
- Clarion 6 and higher.  
- Microsoft .NET 4.5.  

### How to run demo program  
Copy all dll files from \bin folder into demo folder. Exe folder should looks like this:
- \tessdata
   - language files (test program supports only English)
- \x86
   - liblept172.dll
   - libtesseract304.dll
- Tesseract.dll
- cwTesseract.dll
- test.exe
- test.exe.manifest
- ClaOLE.dll
- ClaRUN.dll

### How to build
You must have free [EasyCOM2INC](http://www.ingasoftplus.com/ProductDetail.php?ProductID=24) installed to use base COM classes.
