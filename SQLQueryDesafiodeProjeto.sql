select * from Atores
select * from Filmes
select * from Generos
select * from FilmesGenero
select * from ElencoFilme

--1-Buscar o nome e ano dos filmes

select
	Nome,
	Ano
from Filmes

--2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano

select
	nome,
	ano,
	Duracao
from Filmes
order by ano 

--3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
select 
	nome,
	ano,
	duracao
from Filmes
Where nome = 'De volta para o futuro'

--4 - Buscar os filmes lançados em 1997
select * from Filmes
where ano = 1997

--5 - Buscar os filmes lançados APÓS o ano 2000

select * from Filmes
where ano > 2000

--6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
select * from Filmes
where Duracao > 100 and Duracao < 150
order by Duracao

--7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
select Ano,
	count(*) as Quantidade
from Filmes
group by ano
order by Quantidade desc

--8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
select 
    Id,
	PrimeiroNome,
	UltimoNome,
	Genero
from Atores 
where Genero = 'M'

--9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome

select 
	Id,
	PrimeiroNome,
	UltimoNome, 
	Genero
from Atores
where genero = 'F'
order by PrimeiroNome

--10-Buscar o nome do filme e o gênero

select
	f.Nome as Nome,
	g.Genero as Genero
from Filmes f
inner join FilmesGenero fg 
on f.Id = fg.IdFilme
inner join Generos g on fg.IdGenero = g.Id

--11 - Buscar o nome do filme e o gênero do tipo "Mistério"
select
	f.Nome as Nome,
	g.Genero as Genero
from Filmes f
inner join FilmesGenero fg 
on f.Id = fg.IdFilme
inner join Generos g on fg.IdGenero = g.Id
where Genero = 'Mistério'

--12- Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel

select
	f.Nome,
	a.PrimeiroNome,
	a.UltimoNome,
	ef.Papel
from Filmes f 
inner join ElencoFilme ef on f.id = ef.idFilme
inner join Atores a on a.Id = ef.IdAtor