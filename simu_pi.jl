


distancia(x,y) = (x^2 + y^2)^(1/2)

function estimativa_pi(n)
    pontos_dentro = 0
    for _ in 1:n
        x, y = rand(), rand()
        valor_distancia = distancia(x,y)

        if valor_distancia ≤ 1
            pontos_dentro += 1
        end
    end
    return 4 * pontos_dentro / n
end

