/*
 *
 * Programa: limitesimposto.sas
 * Autor: Reinaldo
 * Data: 26/06/2025
 * Módulo: Fiscal
 * Versão: 1.00
 * 
 */
%global est_max_pi est_min_pi;

%macro EstadoComMaiorImposto;
	proc sql noprint;
		select max(percimposto)
		  into :max_pi
		  from sicoob.estados;
		select sigla
		  into :est_max_pi
		  from sicoob.estados
		where percimposto = &max_pi;
	run;
%mend EstadoComMaiorImposto;

%macro EstadoComMenorImposto;
	proc sql noprint;
		select min(percimposto)
		  into :min_pi
		  from sicoob.estados;
		select sigla
		  into :est_min_pi
		  from sicoob.estados
		where percimposto = &min_pi;
	run;
%mend EstadoComMenorImposto;
