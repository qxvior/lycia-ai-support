DATABASE stores
MAIN
DEFINE t_group CHAR(20)
	CREATE TEMP TABLE group(
	group char(20)
	);
	
	INSERT INTO group VALUES("group")
	SELECT group INTO t_group FROM group
	DISPLAY t_group
END MAIN