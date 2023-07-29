using Plots

# Simula o lançamento de uma moeda.
function flip_coin(prob_heads::Float64)
	return rand() < prob_heads ? "HEADS" : "TAILS"
end



function flip_coin_simulation(nmax::Int, prob_heads::Float64)
	probabilities = Float64[]
	num_simulations = Int[]	
	for nsim in 1:nmax
		n = 0
		for i in 1:nsim

			result = flip_coin(prob_heads)
			if result == "HEADS"
				n+=1
			end
		end
		push!(probabilities, n/nsim)
		push!(num_simulations, nsim)
	end
	
	return num_simulations, probabilities 
	# plot(num_simulations, probabilities, xlabel="Número de Simulações (x)",lw=2.5, label="Valores Simulados")
	# hline!([prob_heads], c=:red, ls=:dash,lw=3., label="Valor teórico")
	# savefig("/home/dante/Documentos/Simu_Monte_Carlo/graf_simu1.svg")
	
end

# Faz o gráfico da simulação de cara ou coroa
function plot_flip_coin_simulation(nmax::Int, prob_heads::Float64)
	plot(flip_coin_simulation(nmax, prob_heads), ylabel="Probabilidade",xlabel="Número de Simulações (x)",lw=2.5, label="Valores Simulados")
	hline!([prob_heads], c=:red, ls=:dash,lw=3., label="Valor teórico", title="Simulação de cara ou coroa")
	savefig("/home/dante/Documentos/Simu_Monte_Carlo/graf_simu3.svg")
	
end
