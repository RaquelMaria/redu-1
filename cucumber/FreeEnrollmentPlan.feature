@i9n
	Feature: configuração de assinatura gratuita

	As a administrador de curso
	I want to disponibilizar cursos de forma gratuita
	So that os usuários podem consumir conteúdo sem custo o conteúdo do curso

	Scenario: configuração do modo de pagamento do curso
	Given estou cadastrando um novo curso 
	And estou na fase de escolha do valor da assinatura
	When eu escolho a opção “Gratuito”
	Then os usuários podem fazer a assinatura do curso sem efetuar o pagamento.

	Scenario: cadastro de um curso com preço zero
	Given estou cadastrando um novo curso 
	And estou na fase de escolha do valor da assinatura
	And eu escolho a opção “Assinatura mensal”
	When eu digito o preço como zero
	Then a opção de pagamento do curso é salva como “Gratuito”

	Scenario: cadastro de um curso com opção de pagamento “Gratuito”
	Given estou cadastrando um novo curso 
	And estou na fase de escolha do valor da assinatura
	When eu escolho a opção “Assinatura mensal”
	Then um campo para informar o preço é exibido

	Scenario: cadastro de um curso com opção de pagamento “Assinatura Mensal”
	Given estou cadastrando um novo curso 
	And estou na fase de escolha do valor da assinatura
	When eu escolho a opção “Gratuito”
	Then o campo para informar o preço é escondido

	Scenario: Tentou criar curso sem definir tipo de assinatura
	Given estou cadastrando um novo curso
	And estou na fase de escolha da assinatura
	When eu tento avançar na criação do curso sem escolher a assinatura
	Then aparece uma mensagem de erro “Para avançar, é necessário escolher uma opção de assinatura para este curso”

	Scenario: Modificar assinatura de um curso que possui “Assinatura Mensal” para “Assinatura Gratuita”
	Given estou na página de configurações da assinatura de um curso
	When eu seleciono a opção de assinatura do curso para “Gratuito”
	Then o curso é alterado para “Assinatura Gratuita”

	Scenario: Modificar assinatura de um curso que possui “Assinatura Mensal” para “Assinatura Gratuita”, dado que escolheu preço zero
	Given estou na página de configurações da assinatura de um curso
	When eu preencho com 0 (zero) o valor do curso
	Then o curso é alterado para “Assinatura Gratuita”

	Scenario: Modificar assinatura de um curso que possui “Assinatura Gratuita” para “Assinatura Mensal”
	Given estou na pagina de configurações de assinatura de um curso
	When eu seleciono a opção assinatura mensal
	And eu preencho o valor do curso
	Then o curso é alterado para “Assinatura Mensal”

	Scenario: Avisa aos usuários cadastrados em um curso que possui “Assinatura Mensal”, que seu curso agora possui uma “Assinatura Gratuita”
	Given que um curso tem Assinatura Mensal
	When o curso é alterado para “Assinatura Gratuita”
	Then notifica todos os usuários cadastrados naquele curso sobre a modificação da assinatura