# tesseract for Clarion

Tesseract is Open Source OCR (Optical character recognition).  
[Home page](https://github.com/tesseract-ocr/tesseract)  

## v5.x

### Input supported
Any image readable by Leptonica is supported in Tesseract including BMP, PNM, PNG, JFIF, JPEG, TIFF and GIF.  

### Output formats
- Tesseract has unicode (UTF-8) support, and can recognize more than 100 languages "out of the box".
- Tesseract supports various output formats: plain text, hOCR (HTML), PDF, invisible-text-only PDF, TSV. The master branch also has experimental support for ALTO (XML) output.  
- This wrapper now supports plain text and hOCR (HTML).

### Demo application (ocrdemo.exe)
The demo supports 2 languages: English and Russian (other languages on demand), and can output to text or html.

#### Usage

1.  Open an image.
2.  Select a language of a document.
3.  Select appropriate Page segmentation mode.
4.  Select desired output format (text or html).
5.  Press "Recognize from image" button to extract text from the image.  
 -- or --  
6.  Press "Add rectangle" and move/resize it as needed to mark one block of text. Scroll the image if necessary.
7.  Repeat step 5 to mark all needed blocks.
8.  Press "Recognize rectangles" button to extract text from all rectangles.

#### Download (42 MB zip)
https://yadi.sk/d/0uMA7pUxUQ3zYw  

### Requirements
- C6 or higher (C5 on demand)

### Price
[Buy now](https://www.clarionshop.com/checkout.cfm?pid=1662&q=1)  

## [v3.04](https://github.com/mikeduglas/tesseract/tree/master/v3.04)
A .NET wrapper for [tesseract-ocr 3.04](https://github.com/tesseract-ocr/tesseract/releases/tag/3.04.01).  

### Price
Free