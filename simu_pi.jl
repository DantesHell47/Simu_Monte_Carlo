using Plots

function norma_euclediana(vetor)
    return sqrt(sum(x->x^2, vetor))
end

distance_to_center(x,y) = (x^2 + y^2)^(1/2)

function estimativa_pi(n)
    point_inside = Tuple{Float64,Float64}[]
    point_outside = Tuple{Float64,Float64}[]
    x = Float64[rand(-1:1e-16:1) for _ in 1:n]
    y = Float64[rand(-1:1e-16:1) for _ in 1:n]

    for i in 1:n
        valor_distancia = distance_to_center(x[i],y[i])

        if valor_distancia ≤ 1
            push!(point_inside, (x[i], y[i]))
        else
            push!(point_outside, (x[i], y[i]))
        end
    end
    return point_inside, point_outside
end

pontos_dentro, pontos_fora=estimativa_pi(10_000)
scatter(first.(pontos_dentro), last.(pontos_dentro), c=:red)
scatter!(first.(pontos_fora), last.(pontos_fora),c=:green, legend=:none, title="Estimativa de π")
savefig("estimativa_pi_circunferencia_completa.svg")