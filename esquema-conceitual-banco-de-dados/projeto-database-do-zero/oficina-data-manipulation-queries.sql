use oficina;

-- selecionando todos os clientes
SELECT * FROM clients;

-- selecionando carros da equipe 2
SELECT * FROM team JOIN vehicle USING(idTeam) WHERE idTeam=2;

-- selecionando equipes que tem 2 ou mais carros
SELECT TName, Supervisor, count(idVehicle) as qntCarros FROM team JOIN vehicle USING (idTeam)
	group by idTeam
    having count(idVehicle)>1;

-- ordem dos clientes que tem mais carros
SELECT CName, count(idVehicle) as qntVehicles FROM clients as c JOIN vehicle as v USING(idClient)
	GROUP BY idClient
	ORDER BY count(idVehicle) DESC;