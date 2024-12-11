INSERT INTO client (name, cpf, rg, birth_date, gender, profession, nationality, public_place, house_number, complement, neighborhood, municipality, uf, observations)
VALUES
('Maicon', '12345678921', '1234', '1970-10-15', 'F', 'Empresário', 'Brasileira', NULL, NULL, NULL, NULL, 'Florianópolis', 'PR', NULL),
('Geniudo', NULL, '4563', NULL, 'F', 'Estudante', 'Brasileira', 'Rua', '343',  'NULL', 'Curitiba', , NULL));


update client set cpf = '45390569432', gender = 'M', nationality = 'Brasileira', uf = 'SC' where idclient = 23;
update client set gender = 'M', birth_date = '1978-04-01' where idclient = 24;
update client set gender = 'F', profession = 'Teacher', house_number = '123' where idclient = 25;

delete from client where idclient = 23;
delete from client where idclient = 25;