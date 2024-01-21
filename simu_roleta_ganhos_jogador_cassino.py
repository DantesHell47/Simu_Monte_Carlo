import random
import matplotlib.pyplot as plt

n_simulacoes = 20
valor_aposta = 5
ganhos_totais = 0
perdas = 0
quantidade_dinheiro = 100

for _ in range(n_simulacoes):
        numero_escolhido = random.randint(1,36)
        resultado_roleta = random.randint(0, 36)  # Números de 0 a 36 na roleta
        if resultado_roleta == numero_escolhido:
            quantidade_dinheiro += 35 * valor_aposta
            ganhos_totais+=1
        else:
            quantidade_dinheiro -= valor_aposta
            perdas+=1

        if quantidade_dinheiro < valor_aposta:
             break


print("Quantidade de dinheiro",quantidade_dinheiro)
print("Ganhos= ", ganhos_totais, " Perdas= ", perdas)