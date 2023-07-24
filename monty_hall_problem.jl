using Random

function monty_hall(N::Int)
    num_vitorias = 0

    for i in 1:N
        portas = [1, 2, 3]
        ficou = [1, 2, 3]

        pp = rand(portas)
        escolhi = rand(portas)

        ficou = filter(p -> p ≠ pp && p ≠ escolhi, ficou)

        println("Porta onde está o prêmio: ", pp, ", Minha escolha: ", escolhi, ", Porta aberta pelo apresentador: ", ficou)

        # Se eu não mudar de porta (ficar com a mesma escolha), ganho se a porta do prêmio for igual à minha escolha.
        # Se eu mudar de porta (escolher a outra porta disponível), ganho se a porta do prêmio for diferente da minha escolha.
        if pp == escolhi
            println(":: Ganhei, nunca mudei de porta!")
            num_vitorias += 1
        else
            println(":: Perdi!")
        end
    end

    println("Número de vitórias: ", num_vitorias, " em ", N, " jogos.")
end

monty_hall(10)
