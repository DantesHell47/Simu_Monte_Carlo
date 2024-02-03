using Plots

distance_to_center(x,y) = (x^2 + y^2)^(1/2)

function estimativa_pi(n)
    point_inside_x = Float64[]
    point_inside_y = Float64[]
    point_outside_x = Float64[]
    point_outside_y = Float64[]

    for _ in 1:n
        x, y = rand(-1:1e-16:1), rand(-1:1e-16:1)
        valor_distancia = distance_to_center(x,y)

        if valor_distancia ≤ 1
            pontos_dentro += 1
            push!(point_inside_x, x)
            push!(point_inside_y, y)
        else
            push!(point_outside_x, x)
            push!(point_outside_y, y)
        end
    end
    return collect(zip(point_inside_x, point_inside_y)), collect(zip(point_outside_x, point_outside_y))
end

pontos_dentro, pontos_fora=estimativa_pi(10_000)
scatter(first.(pontos_dentro), last.(pontos_dentro), c=:red)
scatter!(first.(pontos_fora), last.(pontos_fora),c=:green, legend=:none, title="Estimativa de π")
savefig("estimativa_pi_circunferencia_completa.svg")