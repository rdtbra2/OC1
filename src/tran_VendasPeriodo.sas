/*
 *
 * Programa: tran_VendasPeriodo.sas
 * Autor: Reinaldo
 * Data: 25/06/2025
 * Módulo: Preperação de Dados
 * Versão: 1.00
 * 
 */

%include "/opt/sas/Workshop/Git/OC1/macro/macrovars.sas";
%include "&caminho/src/libraries.sas";

proc sql;
	create table sicoobsp.VendasPeriodo as
	select a.codproduto, b.descricao, c.descricao as Grupo, 
           d.descricao as Depto, 
           e.descricao as Cor, f.descricao as Tamanho, 
		   g.Sigla, g.Nome as Estado, h.Nome as Regiao,
           a.datavenda, a.qtdevendida, 
           b.precounitario, 
		   a.qtdevendida*b.precounitario as TotalVenda,
		   g.percimposto format=percent6.2, 
		   a.qtdevendida*b.precounitario*g.percimposto as TotalImposto
	  from oc1.vendas a
	 inner join oc1.produtos b
        on b.codproduto = a.codproduto
     inner join oc1.grupos c
        on c.codgrupo = b.codgrupo
     inner join oc1.deptos d
        on d.coddepto = b.coddepto
     inner join oc1.cores e
        on e.codcor = a.codcor
     inner join oc1.tamanhos f
        on f.codtamanho = a.codtamanho
     inner join oc1.estados g
        on g.codestado = a.codestado
     inner join oc1.regioes h
        on h.codregiao = g.codregiao
;
quit;

%include "&caminho/src/clear_libs.sas";

data oc1.produtos;
	set sicoob.produtos;
run;

data oc1.cores;
	set sicoob.cores;
run;

data oc1.tamanhos;
	set sicoob.tamanhos;
run;

data oc1.deptos;
	set sicoob.deptos;
run;

data oc1.grupos;
	set sicoob.grupos;
run;

data oc1.estados;
	set sicoob.estados;
run;

data oc1.regioes;
	set sicoob.regioes;
run;

proc sql;
	connect to oracle (path='OrionStar' user='oc1' 
		password='Student1'); 
	select count(*) from connection to oracle(
	create index ix_produtos on produtos(codproduto));
	disconnect from oracle;
quit;