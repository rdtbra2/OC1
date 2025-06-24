/*
 *
 * Programa: CarrosEurope.sas
 * Autor: Reinaldo
 * Data: 24/06/2025
 * Módulo: Geral
 * Versão: 1.00
 * 
 */
data CarrosEuropa;
	set sashelp.cars;

	if origin='Europe';
run;