local input = { 
    clattes = {
                nome = "Cesar",
                sobrenome = "Lattes",
                ano_nascimento = 1924,
                area = 1940,
                ano_falecimento = 2005,
                contribuicao = "meson pi"
            },
    jpalis = {
                nome = "Jacob",
                sobrenome = "Palis",
                ano_nascimento = 1940,
                ano_falecimento = 0000,
                contribuicao = "sistemas dinamicos"
            }
    }

function tabConsistencia (tab)
    keys = {}
    
    n = 0
    size = 0

    for k, v in pairs(tab) do       
        
        local localSize = 0

        for k, v in pairs (v) do    
            
            localSize = localSize + 1
            
            if not keys[k] and n > 0 then
                return false
            end

            keys[k] = k
        end

        if n > 0 and localSize ~= size then
            return false
        end

        size = localSize
        n = n + 1
    end

    return true
end

print(tabConsistencia(input))