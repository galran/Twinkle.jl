
using Documenter
using Twinkle, Twinkle.FlexUI

makedocs(
    sitename = "Twinkle.jl",
    format = Documenter.HTML(
        # prettyurls = get(ENV, "CI", nothing) == "true",
        # assets = [asset("assets/TwinkleJulia.png", class = :ico, islocal = true)],
    ),
    modules = [Twinkle],
    pages = [
        "Home" => "index.md",
    ],
    expandfirst = [])

# deploydocs(
#     repo = "github.com/microsoft/OpticSim.jl.git",
#     devbranch = "main",
#     push_preview = true,
# )

