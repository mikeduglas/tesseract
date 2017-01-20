!Generated .INC file (by the Easy COM generator v 1.14)

    INCLUDE('ecom2inc.def'),ONCE
    INCLUDE('cwTesseract.int'),ONCE
    INCLUDE('ecombase.inc'),ONCE

ICWTesseractClass               CLASS(EasyCOMClass),TYPE,MODULE('cwTesseract.clw'),LINK('cwTesseract.clw')
ICWTesseractObj                   &ICWTesseract,PROTECTED
Construct                         PROCEDURE()
Destruct                          PROCEDURE(),DERIVED
Init                              PROCEDURE(),HRESULT,PROC,DERIVED
Init                              PROCEDURE(LONG lpInterface),HRESULT,PROC,DERIVED
Kill                              PROCEDURE(),HRESULT,PROC,DERIVED
GetInterfaceObject                PROCEDURE(),*ICWTesseract
GetInterfaceAddr                  PROCEDURE(),LONG
GetLibLocation                    PROCEDURE(),STRING,DERIVED
!Interface methods
vCreateEngine                     PROCEDURE(BSTRING datapath,BSTRING language),HRESULT,PROC,VIRTUAL,PROTECTED
vDisposeEngine                    PROCEDURE(),HRESULT,PROC,VIRTUAL,PROTECTED
vGetTextFromFile                  PROCEDURE(BSTRING imagefile,*BSTRING pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
vGetTextFromBitmap                PROCEDURE(*VARIANT bytearr,*BSTRING pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
                                END

