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
```text
Entrada: 576
- 5 nota(s) de R$ 100,00
- 1 nota(s) de R$ 50,00
- 1 nota(s) de R$ 20,00...
