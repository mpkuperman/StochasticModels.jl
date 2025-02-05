using StochasticModels

#-------------------------------------------------------------------------------------------#
#                                  IIP Bates Model                                          #
#-------------------------------------------------------------------------------------------#

x0    = [2., 20.]
tspan = (0.0, 1.0)

μ = 1.2
κ = 1.0
θ = 1.0

params = (
          μ = μ,
          κ = κ, 
          θ = θ,
          Γ = [1.0 0.1; 0.1 1.0] 
         )

bat = BatesModel(x0, params, tspan)
solve(bat, SRA1())

#-------------------------------------------------------------------------------------------#
#                                  OOP Bates Model                                          #
#-------------------------------------------------------------------------------------------#

# TODO: Not working due to issue with SVector in noise function.
x0    = @SVector [2., 20.]
tspan = (0.0, 1.0)

μ = 1.2
κ = 1.0
θ = 1.0

params = (
          μ = μ,
          κ = κ, 
          θ = θ,
          Γ = @SMatrix [1.0 0.1; 0.1 1.0] 
         )

bat = BatesModel(x0, params, tspan)
solve(bat, SRA1())
