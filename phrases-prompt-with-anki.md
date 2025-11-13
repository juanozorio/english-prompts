## 🧠 Prompt de Prática – Inglês B1 (Cambridge First) – versão completa com áudio Polly 🇬🇧

Estou praticando a construção de frases simples e compostas em inglês.
Quero treinar todos os tópicos exigidos no nível **B1 (Cambridge English)**, com foco em estrutura, vocabulário, collocations e naturalidade.

---

### 🎯 Tópicos para praticar

#### 🔤 Grammar & Structure

* Personal Pronouns
* Indefinite Article
* Definite Article "The"
* Some, Any, No, None
* Countable and Uncountable Nouns
* Conjunctions and Linkers
* Enough / Enough vs Too / So vs Such
* Demonstratives
* Comparatives and Superlatives
* Making Questions / Question Tags / Short Answers / Subject & Object Questions / Indirect Questions
* Zero Conditional / First Conditional / Second Conditional / Conditionals (Usage)
* There is vs There are
* Present Simple / Present Continuous / Past Simple / Past Continuous / Past Perfect / Present Perfect / Present Perfect vs Past Simple
* Irregular Verbs

#### 🧩 Word Formation

* Negative Prefixes
* Prefixes (UN, DIS, IM, IN, MIS, IR) + Meanings
* Suffixes (OR, ER, IST)
* Suffixes (MENT, ITY, NESS, ION, ING)
* Suffixes (Y, ED, FUL, (I)OUS)
* Suffixes (ABLE, LESS, IVE, AL)

#### 💬 Vocabulary & Usage

* Collocations (Verb, Noun, Adjective + Preposition)
* Verb Collocations
* Verb and Preposition / Noun and Preposition / Adjective and Preposition
* Prepositional Phrases
* Prepositions of Place / Prepositions of Time
* Compound Nouns
* Phrasal Verbs
* Either / Too / Neither (Nor) / So
* Participle Adjectives
* Positive and Negative Adjectives
* Forming Adverbs / Types of Adverbs
* Cardinal and Ordinal Numbers / Saying Numbers

#### 🗣️ Topics & Everyday Contexts

* Feelings and Opinions
* Common Phrases
* Talking About Yourself
* Family / Family Tree
* People / Men and Women
* Education / Personal Details
* Healthy Lifestyle
* Food / Things to Buy / Shopping / Containers
* Sport / Hobbies / Entertainment
* Technology / Computers
* Tools and DIY / Work + Preposition / In the Office
* The Environment / Landscape Features / In the Mountains / At the Seaside / Camping / Transport / Road Signs
* Places to Live / Parts of the House / In the Kitchen / In the Bathroom / Household Chores / In the Town
* Animals / Animal Body Parts / Animals and their Babies / Types of Insects
* Colours
* Word Groups / Bits and Pieces
* Synonyms (Adjectives / Verbs)
* Go - Go to - Go on - Go for

---

### 📋 Instruções

1. Envie uma **frase em português**, relacionada a situações do dia a dia, temas atuais ou tópicos listados acima.
   (Nada de frases artificiais — mantenha naturalidade e contexto realista.)

2. Eu responderei **em inglês**, aplicando os tópicos linguísticos relevantes.

3. Você fará a **correção completa** da minha resposta, seguindo o modelo abaixo.

4. Após a correção, **gere automaticamente um comando `curl` estável e funcional**, que cria um **card no Anki** com o conteúdo e o **áudio em inglês (voz Arthur – Amazon Polly)**.

---

### 🧩 Modelo de correção

✅ **Correção:**
[Mostre a frase corrigida em inglês, com gramática e vocabulário adequados.]

💬 **Explicação:**
[Explique brevemente o motivo da correção — por exemplo, erro de tempo verbal, preposição incorreta, uso de collocation, etc.]

✨ **Versão aprimorada (mais natural):**
[Mostre como a frase poderia ser dita de forma mais fluida ou natural por um falante B1/B2, se necessário.]

📚 **Vocabulário útil:**
[Listar 2–3 palavras, expressões ou phrasal verbs usados na frase e seus significados.]

---

### 💻 Geração automática do card Anki (com áudio Amazon Polly 🇬🇧)

Após cada correção, gere o seguinte comando **estável**, com escaping seguro e áudio embutido:

```bash
curl -X POST http://localhost:8765 \
  -H "Content-Type: application/json" \
  -d "$(aws polly synthesize-speech \
    --engine neural \
    --language-code en-GB \
    --voice-id Arthur \
    --output-format mp3 \
    --text '<frase corrigida em inglês>' \
    output.mp3 >/dev/null && \
    echo "{\"action\":\"addNote\",\"version\":6,\"params\":{\"note\":{\"deckName\":\"Ingles B1 - Speaking Practice\",\"modelName\":\"Basic\",\"fields\":{\"Front\":\"<frase original em português>\",\"Back\":\"<b>Frase em ingles:</b><br><frase corrigida em inglês><br><br><audio controls src='data:audio/mpeg;base64,$(base64 -w 0 output.mp3)'></audio><br><br><b>Explicacao:</b><br><explicacao><br><br><b>Vocabulario util:</b><br><lista de vocabulario><br><br><b>Dica de speaking:</b><br><dica curta e prática sobre entonação ou naturalidade na fala>\"}}}}")"
```

---

### ✅ Regras finais

* O comando `curl` deve gerar JSON **válido e funcional**.
* Todos os textos devem ser escapados corretamente (`\"`, sem emojis, sem tags extras).
* O campo `Front` contém **a frase em português**.
* O campo `Back` contém **a versão corrigida em inglês + explicação + vocabulário + dica de speaking + áudio Polly**.
* A voz **Arthur (British English)** é usada em todos os áudios.
* A dica de speaking deve ser **natural, curta e prática**, focando pronúncia, entonação ou naturalidade.
