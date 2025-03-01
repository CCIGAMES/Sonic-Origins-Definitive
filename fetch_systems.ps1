$baseUrl = "https://raw.githubusercontent.com/RSDKModding/RSDKv4-Decompilation/main/RSDKv4"
$files = @(
    "Audio.hpp",
    "Audio.cpp",
    "Input.hpp",
    "Input.cpp",
    "Script.hpp",
    "Script.cpp",
    "Networking.hpp",
    "Networking.cpp"
)

$targetDir = "Hybrid-RSDK Main/RSDKV4/RSDKV4"
if (-not (Test-Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir -Force
}

foreach ($file in $files) {
    $url = "$baseUrl/$file"
    $output = Join-Path $targetDir $file
    Write-Host "Downloading $file from $url"
    try {
        Invoke-WebRequest -Uri $url -OutFile $output -ErrorAction Stop
        Write-Host "Successfully downloaded $file"
    }
    catch {
        Write-Host "Failed to download $file"
        Write-Host $_.Exception.Message
    }
    Start-Sleep -Milliseconds 100
}
