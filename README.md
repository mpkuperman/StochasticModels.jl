# StochasticModels.jl

**StochasticModels** is a Julia library which provides high-performance stochastic models. It is powered by DifferentialEquations.jl.

The following models are supported:

  - `Affine Model`
  - `Arithmetic Brownian Motion Model`
  - `Bates Model`
  - `Constant Elasticity Variance Model`
  - `Chen Model`
  - `Cox-Ingersoll-Ross Model`
  - `Clewlow-Strickland Model`
  - `Fong-Vasicek Model`
  - `Garch Model`
  - `Geometric Brownian Motion Model`
  - `Gibson-Schwartz Model`
  - `Heston Model`
  - `Hull-White Model`
  - `Longstaff-Schwartz Model`
  - `Piterbarg Model`
  - `SABR Model`
  - `Vasicek Model`
  - `3/2 Model`

**Examples:**

- General affine model and evolution of trajectories:

```julia
using StochasticModels

x0 = 1.3
tspan = (0.0, 1.0)

κ(t) = 0.3
θ(t) = 1.
σ(t) = 0.2
α(t) = 1.
β(t) = 0.0

params = (κ = κ, 
          θ = θ, 
          σ = σ, 
          α = α, 
          β = β)

affine   = AffineModel(x0, params, tspan)
solution = solve(EnsembleProblem(affine); alg=SRA1(), trajectories=1000)

```



![download](https://github.com/user-attachments/assets/e879115f-4295-4f83-b37f-f858906b0671)

- Price and distribution of Call on Call option under Geometric and Arithmetic Brownian Motion models:

```julia
using StochasticModels, Statistics, Plots

u0    = 2.0
p     = (μ=0.03, σ=0.2)
tspan = (0.0, 1.0)

op = (K0 = 0.9,
      K1 = 0.8,
      T  = 1.0)

paths = 1E4

function call_on_call(S, p)
    T  = p.T
    K1 = p.K1
    K0 = p.K0

    return max(max(S(T) - K1) - K0, 0.0)
end

gbm = GeometricBrownianMotionModel(u0, p; tspan)
abm = ArithmeticBrownianMotionModel(u0, p; tspan)

ensgbm = EnsembleProblem(gbm, output_func = (sol, i) -> (call_on_call(sol, op), false))
ensabm = EnsembleProblem(abm, output_func = (sol, i) -> (call_on_call(sol, op), false))

solgbm = solve(ensgbm; alg=SRA1(), trajectories=paths)
solabm = solve(ensabm; alg=SRA1(), trajectories=paths)

arrgbm = Array(solgbm)
arrabm = Array(solabm)

pricegbm = mean(solgbm)
priceabm = mean(solabm)

histogram(arrgbm, xlabel="Value", ylabel="Number of occurences", label="GBM")
histogram!(arrabm, label="ABM")
```

![image](https://github.com/user-attachments/assets/19c3f3e4-8bff-450a-8708-863da7b207c4)

**How to install:** ```] add  https://github.com/mpkuperman/StochasticModels.jl```

