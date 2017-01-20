  MAP
    MODULE('cwTesseractEx')
      ocr::DebugInfo(STRING s)
    END
  END

  INCLUDE('cwTesseract.inc'), ONCE

TTesseract                    CLASS(ICWTesseractClass), TYPE, MODULE('cwTesseractEx.clw'), LINK('cwTesseractEx.clw')
m_COMIniter                     &CCOMIniter, PRIVATE

Construct                       PROCEDURE()
Destruct                        PROCEDURE(), DERIVED
Init                            PROCEDURE(), HRESULT, PROC, DERIVED
Kill                            PROCEDURE(), HRESULT, PROC, DERIVED

CreateEngine                    PROCEDURE(STRING datapath, STRING language), BOOL, PROC
DisposeEngine                   PROCEDURE()
GetTextFromFile                 PROCEDURE(STRING imagefile), STRING
GetTextFromBitmap               PROCEDURE(STRING pbitmap), STRING
                              END
