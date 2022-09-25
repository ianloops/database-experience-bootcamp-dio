DROP DATABASE oficina;
create database oficina;
use oficina;

CREATE TABLE clients(
	idClient INT AUTO_INCREMENT PRIMARY KEY,
	CName VARCHAR(255),
	BirthDate DATE
	);
  
CREATE TABLE team(
	idTeam INT AUTO_INCREMENT PRIMARY KEY,
    TName VARCHAR(255),
    Supervisor VARCHAR(255)
	);
    
CREATE TABLE mechanics(
	idMechanics INT AUTO_INCREMENT PRIMARY KEY,
    idTeam INT,
    MName VARCHAR(255),
    Address VARCHAR(255),
    specialty VARCHAR(45),
    constraint fk_mechanics_team FOREIGN KEY (idTeam) REFERENCES team(idTeam)
    );
    
CREATE TABLE vehicle(
	idVehicle INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT,
    idTeam INT,
    Manufacturer VARCHAR(45),
    Model VARCHAR(45),
    Color VARCHAR(20),
    licensePlate VARCHAR(7),
    constraint fk_vehicle_client FOREIGN KEY (idClient) REFERENCES clients(idClient)
);

CREATE TABLE serviceOrder(
	idServiceOrder INT AUTO_INCREMENT PRIMARY KEY,
    idVehicle INT,
    IssueDate DATE,
    DeliveryDate DATE,
    OrderDescription VARCHAR(255),
    OrderStatus ENUM('Aguardando Aprovação', 'Aprovado', 'Em Andamento', 'Cancelado', 'Concluído') default 'Aguardando Aprovação',
    constraint fk_serviceOrder_vehicle FOREIGN KEY (idVehicle) REFERENCES vehicle(idVehicle)
    );

CREATE TABLE service(
	idService INT AUTO_INCREMENT PRIMARY KEY,
    idServiceOrder INT,
    ServiceDescription VARCHAR(255),
    constraint fk_service_serviceOrder FOREIGN KEY (idServiceOrder) REFERENCES serviceOrder(idServiceOrder)
);

CREATE TABLE priceList(
	idPriceList INT AUTO_INCREMENT PRIMARY KEY,
    Service VARCHAR(45),
    Cost FLOAT
);

CREATE TABLE revision(
	idRevision INT AUTO_INCREMENT PRIMARY KEY,
    idPriceList INT,
    idService INT,
    KM_period VARCHAR(20),
    constraint fk_revision_service FOREIGN KEY (idService) REFERENCES service(idService),
    constraint fk_revision_pricelist FOREIGN KEY (idPriceList) REFERENCES priceList(idPriceList)
);

CREATE TABLE repairs(
	idRepairs INT AUTO_INCREMENT PRIMARY KEY,
    idPriceList INT,
    idService INT,
    Problem VARCHAR(20),
    constraint fk_repairs_service FOREIGN KEY (idService) REFERENCES service(idService),
    constraint fk_reparis_pricelist FOREIGN KEY (idPriceList) REFERENCES priceList(idPriceList)
);

CREATE TABLE parts(
	idParts INT AUTO_INCREMENT PRIMARY KEY,
    PName VARCHAR(255),
    PValue FLOAT
);

CREATE TABLE partsInOS(
	idServiceOrder INT,
    idParts INT,
    PRIMARY KEY( idServiceOrder, idParts),
	constraint fk_parts FOREIGN KEY (idParts) REFERENCES parts(idParts),
    constraint fk_serviceorder FOREIGN KEY (idServiceOrder) REFERENCES serviceOrder(idServiceOrder)
);