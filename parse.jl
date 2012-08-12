
function increment(hash::Dict, key::Any)
  if has(hash, key)
    hash[key] += 1
  else
    hash[key] = 1
  end
end

println(join({"Year", "Committer", "Commits"}, "\t"))

for year = 2003:2012
    filename = "svn_logs/$(year).txt"

    file = open(filename, "r")
    lines = readlines(file)
    close(file)

    counts = Dict()

    for line = lines
        if ismatch(r"r\d+\s+\|\s+(\w+)", line)
            committer = match(r"r\d+\s+\|\s+(\w+)", line).captures[1]
            increment(counts, committer)
        end
    end

    for committer = keys(counts)
        println(join({year, committer, counts[committer]}, "\t"))
    end
end
