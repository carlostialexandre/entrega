# entrega
📌 ENTIDADES PRINCIPAIS
1️⃣ Conta (Representa um Cliente)
📌 Uma conta pode ser de Pessoa Física (PF) ou Pessoa Jurídica (PJ), mas nunca ambas.

Atributo	Tipo	Descrição
id_conta	PK (NUMBER)	Identificador único da conta
email	VARCHAR2(100)	E-mail da conta
senha	VARCHAR2(100)	Senha de acesso (hash)
telefone	VARCHAR2(20)	Telefone de contato
data_criacao	DATE	Data de criação da conta
tipo_conta	CHAR(2)	'PF' para pessoa física, 'PJ' para jurídica
2️⃣ Pessoa Física (PF)
📌 Ligação 1:1 com a Conta (Exclusiva para PFs).

Atributo	Tipo	Descrição
id_pf	PK, FK (NUMBER)	Identificador único (mesmo de id_conta)
cpf	VARCHAR2(11)	CPF do cliente
nome	VARCHAR2(100)	Nome completo
data_nascimento	DATE	Data de nascimento
3️⃣ Pessoa Jurídica (PJ)
📌 Ligação 1:1 com a Conta (Exclusiva para PJs).

Atributo	Tipo	Descrição
id_pj	PK, FK (NUMBER)	Identificador único (mesmo de id_conta)
cnpj	VARCHAR2(14)	CNPJ da empresa
razao_social	VARCHAR2(100)	Razão social
nome_fantasia	VARCHAR2(100)	Nome fantasia
4️⃣ Pagamento
📌 Cada conta pode ter várias formas de pagamento (1:N).

Atributo	Tipo	Descrição
id_pagamento	PK (NUMBER)	Identificador único do pagamento
id_conta	FK (NUMBER)	Conta associada
tipo_pagamento	VARCHAR2(50)	Cartão de crédito, boleto, pix, etc.
detalhes	VARCHAR2(255)	Informações extras (ex: últimos dígitos do cartão)
5️⃣ Pedido
📌 Cada pedido pertence a uma conta e pode ter múltiplos produtos.

Atributo	Tipo	Descrição
id_pedido	PK (NUMBER)	Identificador único do pedido
id_conta	FK (NUMBER)	Conta que fez o pedido
data_pedido	DATE	Data do pedido
total_pedido	NUMBER(10,2)	Valor total do pedido
status	VARCHAR2(50)	Pendente, Pago, Enviado, etc.
6️⃣ Entrega
📌 Cada pedido tem uma única entrega (1:1).

Atributo	Tipo	Descrição
id_entrega	PK (NUMBER)	Identificador único da entrega
id_pedido	FK (NUMBER)	Pedido associado
status	VARCHAR2(50)	Enviado, Em trânsito, Entregue, etc.
codigo_rastreio	VARCHAR2(50)	Código de rastreamento da entrega
data_envio	DATE	Data de envio
data_entrega	DATE	Data prevista para entrega
7️⃣ Produto
📌 Produtos que podem ser comprados nos pedidos (N:M com Itens_Pedido).

Atributo	Tipo	Descrição
id_produto	PK (NUMBER)	Identificador único do produto
nome	VARCHAR2(100)	Nome do produto
descricao	VARCHAR2(255)	Descrição do produto
preco	NUMBER(10,2)	Preço unitário
estoque	NUMBER	Quantidade disponível
8️⃣ Itens_Pedido (Tabela Associativa)
📌 Ligação N:M entre Pedidos e Produtos.

Atributo	Tipo	Descrição
id_pedido	PK, FK (NUMBER)	Pedido associado
id_produto	PK, FK (NUMBER)	Produto associado
quantidade	NUMBER	Quantidade comprada
subtotal	NUMBER(10,2)	Preço total do item no pedido
🔹 Relacionamentos do Modelo
Conta (1) → (1) Pessoa Física / Pessoa Jurídica (exclusivo)

Conta (1) → (N) Pagamento

Conta (1) → (N) Pedido

Pedido (1) → (1) Entrega

Pedido (N) → (M) Produto via Itens_Pedido

