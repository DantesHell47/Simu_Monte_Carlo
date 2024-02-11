using Plots
"""
    norma_euclidiana(vetor)

Calula a norma norma euclidiana de um vetor

# Argumentos
- `vetor::Vector`: O vetor para o qual a norma euclidiana será calculada

# Retorno
A norma ou magnitude do vetor
"""
norma_euclidiana(vetor) = sqrt(sum(x->x^2, vetor))

"""
    estimativa_pi(n)
Estima o valor de π usando o método de Monte Carlo

# Argumentos

-`n::Int`: O número de pontos aleatório a serem gerados para a Estimativa

# Retorno
Retorna uma tupla contendo os pontos que caem dentro e fora do círculo de raio 1 centrado na origem

"""

function estimativa_pi(n)
    pontos_xy = [(rand(-1:1e-2:1), rand(-1:1e-2:1)) for _ in 1:n]
    points_inside = filter(x->(norma_euclidiana(x) ≤ 1), pontos_xy)
    points_outside = filter(x->(norma_euclidiana(x) > 1), pontos_xy)
    ratio = length(points_inside) / n
    pi_estimate = 4 * ratio
    return pi_estimate, points_inside, points_outside
end

function gerar_grafico(n)
    pontos_dentro, pontos_fora=estimativa_pi(n)
    scatter(pontos_dentro , c=:red)
    scatter!(pontos_fora ,c=:green, legend=:none, title="Estimativa de π (n= $n)")
    # savefig("estimativa_pi_circunferencia_completa.svg")
end    


function criar_animacao(n,n_inicial, n_final, passo)
    anim = @animate for i in n_inicial:passo:n_final
        gerar_grafico(n)
    end
    gif(anim, "grafico.gif")
end


criar_animacao(10, 1000, 10)