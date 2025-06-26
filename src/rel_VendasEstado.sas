/*
 *
 * Programa: rel_VendasEstado.sas
 * Autor: Reinaldo
 * Data: 26/06/2025
 * Módulo: Relatórios
 * Versão: 1.00
 * 
 */

%include "/opt/sas/Workshop/Git/OC1/macro/macrovars.sas";
%include "&caminho/src/libraries.sas";

proc sql;
	select estado, sum(qtdevendida) as TotalQuantidade format=comma12., 
		   sum(TotalVenda) as TotalVenda format=dollarx16.2, 
           sum(TotalImposto) as TotalImposto format=dollarx16.2,
		   sum(TotalVenda)-sum(TotalImposto) as LucroTotal format=dollarx16.2
	  from sicoobsp.VendasPeriodo
	 group by estado
	 order by TotalVenda desc;
quit;

%include "&caminho/src/clear_libs.sas";