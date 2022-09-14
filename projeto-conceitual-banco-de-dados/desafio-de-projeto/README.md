### Refinando um Projeto Conceitual de Banco de Dados – E-COMMERCE

## **Objetivo:**

Refine o modelo apresentado acrescentando os seguintes pontos:

-   Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;
-   Pagamento – Pode ter cadastrado mais de uma forma de pagamento;
-   Entrega – Possui status e código de rastreio;

## **Resoluções:**

	Para o Cliente PJ e PF foram criadas especializações para criação, respectivamente, de CNPJ e CPF, fazendo da classe "Cliente" a generalização dos dois tipos de cliente.

	Para o "Pagamento" foi criada uma nova entidade, com relação de 1:n com o cliente, possibilitando que um cliente tenha mais de uma forma de pagamento. Foi criada também a entidade "Cartão" com atributos comuns a cartões de créditos, exceto CVC para que este não fique persistido, dando segurança para o usuário, assim o cliente pode cadastrar mais de um cartão como forma de pagamento.

	Para a "Entrega" foi criada uma entidade com relação de 1:1 com o pedido, com status e código de rastreio como atributos.