#
# TESS4J trial
#
[void][Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
Add-Type -AssemblyName System.Windows.Forms
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ 
    InitialDirectory = [Environment]::GetFolderPath('Desktop') 
    Filter = 'Image (*.jpg,*.png,*.jpeg)|*.png;*.jpg,*.jpeg'
    Title = 'Select Image File'
}
#
# select image file from desktop get its file name
#
if($FileBrowser.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK){
    $IMGFILE = $FileBrowser.FileName+" "
}else{
    Write-Host file chooser canceled
}
#
# execute tesseract ocr
#
$TESS4J = $env:LOCALAPPDATA+"\Tesseract-OCR\tesseract.exe "
$OCROUT = $env:USERPROFILE+"\Desktop\out "
$OPTIONS = "-l jpn"
$EXEC_COMD = $TESS4J+$IMGFILE+$OCROUT+$OPTIONS
Invoke-Expression $EXEC_COMD

