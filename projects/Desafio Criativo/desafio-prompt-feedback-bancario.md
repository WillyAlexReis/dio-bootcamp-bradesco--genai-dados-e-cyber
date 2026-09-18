# Desafio Criativo: Extraindo Insights do Feedback de Clientes Bancários

Documentação e consolidação de Engenharia de Prompts para análise de dados qualitativos e feedbacks de clientes em operações bancárias digitais.

---

## 🧱 Passo 1: Definição da Intenção
* **Objetivo:** Analisar comentários e avaliações de clientes de canais bancários digitais para identificar as principais dores operacionais, falhas em fluxos de transação (Pix/Cartão) e oportunidades de melhoria na experiência do usuário.
* **Público-alvo:** Equipes de Produto, Engenharia de Software e Experiência do Cliente (CX).
* **Finalidade da Decisão:** Priorizar o backlog de correções de bugs, mitigar chamados de suporte repetitivos e aprimorar a usabilidade do aplicativo.
* **Formato Esperado:** Resumo executivo, matriz de classificação tabular (tema, sentimento, criticidade e evidência) e lista priorizada de planos de ação.
* **Critério de Qualidade:** Objetividade, ausência de conclusões especulativas sem dados e forte foco em ações práticas de engenharia e produto.

---

## 🧱 Passo 2: Contexto e Restrições
* **Contexto Operacional:** Base de dados com interações de clientes relacionadas ao App Mobile, transferências Pix, Cartões Virtuais/Físicos e suporte via Chatbot.
* **Campos/Metadados Disponíveis:** `id_registro`, `data_hora`, `canal_atendimento`, `produto_mencionado`, `nota_satisfacao (1 a 5)` e `texto_comentario`.
* **Critérios de Classificação:**
  * Categoria/Tema (ex: Falha de Conexão, UX/Usabilidade, Cobrança Indevida, Atendimento Humano).
  * Sentimento (Positivo, Neutro, Negativo).
  * Nível de Severidade/Urgência (Baixa, Média, Crítica).
* **Restrições Mandatórias (Segurança & LGPD):**
  * Não inventar dados, frequências estatísticas ou causas não citadas nos feedbacks.
  * Anonimizar estritamente qualquer dado pessoal identificado (PII/LGPD), como CPF, nomes, chaves Pix ou números de conta/cartão.
  * Reportar explicitamente quando o comentário for vago ou a amostra insuficiente para determinar a causa raiz.

---

## 🧱 Passo 3: Prompt Final Consolidado (Entrega)

```text
Atue como um Especialista em Engenharia de Dados e Experiência do Cliente (CX) no setor bancário.

Sua tarefa é processar e analisar uma base de feedbacks textuais de clientes sobre os serviços digitais (Aplicativo Mobile, Pix, Cartão de Crédito/Débito e Atendimento por Chat), visando identificar gargalos operacionais, tendências de sentimento e melhorias estruturais.

Contexto da Operação:
Esta análise apoiará os times de Produto e Engenharia na priorização do roadmap técnico e na redução de fricções no canal digital. Você deve transformar comentários desestruturados em inteligência acionável.

Metadados Fornecidos por Registro:
- data_hora
- canal_atendimento
- produto_mencionado
- nota_satisfacao (1 a 5)
- texto_comentario

Instruções de Análise:
1. Agrupamento Temático: Agrupe os registros por problema-chave ou elogio.
2. Análise de Sentimento & Severidade: Classifique cada grupo como Positivo, Neutro ou Negativo, atribuindo criticidade (Baixa, Média, Crítica).
3. Evidências Empíricas: Cite trechos curtos dos comentários para sustentar cada apontamento (sempre anonimizados).
4. Recomendações Acionáveis: Proponha soluções práticas divididas entre correção imediata (Quick Wins) e evolução estrutural.

Estrutura da Resposta:
1. Resumo Executivo: Visão geral de até 5 linhas com o panorama da saúde dos serviços.
2. Tabela de Categorização:
   | Produto / Canal | Tema Recorrente | Sentimento | Severidade | Trecho de Evidência (Anonimizado) | Ação Recomendada |
3. Top 3 Prioridades de Engenharia/Produto: As 3 ações mais urgentes baseadas no impacto ao cliente.

Restrições e Governança:
- Análise baseada estritamente nas mensagens enviadas (zero alucinação).
- Conformidade estrita com LGPD: Não repita nomes de pessoas, CPFs, e-mails, dados de agência/conta ou chaves Pix. Substitua por tags genéricas (ex: [DADO OCULTO]).
- Se houver dados insuficientes ou ruídos em algum registro, indique a limitação explicitamente.
- Utilize linguagem técnica, direta e voltada para tomada de decisão corporativa.