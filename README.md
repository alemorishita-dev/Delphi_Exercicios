# 📚 Lista de Exercícios - Lógica de Programação

Repositório dedicado à resolução de desafios de algoritmos e fundamentos de programação.

---

## 🚀 Desafios Propostos

<details>
<summary><b>💰 01. Cálculo de Salário Líquido</b></summary>
<br>

**Enunciado:** Desenvolva um algoritmo que calcule o salário líquido de um trabalhador.  
- **Entradas:** Horas por dia, preço da hora, dias trabalhados.  
- **Regra:** Desconto fixo de 15% sobre o salário bruto.

> **Fórmula:** $Salário_{Líquido} = (Horas \times Valor \times Dias) \times 0.85$

</details>

<details>
<summary><b>⚖️ 02. Validação de Condições Logicas</b></summary>
<br>

**Enunciado:** Receba 4 valores inteiros (A, B, C, D) e valide as seguintes condições:
1. `B > C` e `D > A`
2. `(C + D) > (A + B)`
3. `C > 0` e `D > 0`
4. `A % 2 == 0` (A deve ser par)

**Saída:** "Valores aceitos" ou "Valores não aceitos".
</details>

<details>
<summary><b>🚗 03. Custo de Veículo ao Consumidor</b></summary>
<br>

**Enunciado:** Calcular o valor final de um veículo considerando taxas e descontos sobre o custo de fábrica.
- **Distribuidor:** 12,5%
- **Impostos:** 33%
- **Desconto à vista:** 5% (sobre o valor final)

**O algoritmo deve exibir:**
- [x] Valor do distribuidor
- [x] Valor dos impostos
- [x] Preço total (sem desconto)
- [x] Valor do desconto
- [x] Preço final (com desconto)
</details>

<details>
<summary><b>💵 04. Decomposição de Cédulas</b></summary>
<br>

**Enunciado:** Dado um valor inteiro, calcular a menor quantidade de notas possíveis.
- **Notas:** 100, 50, 20, 10, 5, 2 e 1.

**Exemplo de Saída:**
Entrada: 576
- 5 nota(s) de R$ 100,00
- 1 nota(s) de R$ 50,00
- 1 nota(s) de R$ 20,00...
</details>
<details>
<summary><b>🚗 05. Conversor de Placas (Brasil ↔ Mercosul)</b></summary>
<br>

**Enunciado:** Criar um sistema que identifique o padrão de uma placa de veículo (AAA9999 ou AAA9A99) e realize a conversão entre os padrões Brasil e Mercosul.

**Regras de Conversão:**
A conversão ocorre especificamente no **5º caractere** da placa (o segundo algarismo do modelo antigo), seguindo a tabela:

| Padrão Brasil (Nº) | Padrão Mercosul (Letra) |
|:---:|:---:|
| 0 | A |
| 1 | B |
| 2 | C |
| 3 | D |
| 4 | E |
| 5 | F |
| 6 | G |
| 7 | H |
| 8 | I |
| 9 | J |

**Requisitos de Validação:**
- Apenas letras maiúsculas (A-Z).
- Apenas números positivos.
- Formatos aceitos: `AAA9999` ou `AAA9A99`.
- Caso contrário: imprimir "formato inválido".

**Exemplo de Funcionamento:**
- **Entrada:** `ABC1234` → **Saída:** Padrão Brasil | Correspondente: `ABC1C34`
- **Entrada:** `ABC1C34` → **Saída:** Padrão Mercosul | Correspondente: `ABC1234`
</details>

<details>
<summary><b>🔢 06. Analisador de Sequência Numérica</b></summary>
<br>

**Enunciado:** Construir um algoritmo que receba um número inteiro positivo `N` e gere uma sequência de 1 até `N`, avaliando cada número da sequência.

**Critérios de Avaliação:**
* **Número Perfeito:** A soma dos seus divisores próprios (excluindo ele mesmo) é igual ao próprio número. (Ex: 6 = 1 + 2 + 3).
* **Número Primo:** Divisível apenas por 1 e por ele mesmo.
* **Par ou Ímpar:** Classificação básica de divisibilidade por 2.

**Regras de Saída:**
O algoritmo deve imprimir as mensagens correspondentes para cada número:
- `numero perfeito`
- `numero par`
- `numero impar`
- `numero primo`

> **Nota:** Um único número pode receber múltiplas classificações (ex: o número 6 é Par e Perfeito).
</details>

<details>
<summary><b>🖼️ 07. Gerador de Títulos Formatados</b></summary>
<br>

**Enunciado:** Desenvolver um programa que receba duas strings (parte superior e inferior de um título) e as exiba centralizadas dentro de uma moldura estilizada, adaptando o tamanho da borda dinamicamente.

**Exemplo de Entrada:**
- Parte 1: `Alexandre`
- Parte 2: `TECNOLOGIA DA INFORMAÇÃO`

**Exemplo de Saída:**
```
|||||||||||||||||||||||||||||||||||||||
||                                   ||
||             Alexandre             ||
||      TECNOLOGIA DA INFORMAÇÃO     ||
||                                   ||
|||||||||||||||||||||||||||||||||||||||
```
</details>
<details>
<summary><b>🐚 08. Matriz Quadrada em Caracol</b></summary>
<br>

**Enunciado:** Elabore um algoritmo que construa uma matriz quadrada de tamanho `N` preenchida em formato de caracol (espiral). 

**Funcionamento:**
A matriz deve começar a ser preenchida a partir da posição `[0,0]` e seguir o fluxo das setas, aumentando os valores conforme percorre as bordas externas em direção ao centro.

**Exemplo para N = 5:**
```text
  2   4   6   8  10
 32  34  36  38  12
 30  48  50  40  14
 28  46  44  42  16
 26  24  22  20  18
 ```
</details>
