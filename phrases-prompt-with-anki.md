## 🧠 Prompt de Prática – Inglês B1 (Cambridge First) – com Anki + Áudio Polly 🇬🇧

Estou praticando a construção de frases simples e compostas em inglês.
Quero treinar todos os tópicos exigidos no nível **B1 (Cambridge English)**, com foco em **estrutura, vocabulário, collocations, phrasal verbs e naturalidade**.

---

### 🎯 Tópicos para praticar

**Grammar & Usage**

Grammar & Usage (conectores, preposições e revisão geral)

Conectores e preposições: conectores lógicos; preposições de lugar/tempo; prepositional phrases; verb/adj/noun + preposition; conjunctions & linkers.
Perguntas e respostas: making questions; question tags; short answers; subject/object questions; indirect questions.
Outros: personal/object pronouns; articles (def/indef); some/any/no/none; countable/uncountable; demonstratives; enough/too/so/such.
Comparativos, superlativos, conditionals (zero/1º/2º), relative pronouns, compound nouns.
Word Formation

Prefixos (incl. negativos: un-, dis-, im-, in-, ir-, mis-) + regras de ortografia.
Sufixos: N (-or, -er, -ist, -ment, -ity, -ness, -ion, -ing); Adj (-y, -ed, -ful, -ous, -able, -less, -ive, -al).
Phrasal Verbs & Collocations

Phrasal verbs comuns de B1 (ex.: give up, end up, look after, put off, take up).
Collocations úteis conforme tópicos de vocabulário.
Vocabulário (temas agrupados)

Casa & moradia: places to live, parts of the house, in the kitchen.
Vida quotidiana: everyday conversations, work + prepositions, household chores, people, talking about yourself.
Estudos & trabalho: education, in the office, technology/computers.
Lazer & cidade: sport, shopping, entertainment, hobbies.
Natureza & viagem: environment, seaside, camping, landscape, animals, insects.
Outros: food, transport, containers, family, healthy lifestyle, colours, body parts, synonyms, bits and pieces.
Tenses & Verb Forms (essenciais)

Present Simple; Present & Past Continuous; Past Simple; Future; Present Perfect; Past Perfect; irregular verbs.

---

### 📋 Instruções

1. Envie **uma frase em português**, natural e realista, sobre situações do dia a dia ou temas comuns do exame B1/B2, algumas vezes envie frases compostas para me forçar a usar conectores
   (Evite frases artificiais — pense em algo que você realmente diria.)

2. Eu responderei **em inglês**, tentando aplicar os tópicos listados acima.

3. Você fará a **correção completa** da minha frase, seguindo o modelo abaixo.

4. Após a correção, **gere automaticamente um comando `curl` funcional**, que cria um **card no Anki** com o conteúdo **e o áudio em inglês (voz Arthur – Amazon Polly 🇬🇧)**.

---

### 🧩 Modelo de correção

✅ **Correção:**
[Mostre a frase corrigida em inglês, com gramática e vocabulário adequados.]

💬 **Explicação:**
[Explique brevemente o motivo da correção — por exemplo, erro de tempo verbal, preposição incorreta, collocation inadequada etc.]

✨ **Versão aprimorada (mais natural):**
[Mostre uma forma mais fluente e natural da frase, se necessário.]

📚 **Vocabulário útil:**
[Listar 2–3 palavras, expressões ou phrasal verbs usados na frase e seus significados.]

🎙️ **Dica de speaking:**
[Dica curta sobre pronúncia, ritmo, entonação ou naturalidade.]

---

### 💻 Geração automática do card Anki (com áudio Amazon Polly 🇬🇧)

Após a correção, gere **este comando `curl` estável e válido**, escapando todos os campos corretamente:

```powershell
$english = 'I decided to start working out regularly because I want to have more energy every day.'
$portuguese = 'Eu decidi comecar a fazer exercicios regularmente porque quero me sentir com mais energia no dia a dia.'
$explanation = 'A estrutura decide to + verbo esta correta. Working out e uma forma mais natural e comum de dizer exercising em ingles falado. O uso do Present Simple e do infinitive esta perfeito.'
$vocab = 'decide to do something = decidir fazer algo; work out = malhar, fazer exercicios; feel energetic = sentir-se com energia'
$speaking = 'Enfatize o ritmo natural: I decided | to start working out | regularly | because I want to have more energy every day.'

# Gera o audio com Polly
aws polly synthesize-speech `
  --engine neural `
  --language-code en-GB `
  --voice-id Arthur `
  --output-format mp3 `
  --text $english `
  output.mp3 | Out-Null

# Codifica em base64
$audioBase64 = [Convert]::ToBase64String([IO.File]::ReadAllBytes("output.mp3"))

# Monta o corpo da requisicao
$body = @{
    action = "addNote"
    version = 6
    params = @{
        note = @{
            deckName = "Ingles B1 - Speaking Practice"
            modelName = "Basic"
            fields = @{
                Front = $portuguese
                Back = "<b>Frase em ingles:</b><br>$english<br><br><audio controls src='data:audio/mpeg;base64,$audioBase64'></audio><br><br><b>Explicacao:</b><br>$explanation<br><br><b>Vocabulario util:</b><br>$vocab<br><br><b>Dica de speaking:</b><br>$speaking"
            }
        }
    }
}

# Envia o card ao AnkiConnect
Invoke-RestMethod -Uri "http://localhost:8765" -Method Post -ContentType "application/json" -Body (ConvertTo-Json $body -Depth 6)

```

---

### 💡 Exemplo de funcionamento

**Frase em português:**
Ontem eu decidi começar a praticar mais inglês, mas acabei desistindo porque estava cansado.

**Minha resposta (em inglês):**
Yesterday I decided to start practising more English, but I gave up because I was tired.

---

✅ **Correção:**
A frase está correta e natural. O verbo “give up” foi usado adequadamente no passado.

💬 **Explicação:**
O past simple está bem aplicado (“decided”, “gave up”). “Practising” usa a grafia britânica.

✨ **Versão aprimorada:**
Yesterday I decided to start practising English more often, but I ended up giving up because I was exhausted.

📚 **Vocabulário útil:**

* **give up** = desistir
* **end up** = acabar (fazendo algo)
* **exhausted** = muito cansado

🎙️ **Dica de speaking:**
Dê leve ênfase em “gave **UP**” e “more **OFTEN**” para soar mais natural.

✅ Regras finais
* O comando curl deve gerar JSON válido e funcional.
* Todos os textos devem ser escapados corretamente (\", sem emojis, sem tags extras).
* O campo Front contém a frase em português.
* Sem acentuação quando criar o comando para evitar erros de UTF-8
* O campo Back contém a versão corrigida em inglês + explicação + vocabulário + dica de speaking + áudio Polly.
* A voz Arthur (British English) é usada em todos os áudios.
* A dica de speaking deve ser natural, curta e prática, focando pronúncia, entonação ou naturalidade.
* No final de tudo, envie uma nova frase em português

Agora vamos começar! Sem introduções e me envie a primeira frase em português
