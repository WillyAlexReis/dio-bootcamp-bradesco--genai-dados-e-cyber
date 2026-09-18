# Pipeline ETL: Processamento de Vendas SAP (Nintendo) com Power Query

Pipeline de Extração, Transformação e Carregamento (ETL) desenvolvido em Excel/Power Query (Linguagem M) para tratamento e padronização de registros de envio de pacotes de jogos.

## 📌 Etapas do Fluxo de Dados (Linguagem M)

1. **Extração (Extract):**
   * Leitura e conexão da planilha de origem (`nintendo-sending-packages.xlsx`).
   * Promoção da primeira linha a cabeçalho e remoção da chave técnica desnecessária (`Package Id`).

2. **Limpeza e Tratamento (Transform):**
   * **Filtro de Ruídos:** Eliminação de linhas nulas e delimitadores fantasmas (`---`, `----`).
   * **Divisão de Colunas:** Separação do título do jogo e respectivo console pelo delimitador `-`.
   * **Normalização Textual:** Substituição de siglas de regiões (`PT` para `Portuguese`, `EN` para `English`, `JP` para `Japonese`).
   * **Limpeza Monetária & Tipagem:** Remoção do símbolo `$` e tratamento de pontuação para conversão em moeda (`Currency`).
   * **Cálculo de Métrica:** Adição da coluna de faturamento total (`Stock Quantity` * `Unit Price`).
   * **Sanitização de Lotes:** Remoção da máscara textual `Batch-` mantendo apenas os identificadores numéricos.

3. **Carregamento (Load):**
   * Reordenação lógica das colunas e carregamento dos dados tipados diretamente na pasta de trabalho para análise.

---

## 🛠️ Arquivos do Projeto
* `nintendo-sending-packages.xlsx`: Planilha de dados brutos e pasta com consulta configurada.
* `sap_extract_pipeline.m`: Script completo em Linguagem M com o passo a passo da consulta executada.