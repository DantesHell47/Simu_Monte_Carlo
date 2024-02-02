


distancia(x,y) = (x^2 + y^2)^(1/2)

function estimativa_pi(n)
    pontos_dentro = 0
    point_inside_x = Float64[]
    point_inside_y = Float64[]
    point_outside_x = Float64[]
    point_outside_y = Float64[]

    for _ in 1:n
        x, y = rand(), rand()
        valor_distancia = distancia(x,y)

        if valor_distancia ≤ 1
            pontos_dentro += 1
            push!(point_inside_x, x)
            push!(point_inside_y, y)

        else
            push!(point_outside_x, x)
            push!(point_outside_y, y)
        end
    end
    return 4 * pontos_dentro / n
end
