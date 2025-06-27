sasfile sicoobsp.vendasperiodo load;
sasfile sicoobsp.vendasperiodo close;

data work.vendasperiodo;
	set sicoobsp.vendasperiodo;
	where year(datepart(datavenda)) = 2021 and totalvenda > 30;
run;