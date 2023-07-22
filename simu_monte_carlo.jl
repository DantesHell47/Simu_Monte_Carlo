using Plots

function lancar_moeda(prob_cara::Float64)
	return rand() < prob_cara ? "CARA" : "COROA"
	
end

function simulation_cara_coroa(nmax::Int)
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
end


