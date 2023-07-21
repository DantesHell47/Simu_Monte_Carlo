using Plots

function lancar_moeda()
	resultado = rand() < 0.5 ? "CARA" : "COROA"
	return resultado
end

function simulation_cara_coroa(nmax::Int)
	vp = Float64[]
	vsim = Int[]
	# moeda = ["cara", "coroa"]

	for nsim in 1:nmax
		n = 0
		for i in 1:nsim
			# position = rand(moeda)
			moeda = rand(Bool) ? "CARA" : "COROA"
			if moeda == "CARA"
				n+=1
			end
		end
		push!(vp, n/nsim)
		push!(vsim, nsim)
	end

	plot(vsim, vp, xlabel="Número de Simulações (x)",lw=2.5, label="Valores Simulados")
	hline!([0.5], c=:red, ls=:dash,lw=3., label="Valor teórico")
	savefig("graf_simu1.svg")

end

