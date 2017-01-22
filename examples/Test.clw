  PROGRAM

  PRAGMA('project(#pragma define(_SVDllMode_ => 0))')
  PRAGMA('project(#pragma define(_SVLinkMode_ => 1))')
  !- link manifest
  PRAGMA('project(#pragma link(Test.EXE.manifest))')

  INCLUDE('cwTesseractEx.inc'), ONCE

  MAP
  END

imgFile                       STRING(256)

Window                        WINDOW('cwTesseract test'),AT(,,454,307),CENTER,GRAY,SYSTEM,FONT('Calibri',10)
                                PROMPT('Select an image:'),AT(12,19),USE(?PROMPT1)
                                ENTRY(@s255),AT(73,17,350),USE(imgFile)
                                BUTTON('...'),AT(427,15,14,14),USE(?bSelectImage)
                                IMAGE,AT(12,43,182,207),USE(?IMAGE1)
                                TEXT,AT(209,43,231,206),USE(?TEXT1),HVSCROLL,READONLY
                                BUTTON('Recognize'),AT(173,269,65,18),USE(?bGetText)
                                BUTTON('From memory'),AT(258,269,75,18),USE(?bGetTextFromMemory)
                              END

ocr                           TTesseract

  CODE
  IF ocr.CreateEngine('.\tessdata', 'eng')
    
    imgFile = 'phototest.bmp'
    
    OPEN(Window)
    ACCEPT
      CASE EVENT()
      OF EVENT:OpenWindow
        ?IMAGE1{PROP:Text} = imgFile
        DISPLAY(?IMAGE1)
      END
      
      CASE ACCEPTED()
      OF ?imgFile
        ?IMAGE1{PROP:Text} = imgFile
        DISPLAY(?IMAGE1)
        ?TEXT1{PROP:Text} = ''
        DISPLAY(?TEXT1)

      OF ?bSelectImage
        IF FILEDIALOG(, imgFile, |
        'Portable Network Graphics (*.png)|*.png|'&|
        'File Interchange Format (*.jpg)|*.jpg|'&|
        'Bitmap files (*.bmp)|*.bmp|'&|
        'Graphics Interchange Format (*.gif)|*.gif|'&|
        'Tagged Image File Format (*.tif)|*.tif', |
        FILE:LongName + FILE:AddExtension)
          ?IMAGE1{PROP:Text} = imgFile
          DISPLAY(?IMAGE1)
          ?TEXT1{PROP:Text} = ''
          DISPLAY(?TEXT1)
        END
                
        DISPLAY(?imgFile)
        
      OF ?bGetText
        IF imgFile
          SETCURSOR(CURSOR:Wait)
          ?TEXT1{PROP:Text} = ocr.GetTextFromFile(imgFile)
          DISPLAY(?TEXT1)
          SETCURSOR()
        END
        
      OF ?bGetTextFromMemory
        IF ?IMAGE1{PROP:ImageBits}
          SETCURSOR(CURSOR:Wait)
          ?TEXT1{PROP:Text} = ocr.GetTextFromBitmap(?IMAGE1{PROP:ImageBits})
          DISPLAY(?TEXT1)
          SETCURSOR()
        END
      END
    END
  END
