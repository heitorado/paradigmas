function fibs(num)
    ans = 0
    oldans = 0
    counter = 1
    for i=1, num, 1 do
        return function()
            if(counter <= num) then
                if(counter == 1) then
                    counter = counter+1
                    return 1
                end

                if(counter==2) then
                    ans = 1
                    oldans = 1
                    counter = counter+1
                    return 1
                end
        

                aux = ans
                ans = ans + oldans
                oldans = aux
                
                counter = counter+1
                return ans
            end
        end
    end
end

s = 0
for i in fibs (5) do
    s = s + i
end
print(s) -- 12