
using Documenter
using Twinkle, Twinkle.FlexUI

makedocs(
    sitename = "Twinkle.jl",
    format = Documenter.HTML(
        # prettyurls = get(ENV, "CI", nothing) == "true",
        assets = [asset("assets/TwinkleJulia.png", class = :ico, islocal = true)],
    ),
    modules = [Twinkle],
    pages = [
        "Home" => "index.md",
    ],
    expandfirst = [])

println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
println("@ SANITY CHECK")
println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")

# deploydocs(
#     repo = "github.com/galran/Twinkle.jl.git",
#     devbranch = "main",
#     push_preview = true,
#     target = "build",
#     deps = nothing,
#     make = nothing,    
# )

deploydocs(
    repo = "github.com/galran/Twinkle.jl.git",
    devbranch = "main",
    # push_preview = true,
    target = "build",
    deps = nothing,
    make = nothing,    
    branch = "gh-pages",
    devbranch = "main",
    devurl = "dev",
    versions = ["stable" => "v^", "v#.#", devurl => devurl],
    push_preview    = false,
)