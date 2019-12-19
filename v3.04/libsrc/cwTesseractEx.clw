  MEMBER
  INCLUDE('svcom.inc'), ONCE
  MAP
    MODULE('WinAPI')
      ocr::OutputDebugString(*CSTRING lpOutputString), PASCAL, RAW, NAME('OutputDebugStringA')
    END
    INCLUDE('svapifnc.inc')

    ocr::String2Variant(STRING pData), *VARIANT, PRIVATE
  END
  INCLUDE('cwTesseractEx.inc'), ONCE

ocr::String2Variant           PROCEDURE(STRING pData)
nLen                            LONG, AUTO
sa                              OleSafeArrayExClass
v                               VARIANT
hr                              HRESULT, AUTO
  CODE
  nLen = LEN(pData)
  IF nLen = 0
    RETURN v
  END
  
  hr = sa.Init(VT_UI1, nLen, 0)
  IF hr <> S_OK
    ocr::DebugInfo('ocr::String2Variant: sa.Init error '& hr)
    RETURN v
  END
  
  hr = sa.PutData(ADDRESS(pData), nLen)
  IF hr <> S_OK
    ocr::DebugInfo('ocr::String2Variant: sa.PutData error '& hr)
    RETURN v
  END
  
  RETURN sa.CopyToVariant()

ocr::DebugInfo                PROCEDURE(STRING pMsg)
cPrefix                         CSTRING('[cwTesseract] ')
cs                              CSTRING(LEN(cPrefix) + LEN(pMsg) + 1)
  CODE
  cs = cPrefix & CLIP(pMsg)
  ocr::OutputDebugString(cs)

!!!region TTesseract
TTesseract.Construct          PROCEDURE()
  CODE
  SELF.m_COMIniter &= NEW CCOMIniter
  SELF.Init()

TTesseract.Destruct           PROCEDURE()
  CODE
  PARENT.Destruct()
  DISPOSE(SELF.m_COMIniter)

TTesseract.Init               PROCEDURE()
hr                              HRESULT, AUTO

  CODE
  hr = PARENT.Init()
  IF hr <> S_OK
    ocr::DebugInfo('PARENT.Init error '& SELF.Dec2Hex(hr))
    RETURN hr
  END

  RETURN S_OK
  
TTesseract.Kill               PROCEDURE()
  CODE
  SELF.DisposeEngine()
  RETURN PARENT.Kill()
  
TTesseract.CreateEngine       PROCEDURE(STRING datapath, STRING language)
hr                              HRESULT, AUTO
  CODE
  hr = PARENT.vCreateEngine(CLIP(datapath), CLIP(language))
  RETURN CHOOSE(hr = S_OK)
  
TTesseract.DisposeEngine      PROCEDURE()
  CODE
  PARENT.vDisposeEngine()
  
TTesseract.GetTextFromFile    PROCEDURE(STRING imagefile)
bText                           BSTRING
  CODE
  PARENT.vGetTextFromFile(CLIP(imagefile), bText)
  RETURN bText
  
TTesseract.GetTextFromBitmap  PROCEDURE(STRING pbitmap)
bText                           BSTRING
  CODE
  PARENT.vGetTextFromBitmap(ocr::String2Variant(pbitmap), bText)
  RETURN bText
  
