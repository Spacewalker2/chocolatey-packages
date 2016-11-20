$ErrorActionPreference = 'Stop';
$packageName = 'OllyDbg'

$toolsDir = ${Env:ProgramFiles(x86)}
if(-Not ($toolsDir)) {
  $toolsDir = ${Env:ProgramFiles}
}
$toolsDir = Join-Path $toolsDir $packageName

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = 'http://www.ollydbg.de/odbg110.zip'
  checksum      = '73B1770F28893DAB22196EB58D45EDE8DDF5444009960CCC0107D09881A7CD1E'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$target = Join-Path $toolsDir "OLLYDBG.EXE"
$shortcut = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\" + $packageName + ".lnk"
Install-ChocolateyShortcut -shortcutFilePath $shortcut -targetPath $target