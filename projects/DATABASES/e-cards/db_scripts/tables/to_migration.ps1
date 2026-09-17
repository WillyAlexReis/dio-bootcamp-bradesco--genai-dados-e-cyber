#Pegar o diretório atual
$scriptDirectory = Split-Path -Path $MyInvocation.MyCommand.definition -Parent

#Arquivo saída com todos sql (corrigido o $scriptDirectory)
$outputFile = Join-Path -Path $scriptDirectory -ChildPath "migration.sql"

#verifica se arquvio já existe, se existe deleta
if (Test-Path $outputFile){
    Remove-Item $outputFile
}

#Pega Conteúdo dos arquivos (corrigido o filtro para *.sql)
$sqlFiles = Get-ChildItem -Path $scriptDirectory -Filter "*.sql" -File | Where-Object { $_.Name -ne "migration.sql" } | Sort-Object Name

#Concatena Arquivos
foreach($file in $sqlFiles){
    Get-Content $file.FullName | Out-File -Append -FilePath $outputFile
    # Se der erro de sintaxe no Postgres por causa do GO, comente a linha abaixo com um #:
    # "GO" | Out-File -Append -FilePath $outputFile
}

Write-Host "Todos Arquivos foram combinados em $outputFile"