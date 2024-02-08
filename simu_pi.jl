using Plots

norma_euclidiana(vetor) = sqrt(sum(x->x^2, vetor))

function estimativa_pi(n)
    pontos_xy = [(rand(-1:1e-2:1), rand(-1:1e-2:1)) for _ in 1:n]
    points_inside = filter(x->(norma_euclidiana(x) ≤ 1), pontos_xy)
    points_outside = filter(x->(norma_euclidiana(x) > 1), pontos_xy)
    return points_inside, points_outside
end

pontos_dentro, pontos_fora=estimativa_pi(10_000)
scatter(pontos_dentro , c=:red)
scatter!(pontos_fora ,c=:green, legend=:none, title="Estimativa de π")
savefig("estimativa_pi_circunferencia_completa.svg")