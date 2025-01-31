MAIN
 DEFINE imp_abs DECIMAL(9,2)
 DEFINE imp_ano  DECIMAL(8,2)

	LET imp_ano = "-25.123"
	DISPLAY imp_ano
	CALL abs(imp_ano) RETURNING imp_abs
	DISPLAY imp_abs
END MAIN

FUNCTION abs(valor)
    DEFINE valor DECIMAL(8,2)
    LET valor = valor +1
    RETURN valor
END FUNCTION