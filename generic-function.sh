#!/usr/bin/env zsh

add_anki_b1_card() {
  local ENGLISH="$1"
  local PORTUGUESE="$2"
  local EXPLANATION="$3"
  local VOCAB="$4"
  local SPEAKING="$5"

  if [[ -z "$ENGLISH" || -z "$PORTUGUESE" || -z "$EXPLANATION" || -z "$VOCAB" || -z "$SPEAKING" ]]; then
    echo "❌ Uso correto:"
    echo 'add_anki_b1_card "English" "Portuguese" "Explanation" "Vocab" "Speaking"'
    return 1
  fi

  local DECK_NAME="Ingles B1 - Speaking Practice"
  local MODEL_NAME="Basic"
  local AUDIO_FILE="output.mp3"

  echo "🎙️ Gerando áudio com AWS Polly..."

  aws polly synthesize-speech \
    --engine neural \
    --language-code en-GB \
    --voice-id Brian \
    --output-format mp3 \
    --text "$ENGLISH" \
    "$AUDIO_FILE" >/dev/null

  if [[ ! -f "$AUDIO_FILE" ]]; then
    echo "❌ Erro ao gerar o áudio"
    return 1
  fi

  local AUDIO_BASE64
  AUDIO_BASE64=$(base64 < "$AUDIO_FILE" | tr -d '\n')

  local BACK_FIELD
  BACK_FIELD=$(cat <<EOF
<b>Frase em ingles:</b><br>$ENGLISH<br><br>
<audio controls src="data:audio/mpeg;base64,$AUDIO_BASE64"></audio><br><br>
<b>Explicacao:</b><br>$EXPLANATION<br><br>
<b>Vocabulario util:</b><br>$VOCAB<br><br>
<b>Dica de speaking:</b><br>$SPEAKING
EOF
)

  echo "📤 Enviando card para o Anki..."

  local JSON_BODY
  JSON_BODY=$(jq -n \
    --arg deck "$DECK_NAME" \
    --arg model "$MODEL_NAME" \
    --arg front "$PORTUGUESE" \
    --arg back "$BACK_FIELD" \
    '{
      action: "addNote",
      version: 6,
      params: {
        note: {
          deckName: $deck,
          modelName: $model,
          fields: {
            Front: $front,
            Back: $back
          }
        }
      }
    }')

  curl -s -X POST http://localhost:8765 \
    -H "Content-Type: application/json" \
    -d "$JSON_BODY" >/dev/null

  echo "✅ Card adicionado com sucesso!"
}
