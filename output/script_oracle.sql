connect sys/Student1@OrionStar as sysdba;
create user OC1 identified by Student1;
grant dba to OC1;
connect oc1/Student1@OrionStar;

create table vendas (CodProduto integer, CodCor  integer, CodTamanho integer, CodEstado integer, DataVenda date, qtdevendida integer);
create or replace procedure prc_ins_vendas(p_num_linhas in number) is
  v_data_ini date := to_date('01/01/2020','dd/mm/yyyy');
  v_data_fim date := to_date('31/12/2023','dd/mm/yyyy');
  v_dias number := v_data_fim - v_data_ini;
begin
  for i in 1 .. p_num_linhas loop
    insert into vendas (
      codproduto,
      codcor,
      codtamanho,
      codestado,
      datavenda,
      qtdevendida
    ) values (
      trunc(dbms_random.value(1, 33)),         -- 1 a 32
      trunc(dbms_random.value(1, 29)),         -- 1 a 28
      trunc(dbms_random.value(1, 5)),          -- 1 a 4
      trunc(dbms_random.value(1, 28)),         -- 1 a 27
      trunc(v_data_ini + trunc(dbms_random.value(0, v_dias))),  -- data aleatória
      trunc(dbms_random.value(1, 11))          -- 1 a 10
    );
  end loop;
  commit;
end;
/




exec dbms_monitor.session_trace_enable(session_id => 326, serial_num => 60753, waits => true, binds => true);
exec dbms_monitor.session_trace_disable(session_id => 326, serial_num => 60753);