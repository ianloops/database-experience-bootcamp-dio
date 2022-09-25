use oficina;

desc clients;
INSERT INTO clients (CName, BirthDate) VALUES
	('Ian Lucas', '1997-01-27'),
    ('Rafaela Lucas', '1997-08-21'),
    ('Igor Matheus', '1995-02-14');
    
desc team;    
INSERT INTO team (TName, Supervisor) VALUE
	('Equipe 1', 'Carlos Alberto'),
    ('Equipe 2', 'Carlos Alberto'),
    ('Equipe 3', 'Luiz Carlos'),
    ('Equipe 4', 'Ronaldo Lucas');
    
desc vehicle;
select * from clients, team;
INSERT INTO vehicle(idClient, idTeam, Model) VALUES
	(3, 2, 'Civic'),
    (1, 2, 'Civic'),
    (3, 1, 'Fox'),
    (2, 1, 'Corola'),
    (2, 3, 'Gol'),
    (2,1,'C3');
