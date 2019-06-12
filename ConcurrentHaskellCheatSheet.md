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
O bloco 'do' é extremamente útil e será utilizado extensivamente em haskell concorrente, pois permite a execução de comandos sequenciais. Antes, se tentávamos executar comandos sequencialmente sem o uso de um bloco 'do', a linguagem considerava a próxima linha como a continuação dos argumentos da função da linha acima, e não uma nova linha de comandos.

## Iniciando as threads
Para criarmos Threads, podemos usar a sintaxe a seguir:
```haskell
main = do
    forkIO (funcao1 arg1 arg2)
    forkIO (funcao2 arg1)
    forkIO (funcao3)
```

Cada comando ```forkIO``` cria uma nova thread que executará o método passado como argumento.

# Criando Threads em Haskell
STM - Software Transactional Memory é uma implementações de Haskell de memória transacional, que nos ajuda em concorrência de modo a não precisarmos fazer uso de meios bloqueantes entre threads. A forma mais simples de ver a memória transacional é relacionando ao funcionamento das transações de um banco de dados convencional - se a transação é bem sucedida e consistente, ele realiza um "COMMIT" e grava na tabela do banco. Caso haja alguma inconsistência a transação não é executada pela "metade". É feito um "ROLLBACK" e as mudanças já feitas não são aplicadas.

Isso pode ser feito em Haskell com TVars, isto é, Transactional Variables. Variáveis transacionais e seus métodos podem ser utilizados **apenas** através do método ```atomically```, que é util principalmente por 2 motivos
1) O método atomically transforma de STM() para IO(), permitindo um retorno nos métodos mais flexível.
2) O método atomically **garante** a atomicidade da transação (embora internamente, os comandos possam não ser executados atomicamente, o resultado visível é que foram) de forma que se houver inconsistência no meio da transação, ela é reiniciada desde o início até que se complete com consistência.

### Exemplo de uso - Semáforo Simples retornando STM():
```haskell
lock :: TVar Bool -> STM()
lock myLock = 
    do 
        myLock <- readTVar(myLock)
        if myLock
        then writeTVar(myLock False)
        else retry


unlock :: TVar Bool -> STM()
unlock myLock = do( writeTVar myLock True )
```

Nesse caso é importante lembrar de utilizar estes métodos ```lock``` e ```unlock``` que retornam STM() **apenas** dentro de blocos ```atomically```.

### Ou então, este exemplo de Semáforo Simples que retorna IO():
```haskell
lock :: TVar Bool -> IO()
lock myLock = 
    atomically (
        do 
            myLock <- readTVar(myLock)
            if myLock
            then writeTVar(myLock False)
            else retry
    )


unlock :: TVar Bool -> IO()
unlock myLock = atomically( do( writeTVar myLock True ) )
```


# Conceitos importantes
## IO
## STM
# Código Thread-Safe em Haskell
## MVars
## TVars
# Exemplo de Semáforo
# Exemplo de BlockingQueue