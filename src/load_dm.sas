/*
 *
 * Programa: load_dm.sas
 * Autor: Reinaldo
 * Data: 25/06/2025
 * M�dulo: Carga de dados
 * Vers�o: 1.00
 * 
 */
%include "/opt/sas/Workshop/Git/OC1/macro/macrovars.sas";
%include "&caminho/src/libraries.sas";
%include "&caminho/macro/importar_dados.sas";

%importar_dados(vendas, vendas)
%importar_dados(produtos, produtos)
%importar_dados(deptos, deptos)
%importar_dados(grupos, grupos)
%importar_dados(cores, cores)
%importar_dados(tamanhos, tamanhos)
%importar_dados(estados, estados)
%importar_dados(regioes, Regi�es)

%include "&caminho/src/clear_libs.sas";
