<h1 align="center">
    Zé Delivery Code Challenge
</h1>


### Sobre o Desafio

Não queremos que os nossos clientes tenham problemas e bugs ao utilizar a nossa plataforma Zé Delivery. Principalmente nesse momento super importante, que é quando ele escolhe uma cerveja gelada para degustar na hora.
 
Bem, tendo isso em mente, devemos implementar alguns testes para minimizar esse risco:

### 1. Identifique os fluxos críticos

Você notará que nossas plataformas web e mobile são um pouco diferentes, portanto, para esta primeira parte do desafio do código, você pode escolher um dos 3 aplicativos que temos: Android, iOS, Web.
 
i. Identifique no mínimo, 3 fluxos importantes que mantêm o aplicativo funcionando corretamente. Por exemplo: Login (Login é um fluxo importante porque o usuário precisa estar logado para concluir uma compra). Como foi dado como exemplo, agora não vale usar o login no teste heinn :p
 
ii. Forneça uma explicação detalhada de por que esses fluxos são importantes para que o usuário possa comprar seus produtos.


### 2. Teste Automatizado de WEB
Em nossa [Aplicação da Web](https://www.ze.delivery/), crie uma suite de testes de automação para um cenário da parte 1 do desafio de código (escolha um dos 3 fluxos que você criou em `1. Identifique os fluxos críticos`).


<h1 align="center">
Planejamento do projeto
</h1>
Antes de criar qualquer tipo de automação iniciei o planejamento do projeto como se realmente fosse uma equipe trabalhando para desenvolver
uma história e com isso, criei uma história utilizando as boas práticas do BDD e ATDD.


Obs: Notei que todo o fluxo que o usuario passa na plataforme tem uma certa criticidade, 
então por isso pensei em criar uma história para atendermos um denominado fluxo.<br>
Um dos fluxos que vejo como critico é a tela de cadastro, pois se o usuário tiver que preencher muitas informações 
e ter algum problema na hora de criar sua conta, ele pode desistir de abrir uma conta no Zé.


<h1 align="center">
História do Usuario
</h1>

**Narrativa do usuario**

Eu como usuário do Zé <br>
Gostaria de montar uma sacola de compras <br>
Para ter a opção de montar uma lista antes de finalizar minha compra <br>

### DOR - Definition Of Ready

Negócio - Documentação da história de usuário pronta ✔<br>
Negócio - Regras de negócio da história definido/atualizado ✔<br>
Negócio - Critérios de aceites do PO iniciado/atualizado ✔<br>

Devs - Refinamento de negócio finalizado ✔ <br>
Devs - Readme finalizado/atualizado ✔ <br>
Devs - Contrato da API finalizado/atualizado ✔<br>

QA - Planejamento/Criacao de Cenários criado e atualizado ✔<br>
QA  - Testes de acessibilidade passado com sucesso ✔ <br>
QA - Ambiente de Homolog e rota do gateway atualizado ✔ <br>


### DOD - Definition Of Done

Devs-  Funcionalidade atendendo as regras de negócio do PO ✔ <br>
Devs- Funcionalidade atendendo os critério de aceites ✔ <br>
QA-    Todos os critérios de aceite executados com sucesso <br>
PO-    Funcionalidade atendendo os critérios de aceites e as regras de negócio implantado em produção <br>

### Documentação de Negócios:
Conforme a narrativa do usuario, sera criado um carrinho enquanto que de a opção do usuario ir enchendo enquanto ele seleciona seus itens na tela de produtos.  Mas antes do usuario selecionar os itens será necessário fazermos as seguintes validações:  

- Dar a opção para o usuario informar sua localização para saber se o Zé atende na região dele  
- Ter um modal que pergunta se o usuário é maior de 18 anos, caso ele não seja, deverá ser mostrado um descritivo que o Zé não vende bebida alcoólicas para menor de idade, caso ele seja de maior encaminhamos ele para a pagina dos produtos  
- Ter um item de carrinho que quando o cliente clicar mostre todos os itens que ele selecionou até agora
- O valor mínimo para o usuario efetuar a compra é de 15,00

### Critérios de aceite:

**Cenario 1 - Validar se o zé trás uma mensagem para uma região que não é atendida** <br>
    Dado que acesso a pagina inicial <br>
    Quando o usuario informa o cep  07700210 <br>
    Então o usuario recebe a seguinte mensagem  Ops! Não encontramos seu endereço... <br>

**Cenario 2 - Validar se o zé trás o informativo para menores de idade** <br>
    Dado que acesso a pagina inicial <br>
    E que tenha preenchido uma região atendida pelo o Zé  13219071  300 <br>
    E que tenha clicado no botao "ver produtos disponíveis" <br>
    Quando o usuario informa que é menor de idade <br>
    Então é retornado a seguinte mensagem  Você precisa ter 18 anos ou mais para consumir bebidas alcoólicas. <br>

**Cenario 3 - Validar se a sacola mostra a quantidade de itens que o usuario inseriu** <br>
     Dado que eu esteja na tela de produtos <br>
     E que tenha selecionado uma quantidade de itens na sacola  skol  7 <br>
     Quando abre a sacola <br>
     Então é exibido a quantidade de itens da skol <br>

**Cenario 4 - Validar se é informado a mensagem que o usuario ainda não inseriu o valor mínimo** <br>
    Dado que eu esteja na tela de produtos <br>
    E que tenha selecionado uma quantidade de itens na sacola  skol  2 <br>
    Quando abre a sacola <br>
    Então é exibido a mensagem  Faltam R$ 10,22 para o valor mínimo do pedido <br>

**Cenario 5 - Validar se a pagina do zé delivery esta no padrão de acessibilidade** <br>
    Dado que eu esteja na tela inicial <br>
    Quando eu executo a validação de acessibilidade <br>
    Então é retornado o resultado da violação <br>

<h1 align="center">
Explicacao sobre a estrutura do projeto
</h1>
O projeto foi desenvolvido com Robot Framework utilizando a library da browser para automação dos fluxos críticos do Zé e para automação da validação de acessbilidade foi utilizado o Robot com Selenium e a library AxesLibrary.

#### Estrutura dos testes

    ├── .github                   
        ├── gitflows                            # Diretório de arquivos para rodar a pipeline
    ├── Locators                                # Diretório para armazenar os elementos buscado na tela
    ├── Resource                                # Diretório comas classes .robot que roda as keywords  
    ├── TestCase                                # Diretório para armazernar os cenários de testes  
        ├── AccessibilityTest.robot             # Validação dos testes de acessibilidade para saber o quanto nossa pagina é acessível
        ├── ValidateBuy.robot                   # Test Case para valdiar o fluxo de compra na pagina
    └── README.md                               # Documentação do projeto
    

### Desenho da arquitetura de solução do projeto

![image](https://user-images.githubusercontent.com/35806393/168449583-b7f39081-5c07-478f-b090-ae72ed8d52ff.png)


### Por quê utilizar o Robot Framework?
Durante algumas techs apresentadas pelo o Zé delivery notei que é utilizado muito desenvolvimento com python então resolvi trazer um viés de utilizarmos um framework mais próximo dessa linguagem,
com isso pensei no robot. <br>
Utilizo muito o robot no meu dia a dia e vejo que ele é um framework muito fácil de automatizar! E além dessa facilidade ele pode ser utilizado em 
diversas camadas, como em backend, frontend e APPs!

<h1 align="center">
1. Fluxos Críticos
</h1>

#### I - Endereço
A validação de endereço ja aparece no home page do zé, vejo que é um fluxo importante pois é uma etapa onde o usuário vai saber 
se a região que ele esta localizado é atendida pelo o zé.
Se o usuário soubesse que a região que ele esta localizado não é atendida pelo o zé somente no final da compra,
iria gerar uma péssima experiência para o usuário que esta tendo o primeiro contato na plataforma.

#### II - Proibição de vendas de bebidas alcoólicas para menores de idade
Uma etapa bem importante, pois já mostra antes de qualquer compra que o Zé delivery não vende bebida para menores de idade, 
já imaginou termos um problema judicial caso não tivesse essa validação e informação na plataforma? 

#### III - Sacola de compras
Uma etapa super importante, pois é aonde o usuário consegue montar a sua sacola com todos os produtos que ele optou pela compra, 
então vejo que é uma das funcionalidades mais importante na jornada de compras do Zé

#### IV - Acessibilidade
Coloquei um cenário bônus pois vejo que essa funcionalidade deveria ser muito pertinente nos aplicativos hoje em dia 
e visto que o Zé apoia ter um mundo mais acessível, por que não vermos o quanto nosso aplicativo é acessível para um portador 
de deficiência? Afinal, a boa experiência que o zé quer passar deve ser para todos.

### Continuos Test
Além de criarmos nossa automação é necessário rodarmos ela em uma PIPE certo? Então desenvolvi o github actions para rodar nosso projeto de automação 
a cada PUSH que fazemos no nosso repo, para rodar o projeto no github é só rodar no menu de Actions!

A nossa pipeline se integra com a AWS para armazenar o resultado do testes em um Bucket S3!

<h1 align="center">
Configurando o projeto na sua máquina
</h1>

### Instalação das dependências para rodar o projeto local

- Ter uma IDE de sua preferência
- Instalar o Selenium Library para rodar o teste AccessibilityTest.robot: [Documentação oficial de como instalar](https://github.com/robotframework/SeleniumLibrary/)
- Instalar o Axes Library para rodar executar as validações de acessibilidade: [Documentação oficial de como instalar](https://github.com/adiralashiva8/robotframework-axelibrary)
- Instalar a library da browser para rodar o teste ValidateBuy.robot:  [Documentação oficial de como instalar](https://github.com/MarketSquare/robotframework-browser)

<h1 align="center">
Executando o projeto
</h1>

> Clone o projeto
```
git clone https://github.com/leonardodossantos2012/ChallengeZe.git
```

Acessar a pasta do projeto e executar via CMD um comando de sua preferência:

> Execução de todos os test case
```
robot -d ./results .\TestCase
```

> Execução por tags, somente dos cenários [smoke]
```
robot -d ./results -i smoke .\TestCase\
```

> Execução por tags, somente dos cenários [regression]
```
robot -d ./results -i regression .\TestCase\
```
> Execução por tags, somente dos cenários [accessibility]
```
robot -d ./results -i accessibility .\TestCase\
```

<h1 align="center">
Execução no terminal
</h1>

![Terminal](https://user-images.githubusercontent.com/35806393/167971452-351b9e68-a51b-4b70-9868-d7bf687e3508.png)

<h1 align="center">
Execução no actions
</h1>

![22-30-42](https://user-images.githubusercontent.com/35806393/167974093-d1404652-9222-454a-b6d3-2e673844a63d.gif)

<h1 align="center">
Testes Web
</h1>

![22-09-10](https://user-images.githubusercontent.com/35806393/167972156-342d0508-7e08-4f9b-bc47-eec415dce253.gif)

<h1 align="center">
Reports no Bucket S3
</h1>

![22-23-38](https://user-images.githubusercontent.com/35806393/167973398-e96b5b84-97a0-467f-aa2b-809b2fd99384.gif)


<h1 align="center">
Ponto de atenção
</h1>

Dependendo do horário da execução pode ser que a região selecionada não esteja em funcionamento e com isso não é possível fazer as validações da sacola, pois estamos validando um produto em uma URL de produção e em tempo real. Por exemplo, ao tentar executar as 10h da manhã já não é possível pois não tem nenhum distribuidor atendendo nesse horário. Os testes estão sendo feito na região de Jundiaí e como informando na imagem abaixo o horário que os fornecedores estão abertos é entre 11h e 23h59

![image](https://user-images.githubusercontent.com/35806393/168289073-c87eb286-8074-45b9-8cd2-79a48b7b9776.png)


