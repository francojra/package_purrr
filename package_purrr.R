# Pacote purrr - Tidyverse -----------------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 13/03/2022 -------------------------------------------------------------------------------------------------------------------------
# Fonte: Associação Brasileira de Jurimetria e Curso R -------------------------------------------------------------------------------------

# Conceito do pacote purrr -----------------------------------------------------------------------------------------------------------------

## Ao usar programação funcional (PF) podemos criar códigos concisos e “pipeáveis”, 
## que tornam o código mais legível e o processo de debug mais simples. Apesar de o 
## R base já ter funções que podem ser consideradas elementos de PF, a implementação 
## destas não é elegante. 

# Iterações básicas ------------------------------------------------------------------------------------------------------------------------

## As funções map() são quase como substitutas para laços for: elas abstraem a iteração 
## em apenas uma linha. Veja esse exemplo de laço usando for:

soma_um <- function(x) x + 1
obj <- 10:15

for (i in seq_along(obj)) {
  obj[i] <- soma_um(obj[i])
}
obj

soma_um(3)

## O que de fato estamos tentando fazer com o laço acima? Temos um vetor (obj) e 
## queremos aplicar uma função (soma_um()) em cada elemento dele. A função map() 
## remove a necessidade de declaramos um objeto iterador auxiliar (i) e simplesmente 
## aplica a função desejada em cada elemento do objeto dado.

## Mas antes é necessário baixar o pacote purrr

library(purrr)

soma_um <- function(x) x + 1
obj <- 10:15

obj <- map(obj, soma_um)
obj

# Programação Funcional --------------------------------------------------------------------------------------------------------------------

## Baixar pacotes auxiliares

library(dplyr)
library(ggplot2)

## 1. Utilize a função map() para calcular a média de cada coluna da base mtcars.

map(mtcars, mean)

## 2. Use a função map() para testar se cada elemento do vetor letters é uma vogal ou não.
## Dica: você precisará criar uma função para testar se é uma letra é vogal.
## Faça o resultado ser (a) uma lista de TRUE/FALSE e (b) um vetor de TRUE/FALSE.

testar_vogal <- function(x) {
  if (x %in% c("a", "e", "i", "o", "u")) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

map(letters, testar_vogal) # retornando uma lista

## retornando um vetor (2 soluções equivalentes)

map(letters, testar_vogal) %>% flatten_lgl()
map_lgl(letters, testar_vogal)
