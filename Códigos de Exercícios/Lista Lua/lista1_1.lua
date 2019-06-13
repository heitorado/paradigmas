tabela_cientistas = { clattes = {nome = "Cesar",
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


function get_internal_keys(table)
  aux = {}
  res = {}

  for k,v in pairs(table) do
    for u, w in pairs(v) do
      if(not aux[u]) then
        res[#res+1] = u
        aux[u] = true
        print(res[#res])
      end
    end
  end

  return res
end


get_internal_keys(tabela_cientistas)
