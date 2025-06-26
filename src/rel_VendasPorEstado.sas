/*
 *
 * Programa: rel_VendasPorEstado.sas
 * Autor: Reinaldo
 * Data: 26/06/2025
 * Módulo: Relatórios
 * Versão: 1.00
 * 
 */

%include "/opt/sas/Workshop/Git/OC1/macro/macrovars.sas";
%include "&caminho/src/libraries.sas";
%include "&caminho/macro/limitesimposto.sas";
%include "&caminho/macro/mrel_VendasEstado.sas";

%EstadoComMenorImposto
%EstadoComMaiorImposto

%mrel_VendasEstado(&est_max_pi)
%mrel_VendasEstado(&est_min_pi)