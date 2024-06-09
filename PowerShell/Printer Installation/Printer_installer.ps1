# Define the path to the extracted driver INF file
$DriverInfPath = "$env:PUBLIC\GPlus_UFRII_Driver_V290_W64_00\GPlus_UFRII_Driver_V290_W64_00\Driver\CNLB0MA64.INF"

# Define the path for downloading and extracting the driver
$DownloadUrl = Read-Host "Enter URL"
$DownloadPath = "$env:PUBLIC\GPlus_UFRII_Driver_V290_W64_00.zip"
$ExtractPath = "$env:PUBLIC\GPlus_UFRII_Driver_V290_W64_00"

# Define the printer driver name
$DriverName = "Canon UFRII LT Printer Driver"

# Define the printer configurations
$Printers = @(
    [pscustomobject]@{
        name="Queen (Mail) - Color";
        ip="192.168.43.15";
        port_name="192.168.43.15_1";
        color=1;
    },
    [pscustomobject]@{
        name="Queen (Mail) - B&W";
        ip="192.168.43.15";
        port_name="192.168.43.15_2";
        color=0;
    },
    [pscustomobject]@{
        name="Queen (Agents) - Color";
        ip="192.168.43.16";
        port_name="192.168.43.16_1";
        color=1;
    },
    [pscustomobject]@{
        name="Queen (Agents) - B&W";
        ip="192.168.43.16";
        port_name="192.168.43.16_2";
        color=0;
    }
)

# Define functions for downloading files
function Download-File($url, $path) {
    Invoke-WebRequest -Uri $url -OutFile $path
}

# Download the driver ZIP file
Download-File -url $DownloadUrl -path $DownloadPath

# Exfunction Expand-ZipArchive {
    param (
        [string]$ZipFile,
        [string]$ExtractFolder
    )

    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::ExtractToDirectory($ZipFile, $ExtractFolder)
}

# Use the function to extract the zip file
Expand-ZipArchive -ZipFile $DownloadPath -ExtractFolder $ExtractPath

# Install the driver
pnputil.exe /add-driver "C:\Users\Public\GPlus_UFRII_Driver_V290_W64_00\GPlus_UFRII_Driver_V290_W64_00\Driver\CNLB0MA64.INF"

# Setup printers
$Printers | ForEach-Object {
    Install-Printer -Address $_.ip -Name $_.name -PortName $_.port_name -DriverName $DriverName
    Config-Printer -Name $_.name -Color $_.color
}


