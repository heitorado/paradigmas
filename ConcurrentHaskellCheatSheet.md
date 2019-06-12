# Monads
what the fuck is a monad anyway?
# Nova abordagem: Compilação de códigos .hs e 'main'
## Compilando
Agora é mais conveniente trabalhar com códigos compilados em Haskell, já que podemos definir um bloco main e trabalhar com itens executados sequencialmente (já veremos como).

Para compilar um código em Haskell:
```
ghc -o meuexecutavel meucodigo.hs
```

Após isso, é possível executar com:
```
./meuexecutável
```
(No Linux. Outras plataformas: usem linux.)

## public static void main?
Agora podemos criar um bloco 'main' que será executado automaticamente ao iniciar o código compilado, da seguinte forma:
```haskell
main = do
    let meuArray = [1,2,3,4,5]
    putStrLn (show (meuArray!!2) )
```
O bloco do é extremamente útil e será utilizado extensivamente em haskell concorrente, pois permite a execução de comandos sequenciais. Antes, se tentávamos executar comandos sequencialmente sem o uso de um bloco do, a linguagem considerava a próxima linha como a continuação dos argumentos da função da linha acima, e não uma nova linha de comandos.

## Iniciando as threads
Para criarmos Threads, podemos usar a sintaxe a seguir:
```haskell
main = do
    forkIO (funcao1 arg1 arg2)
    forkIO (funcao2 arg1)
    forkIO (funcao3)
```

Cada comando forkIO cria uma nova thread que executará o método passado como argumento.

# Criando Threads em Haskell
# Conceitos importantes
## IO
## STM
# Código Thread-Safe em Haskell
## MVars
## TVars
# Exemplo de Semáforo
# Exemplo de BlockingQueue