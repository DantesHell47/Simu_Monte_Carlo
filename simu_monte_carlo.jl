using Plots; gr()

vp = []
vsim = []

nmax = 1000

moeda = ["cara", "coroa"]

for nsim in 1:nmax
	n = 0
	for i in 1:nsim
		position = rand(moeda)
		if position == "cara"
			n+=1
		end
	end
	push!(vp, n/nsim)
	push!(vsim, nsim)
end

plot(vsim, vp)
