using RiccatiRecursion
using Documenter

DocMeta.setdocmeta!(RiccatiRecursion, :DocTestSetup, :(using RiccatiRecursion); recursive=true)

makedocs(;
    modules=[RiccatiRecursion],
    authors="Ian McInerney <ian.mcinerney@manchester.ac.uk> and contributors",
    repo="https://github.com/JuDO-dev/RiccatiRecursion.jl/blob/{commit}{path}#{line}",
    sitename="RiccatiRecursion.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://JuDO-dev.github.io/RiccatiRecursion.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/JuDO-dev/RiccatiRecursion.jl",
    devbranch="main",
)
