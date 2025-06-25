/*
 *
 * Programa: VendasProdutos.sas
 * Autor: Reinaldo
 * Data: 25/06/2025
 * M�dulo: Prepera��o de Dados
 * Vers�o: 1.00
 * 
 */

%include "/opt/sas/Workshop/Git/OC1/macro/macrovars.sas";
%include "&caminho/src/libraries.sas";

proc sort data=sicoob.vendas out=work.vendas_produto;
	by CodProduto;
run;

/* Descobrimos que existem muitas linhas missing = Eliminar */
data work.produtos_corr;
	set sicoob.produtos;
	where CodProduto is not missing;
run;

proc sort data=work.produtos_corr out=work.produtos_produto;
	by CodProduto;
run;

data sicoobsp.VendasProduto;
	merge work.vendas_produto work.produtos_produto;
	by CodProduto;
run;