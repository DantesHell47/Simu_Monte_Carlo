using Plots

# Simula os ganhos de um jogador com uma moeda viciada.
function flip_coin(prob_heads::Float64)
	return rand() < prob_heads ? "HEADS" : "TAILS"
end

function flip_coin_simulation(nmax::Int, prob_heads::Float64, saldo_inicial::Int=1000, valor_aposta::Int= 5)
	lista_de_ganhos::Vector{Int} = [saldo_inicial]
	for nsim in 1:nmax
		n = 0
		for _ in 1:nsim
			result = flip_coin(prob_heads)
			if result == "HEADS"
				n+=1
                saldo_inicial += 10
            else
                saldo_inicial -= 10
			end
			push!(lista_de_ganhos, saldo_inicial)
        end

		if saldo_inicial < valor_aposta
			break
		end
	end
	return lista_de_ganhos
end

function plot_flip_coin()
	y = flip_coin_simulation(100, .49)
	x = collect(1:length(y))
	graph = plot(x, y, legend=false, xlabel="Números de Simulações", ylabel="Ganhos do Jogador")
	return graph
end

plot_flip_coin()
savefig("graf_moeda_viciada.svg")