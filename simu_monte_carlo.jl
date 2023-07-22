using Plots

function lancar_moeda()
	return rand() < 0.5 ? "CARA" : "COROA"
end



function simulation_cara_coroa(nmax::Int)
	probabilities = Float64[]
	num_simulations = Int[]
	# moeda = ["cara", "coroa"]
	
	for nsim in 1:nmax
		n = 0
		for i in 1:nsim
			# position = rand(moeda)
			resultado = lancar_moeda()
			if resultado == "CARA"
				n+=1
			end
		end
		push!(probabilities, n/nsim)
		push!(num_simulations, nsim)
	end
	
	plot(num_simulations, probabilities, xlabel="Número de Simulações (x)",lw=2.5, label="Valores Simulados")
	hline!([0.5], c=:red, ls=:dash,lw=3., label="Valor teórico")
	savefig("graf_simu1.svg")
	
end



function plot_coin_toss_simulation(nmax::Int, output_file::AbstractString)
	probabilities, num_simulations = simulation_cara_coroa(nmax)
	plot(num_simulations, probabilities, xlabel="Número de Simulações (x)",lw=2.5, label="Valores Simulados")
	hline!([0.5], c=:red, ls=:dash,lw=3., label="Valor teórico")
	savefig(output_file)