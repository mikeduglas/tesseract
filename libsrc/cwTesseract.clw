!Generated .CLW file (by the Easy COM generator v 1.14)

  MEMBER
  INCLUDE('svcomdef.inc'),ONCE
  MAP
    MODULE('WinAPI')
      ecg_DispGetParam(LONG pdispparams,LONG dwPosition,VARTYPE vtTarg,*VARIANT pvarResult,*SIGNED uArgErr),HRESULT,RAW,PASCAL,NAME('DispGetParam')
      ecg_VariantInit(*VARIANT pvarg),HRESULT,PASCAL,PROC,NAME('VariantInit')
      ecg_VariantClear(*VARIANT pvarg),HRESULT,PASCAL,PROC,NAME('VariantClear')
      ecg_VariantCopy(*VARIANT vargDest,*VARIANT vargSrc),HRESULT,PASCAL,PROC,NAME('VariantCopy')
      memcpy(LONG lpDest,LONG lpSource,LONG nCount),LONG,PROC,NAME('_memcpy')
      GetErrorInfo(ULONG dwReserved,LONG pperrinfo),HRESULT,PASCAL,PROC
    END
    INCLUDE('svapifnc.inc')
    Dec2Hex(ULONG),STRING
    INCLUDE('getvartype.inc', 'DECLARATIONS')
  END
  INCLUDE('cwTesseract.inc')

Dec2Hex                       PROCEDURE(ULONG pDec)
locHex                          STRING(30)
  CODE
  LOOP UNTIL(~pDec)
    locHex = SUB('0123456789ABCDEF',1+pDec % 16,1) & CLIP(locHex)
    pDec = INT(pDec / 16)
  END
  RETURN CLIP(locHex)

  INCLUDE('getvartype.inc', 'CODE')
!========================================================!
! ICWTesseractClass implementation                       !
!========================================================!
ICWTesseractClass.Construct   PROCEDURE()
  CODE
  SELF.debug=true

ICWTesseractClass.Destruct    PROCEDURE()
  CODE
  IF SELF.IsInitialized=true THEN SELF.Kill() END

ICWTesseractClass.Init        PROCEDURE()
loc:lpInterface                 LONG
  CODE
  SELF.HR=CoCreateInstance(ADDRESS(IID_CWTesseract),0,SELF.dwClsContext,ADDRESS(IID_ICWTesseract),loc:lpInterface)
  IF SELF.HR=S_OK
    RETURN SELF.Init(loc:lpInterface)
  ELSE
    SELF.IsInitialized=false
    SELF._ShowErrorMessage('ICWTesseractClass.Init: CoCreateInstance',SELF.HR)
  END
  RETURN SELF.HR

ICWTesseractClass.Init        PROCEDURE(LONG lpInterface)
  CODE
  IF PARENT.Init(lpInterface) = S_OK
    SELF.ICWTesseractObj &= (lpInterface)
  END
  RETURN SELF.HR

ICWTesseractClass.Kill        PROCEDURE()
  CODE
  IF PARENT.Kill() = S_OK
    SELF.ICWTesseractObj &= NULL
  END
  RETURN SELF.HR

ICWTesseractClass.GetInterfaceObject  PROCEDURE()
  CODE
  RETURN SELF.ICWTesseractObj

ICWTesseractClass.GetInterfaceAddr    PROCEDURE()
  CODE
  RETURN ADDRESS(SELF.ICWTesseractObj)
  !RETURN INSTANCE(SELF.ICWTesseractObj, 0)

ICWTesseractClass.GetLibLocation  PROCEDURE()
  CODE
  RETURN GETREG(REG_CLASSES_ROOT,'CLSID\{{36657D15-A999-4CD8-BFF6-FBF21841397C}\InprocServer32')

ICWTesseractClass.vCreateEngine   PROCEDURE(BSTRING pdatapath,BSTRING planguage)
HR                                  HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ICWTesseractObj.CreateEngine(pdatapath,planguage)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ICWTesseractClass.CreateEngine',HR)
  END
  RETURN HR

ICWTesseractClass.vDisposeEngine  PROCEDURE()
HR                                  HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ICWTesseractObj.DisposeEngine()
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ICWTesseractClass.DisposeEngine',HR)
  END
  RETURN HR

ICWTesseractClass.vGetTextFromFile    PROCEDURE(BSTRING pimagefile,*BSTRING ppRetVal)
HR                                      HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ICWTesseractObj.GetTextFromFile(pimagefile,ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ICWTesseractClass.GetTextFromFile',HR)
  END
  RETURN HR

ICWTesseractClass.vGetTextFromBitmap  PROCEDURE(*VARIANT pbytearr,*BSTRING ppRetVal)
v:pbytearr                              VARIANT
gv:pbytearr                             LIKE(gVariant),OVER(v:pbytearr)
HR                                      HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  v:pbytearr=pbytearr
  HR=SELF.ICWTesseractObj.GetTextFromBitmap(v:pbytearr,ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ICWTesseractClass.GetTextFromBitmap',HR)
  END
  RETURN HR

