using Plots, Interact

function lancar_moeda(prob_cara::Float64)
	return rand() < prob_cara ? "CARA" : "COROA"
	
end

function simulation_cara_coroa(nmax::Int, prob_cara)
	vp = Float64[]
	vsim = Int[]
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
		push!(vp, n/nsim)
		push!(vsim, nsim)
	end


	@manipulate for prob in 0:0.01:1
		probabilities = simulation_cara_coroa(nmax, prob)
		plot(vsim, vp, xlabel="Número de Simulações (x)", ylabel="Probabilidade de CARA", lw=2.5, label="Valores Simulados")
		hline!([prob], c=:red, ls=:dash, lw=3., label="Probabilidade teórica")
	end

end

simulation_cara_coroa(100, 0.5)

    

function plot_interactive_simulation(nmax::Int)
    @manipulate for prob in 0:0.01:1
        vp, vsim = simulation_cara_coroa(nmax, prob)
        p = plot(vsim, vp, xlabel="Número de Simulações (x)", ylabel="Probabilidade de CARA",
                 lw=2.5, label="Valores Simulados", legend=:topright)
        hline!([prob], p, c=:red, ls=:dash, lw=3., label="Probabilidade teórica")
        display(p)
    end
end

plot_interactive_simulation(1)