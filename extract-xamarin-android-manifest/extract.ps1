param(
    [string]$pathXamarinAndroidProject,
    [string]$configuration,
    [string]$outputVariable
)
Write-Debug "Entering extract-xamarin-android-manifest task"
Write-Debug "pathXamarinAndroidProject = $pathXamarinAndroidProject"
Write-Debug "configuration = $configuration"
Write-Debug "outputVariable = $outputVariable"

$pathXamarinAndroidProject = $pathXamarinAndroidProject.Trim()
$configuration = $configuration.Trim()
$outputVariable = $outputVariable.Trim()

$filePath = [System.IO.Path]::Combine($pathXamarinAndroidProject,"obj/$configuration/android/AndroidManifest.xml")
$xml = [xml]$(Get-Content $filePath -Encoding UTF8)

Set-TaskVariable -Variable "$outputVariable.PackageName" -Value $xml.manifest.package
Set-TaskVariable -Variable "$outputVariable.ApplicationLabel" -Value $xml.manifest.application.label
Set-TaskVariable -Variable "$outputVariable.VersionName" -Value $xml.manifest.versionName
Set-TaskVariable -Variable "$outputVariable.VersionCode" -Value $xml.manifest.versionCode

Write-Debug "output variable ($outputVariable.PackageName) = $xml.manifest.package"
Write-Debug "output variable ($outputVariable.ApplicationLabel) = $xml.manifest.application.label"
Write-Debug "output variable ($outputVariable.VersionName) = $xml.manifest.versionName"
Write-Debug "output variable ($outputVariable.VersionCode) = $xml.manifest.versionCode"

Write-Debug "Done"