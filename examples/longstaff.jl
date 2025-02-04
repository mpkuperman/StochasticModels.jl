using StochasticModels

#-------------------------------------------------------------------------------------------#
#                               IIP Longstaff Schwartz Model                                #
#-------------------------------------------------------------------------------------------#

u0    = [0.1, 0.1]
tspan = (0.0, 1.0)

p = (κ₁ = 0.1, 
     κ₂ = 0.1, 
     θ₁ = 0.1, 
     θ₂ = 0.1, 
     σ₁ = 0.1, 
     σ₂ = 0.1)

ls = LongstaffSchwartzModel(u0, p, tspan)

lssol = solve(ls, SRA1())

#-------------------------------------------------------------------------------------------#
#                               OOP Longstaff Schwartz Model                                #
#-------------------------------------------------------------------------------------------#

u01   = @SVector [0.1, 0.1]
tspan = (0.0, 1.0)

p = (κ₁ = 0.1, 
     κ₂ = 0.1, 
     θ₁ = 0.1, 
     θ₂ = 0.1, 
     σ₁ = 0.1, 
     σ₂ = 0.1)

ls1 = LongstaffSchwartzModel(u01, p, tspan)

lssol1 = solve(ls1, SRA())
