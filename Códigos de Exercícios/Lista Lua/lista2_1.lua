array = {1,2,3,4,5,6,7,8}

function imprimeTodosOsElementosQueHaNele(array)
    for k, v in pairs(array) do
        print(v)
    end
end

imprimeTodosOsElementosQueHaNele(array)

-- Como solicitado no exercicio:
function imprimeTodosOsElementosQueHaNeleDiferente(array)
    print(table.unpack(array))
end

imprimeTodosOsElementosQueHaNeleDiferente(array)