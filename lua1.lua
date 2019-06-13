local tabelaInterna = { clattes = {nome = "Cesar", 
    sobrenome = "Lattes",
    ano_nascimento = 1924,
    ano_falecimento = 2005,
    area = "fisica",
    contribuicao = "meson pi"},

    jpalis = {nome = "Jacob",
    sobrenome = "Palis",
    ano_nascimento = 1940,
    ano_falecimento = 0000,
    contribuicao = "sistemas dinamicos"}
}


function equalKeys(a)
    allKeys = {}
    for k,v in pairs(a) do
        for k1,v1 in pairs(v) do
            allKeys[k1] = k1
        end
    end

    arr = {}
    for k,v in pairs(allKeys) do
        table.insert(arr, k)
    end

    return arr
end

sia = equalKeys(tabelaInterna)

for k,v in ipairs(sia) do
    print(k,v)
end

function checkIfEqual(a)
    allKeys = {}
    for k,v in pairs(a) do
        for k1,v1 in pairs(v) do
            allKeys[k1] = k1
        end
        break
    end

    arr = {}
    for k,v in pairs(allKeys) do
        table.insert(arr, k)
    end

    for k,v in pairs(a) do
        size = 1
        for k1,v1 in pairs(v) do
            if allKeys[k1] == nil then
                return false
            end
            size = size + 1
        end

        if size > table.getn(arr) then
            return false
        end
    end

    return true
end
resp = checkIfEqual(tabelaInterna)

if resp then
    print("true")
else 
    print("false")
end