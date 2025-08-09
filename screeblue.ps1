# Verifica se está sendo executado como Administrador
if (-not ([Security.Principal.WindowsPrincipal] `
    [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole]::Administrator)) {

    Write-Host "Reiniciando o script com privilégios de administrador..."
    Start-Process powershell "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# Caminho da pasta
$folderPath = "C:\Windows\System32\config\OSDATA"

# Cria a pasta, se não existir
if (-not (Test-Path $folderPath)) {
    New-Item -Path $folderPath -ItemType Directory -Force | Out-Null
    Write-Host "Pasta criada com sucesso: $folderPath"
} else {
    Write-Host "A pasta já existe: $folderPath"
}
