DATABASE stores
MAIN
define rec record
	ckz like bridge.ckz,
	porc like bridge.porc
end record
define l_ckz like bridge.ckz
define message_text char(100)

let l_ckz = "lookfor"

menu "Test"
	command "Pure SQL"
		whenever error continue
		select
			bridge.ckz,
			bridge.porc
		into
			rec.ckz,
			rec.porc
		from bridge
		where
		bridge.ckz = l_ckz
		whenever error stop
		let message_text = "Pure SQL code:",sqlca.sqlcode using "-<<<<<<&","!"
		DISPLAY message_text
		
	command "SQL ...END SQL"
		whenever error continue
		SQL
		select
			bridge.ckz,
			bridge.porc
		into
			$rec.ckz,
			$rec.porc
		from bridge
		where
		bridge.ckz = $l_ckz
		END SQL
		whenever error stop
		let message_text = "SQL code:",sqlca.sqlcode using "-<<<<<<&","!"
		DISPLAY message_text
	
	command "Exit"
		exit menu
	
end menu
END MAIN
