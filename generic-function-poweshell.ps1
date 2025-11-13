function Add-AnkiB1Card {
    param(
        [Parameter(Mandatory=$true)]
        [string]$English,

        [Parameter(Mandatory=$true)]
        [string]$Portuguese,

        [Parameter(Mandatory=$true)]
        [string]$Explanation,

        [Parameter(Mandatory=$true)]
        [string]$Vocab,

        [Parameter(Mandatory=$true)]
        [string]$Speaking
    )

    # Nome do deck e modelo (fixos, podem ser parametrizados se desejar)
    $deckName = "Ingles B1 - Speaking Practice"
    $modelName = "Basic"

    # Arquivo temporario de audio
    $audioFile = "output.mp3"

    # Gera o audio com Polly (voz Arthur)
    aws polly synthesize-speech `
        --engine neural `
        --language-code en-GB `
        --voice-id Arthur `
        --output-format mp3 `
        --text $English `
        $audioFile | Out-Null

    # Codifica audio em Base64
    $audioBase64 = [Convert]::ToBase64String([IO.File]::ReadAllBytes($audioFile))

    # Monta o corpo da requisicao
    $body = @{
        action = "addNote"
        version = 6
        params = @{
            note = @{
                deckName = $deckName
                modelName = $modelName
                fields = @{
                    Front = $Portuguese
                    Back = "<b>Frase em ingles:</b><br>$English<br><br><audio controls src='data:audio/mpeg;base64,$audioBase64'></audio><br><br><b>Explicacao:</b><br>$Explanation<br><br><b>Vocabulario util:</b><br>$Vocab<br><br><b>Dica de speaking:</b><br>$Speaking"
                }
            }
        }
    }

    # Envia ao AnkiConnect
    Invoke-RestMethod -Uri "http://localhost:8765" -Method Post -ContentType "application/json" -Body (ConvertTo-Json $body -Depth 6)

    Write-Host "Card adicionado com sucesso!"
}
