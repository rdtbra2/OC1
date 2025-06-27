/*
 *
 * Programa: copiar_dados_para_oracle.sas
 * Autor: Reinaldo
 * Data: 27/06/2025
 * Módulo: Geral
 * Versão: 1.00
 * 
 */

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
