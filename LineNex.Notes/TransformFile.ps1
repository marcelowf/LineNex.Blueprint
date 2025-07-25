$diretorio = "C:\TCC\LineNex-Backend"

Get-ChildItem -Path $diretorio -Recurse -File | ForEach-Object {
    $novoNome = $_.Name -replace 'ProductLine', 'ProductionLine'
    $novoCaminho = Join-Path $_.DirectoryName $novoNome
    Rename-Item -Path $_.FullName -NewName $novoCaminho
}