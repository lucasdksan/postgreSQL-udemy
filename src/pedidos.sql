CREATE TABLE if not exists client (
    idclient SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    cpf VARCHAR(14),
    rg VARCHAR(15),
    birth_date DATE,
    gender CHAR(1),
    profession VARCHAR(30),
    nationality VARCHAR(30),
    public_place VARCHAR(30),
    house_number VARCHAR(10),
    complement VARCHAR(30),
    neighborhood VARCHAR(30),
    municipality VARCHAR(30),
    uf CHAR(2),
    observations TEXT
);

-- Inserir informações na tabela

insert into client (
    name,
    cpf,
    rg,
    birth_date,
    gender,
    profession,
    nationality,
    public_place,
    house_number,
    complement,
    neighborhood,
    municipality,
    uf,
    observations
) values (
    'Lucas',
    '07386996322',
    '02466760',
    '1998-11-07',
    'M',
    'Development',
    'Brasileira',
    'Rua Capitão Martinho',
    '1859',
    'Casa grande',
    'Passagem de Areia',
    'Parnamirim',
    'RN',
    'Nada'
),('Ana Silva', '12345678900', '98765432', '1990-05-15', 'F', 'Teacher', 'Brasileira', 'Rua das Flores', '123', 'Apto 101', 'Centro', 'Natal', 'RN', 'Cliente antiga'),
('João Pereira', '98765432100', '12345678', '1985-07-22', 'M', 'Engineer', 'Brasileira', 'Avenida Paulista', '456', 'Casa', 'Jardim Paulista', 'São Paulo', 'SP', 'Gosta de descontos'),
('Mariana Costa', '45678912300', '87654321', '1992-03-10', 'F', 'Designer', 'Brasileira', 'Rua do Sol', '789', '', 'Petrópolis', 'Rio de Janeiro', 'RJ', 'Nada a declarar'),
('Carlos Dias', '65432198700', '23456789', '1988-12-30', 'M', 'Analyst', 'Brasileira', 'Rua da Lua', '321', 'Bloco B', 'Lagoa Nova', 'Natal', 'RN', 'Visita frequente'),
('Fernanda Lima', '11223344556', '55664433', '1995-06-18', 'F', 'Nurse', 'Brasileira', 'Rua das Palmeiras', '22', '', 'Centro', 'Recife', 'PE', 'Cliente fiel'),
('Paulo Santos', '22334455667', '66775544', '1980-11-05', 'M', 'Doctor', 'Brasileira', 'Avenida Atlântica', '33', 'Cobertura', 'Copacabana', 'Rio de Janeiro', 'RJ', 'Prefere e-mails'),
('Julia Ferreira', '33445566778', '77886655', '1999-04-25', 'F', 'Chef', 'Brasileira', 'Rua dos Pinhais', '44', '', 'Água Fria', 'Fortaleza', 'CE', 'Vegana'),
('Rafael Mendes', '44556677889', '88997766', '1983-09-12', 'M', 'Developer', 'Brasileira', 'Avenida Beira Mar', '55', 'Casa', 'Boa Viagem', 'Recife', 'PE', 'Sempre atrasado'),
('Clara Alves', '55667788990', '99008877', '2000-01-01', 'F', 'Student', 'Brasileira', 'Rua dos Ipês', '66', '', 'Alto Branco', 'Campina Grande', 'PB', 'Estudante de TI'),
('Gabriel Souza', '66778899001', '00119988', '1997-07-07', 'M', 'Pilot', 'Brasileira', 'Rua do Aeroporto', '77', 'Apto 201', 'Jardins', 'São Paulo', 'SP', 'Viagens frequentes'),
('Larissa Rocha', '77889900112', '11223344', '1993-02-14', 'F', 'Dentist', 'Brasileira', 'Avenida Central', '88', 'Sala 1', 'Centro', 'Brasília', 'DF', 'Atendimento excelente'),
('Thiago Nunes', '88990011223', '22334455', '1987-08-08', 'M', 'Lawyer', 'Brasileira', 'Rua da Justiça', '99', '', 'Centro', 'Curitiba', 'PR', 'Busca parcelamentos'),
('Beatriz Monteiro', '99001122334', '33445566', '1996-03-20', 'F', 'Journalist', 'Brasileira', 'Rua dos Editores', '111', '', 'Centro', 'Florianópolis', 'SC', 'Gosta de promoções'),
('Eduardo Azevedo', '00112233445', '44556677', '1982-10-10', 'M', 'Architect', 'Brasileira', 'Rua da Construção', '222', 'Casa grande', 'Centro', 'Salvador', 'BA', 'Atende online'),
('Camila Martins', '11223344556', '55667788', '1994-12-24', 'F', 'Manager', 'Brasileira', 'Avenida Empresarial', '333', 'Cobertura', 'Centro', 'Porto Alegre', 'RS', 'Pagamento recorrente'),
('Vinicius Oliveira', '22334455667', '66778899', '1991-06-15', 'M', 'Entrepreneur', 'Brasileira', 'Rua do Comércio', '444', '', 'Centro', 'Belém', 'PA', 'Contato via WhatsApp'),
('Patrícia Gomes', '33445566778', '77889900', '1998-02-02', 'F', 'Pharmacist', 'Brasileira', 'Rua das Farmácias', '555', '', 'Bairro Novo', 'Olinda', 'PE', 'Consulta mensal'),
('Renato Farias', '44556677889', '88990011', '1979-03-03', 'M', 'Economist', 'Brasileira', 'Rua da Economia', '666', 'Sala 5', 'Centro', 'Goiânia', 'GO', 'Busca por descontos'),
('Helena Carvalho', '55667788990', '99001122', '2001-07-21', 'F', 'Psychologist', 'Brasileira', 'Rua da Saúde', '777', '', 'Bairro Alto', 'São Paulo', 'SP', 'Horários noturnos'),
('Ricardo Lopes', '66778899001', '00112233', '1986-09-09', 'M', 'Professor', 'Brasileira', 'Rua das Escolas', '888', 'Bloco A', 'Centro', 'Manaus', 'AM', 'Pagamento à vista');

-- Select

-- select * from client;
select name, birth_date from client;

-- Renomear o nome do campo

select name as "Nome", birth_date as "Data de Nascimento" from client;

-- Selecionar concatenado

select "CPF: " || cpf || "RG: " || rg from client;

-- Selecionar com limite

select * from client limit 10;

-- Selecionar com condicional

select birth_date as "Data de Nascimento" from client where birth_date > '1998-01-01';

select name from client where name like 'L%';

select name, birth_date from client where birth_date between '1990-01-01' and '2000-01-01';

select name, rg from client where rg is null;

select name from client order by name asc;

select name from client order by name desc;

-- Exercício

select name, gender, profession from client order by name desc;

select name from client where name like '%r%';

select name from client where name like 'C%';

select name from client where name like '%a';

select neighborhood from client where neighborhood like 'Centro';

select complement from client where complement like 'A%';

select * from client where gender like 'F';

select * from client where cpf is null;

select name, profession from client order by profession asc;

select * from client where nationality like 'Brasileir%';

-- Update e Delete

update client set name = 'Lucas da Silva' where idclient = 1;

delete from client where idclient = 22;