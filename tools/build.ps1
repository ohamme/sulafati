Write-Host ""
Write-Host "==============================="
Write-Host "      Sulafati Build Tool"
Write-Host "==============================="
Write-Host ""

flutter clean

flutter pub get

dart fix --apply

flutter analyze

if ($LASTEXITCODE -eq 0) {

    Write-Host ""
    Write-Host "Analysis OK"
    Write-Host ""

    flutter run

}
else {

    Write-Host ""
    Write-Host "هناك أخطاء يجب إصلاحها أولاً."
}