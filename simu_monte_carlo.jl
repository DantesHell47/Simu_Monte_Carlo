using Plots

function lancar_moeda(prob_car::Floa64)
	return rand() < prob_car ? "CARA" : "COROA"
end



function simulation_cara_coroa(nmax::Int, prob_car::Float64)
	probabilities = Float64[]
	num_simulations = Int[]	
	for nsim in 1:nmax
		n = 0
		for i in 1:nsim

			resultado = lancar_moeda(prob_car)
			if resultado == "CARA"
				n+=1
			end
		end
		push!(probabilities, n/nsim)
		push!(num_simulations, nsim)
	end
	
	plot(num_simulations, probabilities, xlabel="Número de Simulações (x)",lw=2.5, label="Valores Simulados")
	hline!([prob_car], c=:red, ls=:dash,lw=3., label="Valor teórico")
	savefig("/home/dante/Documentos/Simu_Monte_Carlo/graf_simu1.svg")
	
end

simulation_cara_coroa(1000, 0.6)