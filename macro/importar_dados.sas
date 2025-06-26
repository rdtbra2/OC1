/*
 *
 * Programa: importar_dados.sas
 * Autor: Reinaldo
 * Data: 26/06/2025
 * Módulo: Macros
 * Versão: 1.00
 * 
 */

%macro importar_dados(tabela, planilha);
	proc import datafile="&caminho/output/DM1.xlsx" dbms=xlsx 
		out=sicoob.&tabela replace;
		sheet="&planilha";
	run;
%mend importar_dados;