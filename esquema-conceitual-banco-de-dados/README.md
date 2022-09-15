## Descrição do Desafio
### Objetivo:
##### - Cria o esquema conceitual para o contexto de oficina com base na narrativa fornecida

### Narrativa:
##### - Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica
##### - Clientes levam veículos à oficina mecânica para serem consertados ou para passarem por revisões  periódicas
##### - Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega.
##### - A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra
##### - O valor de cada peça também irá compor a OSO cliente autoriza a execução dos serviços
##### - A mesma equipe avalia e executa os serviços
##### - Os mecânicos possuem código, nome, endereço e especialidade
##### - Cada OS possui: n°, data de emissão, um valor, status e uma data para conclusão dos trabalhos.

### Resoluções:
##### - Revisão e Conserto foram criadas como especializações de uma entidade serviço, a qual várias podem estar atreladas a uma só ordem de serviço.
##### - Mão de obra foi criada como uma generalização de Revisão e Concerto, por compartilharem um atributo comum, o valor.
##### - Código em "Mecânicos" e Número em "Ordem de Serviço" foram utilizadas como Primary Key, descartando a necessidade de um ID para cada.
##### - Valor foi retirado de "Ordem de Serviço" pois a informação pode ser recuperada através de Queries.