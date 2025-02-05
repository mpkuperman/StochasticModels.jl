using StochasticModels

#-------------------------------------------------------------------------------------------#
#                                   1-D Sabr Model                                          #
#-------------------------------------------------------------------------------------------#

u0    = [0.1, 0.2]
tspan = (0.0, 1.0)

α = 1.0
β = 0.3
Γ = [1.0 0.2; 0.2 1]
p = (α = α, β = β, Γ = Γ)

sabr = SABRModel(u0, p, tspan)

solve(sabr, SRA1())