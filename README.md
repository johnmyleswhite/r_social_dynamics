A quantitative study of the social dynamics of the R language.

# First Analysis

_Step 1_: Download SVN logs:

* Available at http://developer.r-project.org/

_Step 2_: Use a regex to parse SVN logs to count commits coming from each core committer:

* `julia parse.jl > committers.tsv`

_Step 3_: Tabulate results by pooling across years:

* `Rscript tabulate.R`

_Step 4_: Visualize results across years using ggplot2:

* `Rscript viz.R`
