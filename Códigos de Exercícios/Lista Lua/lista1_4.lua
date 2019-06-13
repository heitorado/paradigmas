function num_triang(n)
    local k = 0
    local previousK = 0
    local counter = 1
    for i=1, n, 1 do
        return function()
            if counter <= n then
                k = counter+previousK
                previousK = k
                counter = counter+1
                return k
            end
        end
    end
end

for x in num_triang(6)  do
    io.write(x, "  ")
end