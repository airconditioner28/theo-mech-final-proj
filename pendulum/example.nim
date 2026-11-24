import ggplotnim, ggplotnim/ggplot_vega, numericalnim, benchy, std / [math, sequtils]

proc exact(t: float): float =
  1 / (1 + 9*exp(-t))

proc dy(t: float, y: float, ctx: NumContext[float, float]): float =
  y * (1 - y)

let t0 = 0.0
let tEnd = 10.0
let y0 = 0.1 # initial condition
let tspan = linspace(t0, tEnd, 20)
let odeOptions = newODEoptions(tStart = t0)

let (t, y) = solveOde(dy, y0, tspan, odeOptions, integrator="tsit54")
let error = abs(y[^1] - exact(t[^1]))
echo "Error: ", error

let yExact = t.mapIt(exact(it))
var df = toDf(t, y, yExact)
df = df.gather(["y", "yExact"], key="Class", value="y")
ggplot(df, aes("t", "y", color="Class")) +
  geom_line() +
  ggtitle("Tsit54 Solution") +
  ggvega("images/tsit54_solution.html", show = false)