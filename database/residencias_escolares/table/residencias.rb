
group "Table residencias" do

  dbname = 'db_residencias_escolares'
  tbname = 'residencias'
  target "Create table #{tbname}"
  run "mysql -u root -e \"use #{dbname}; show tables;\""
  expect_one tbname

  fname = 'cod_residencia'
  target "Verify field #{fname}"
  run "mysql -u root -e \"use #{dbname}; desc #{tbname};\""
  expect_one [ fname, 'int(11)', 'NO', 'PRI', 'NULL', 'auto_increment' ]

  fname = 'nom_residencia'
  target "Verify field #{fname}"
  run "mysql -u root -e \"use #{dbname}; desc #{tbname};\""
  expect_one [ fname, 'varchar(30)', 'YES', 'NULL' ]

  fname = 'cod_universidad'
  target "Verify field #{fname}"
  run "mysql -u root -e \"use #{dbname}; desc #{tbname};\""
  expect_one [ fname, 'char(6)', 'YES', 'MUL', 'NULL' ]

  fname = 'precio_mensual'
  target "Verify field #{fname}"
  run "mysql -u root -e \"use #{dbname}; desc #{tbname};\""
  expect_one [ fname, 'int(11)', 'YES', '900' ]

  fname = 'comedor'
  target "Verify field #{fname}"
  run "mysql -u root -e \"use #{dbname}; desc #{tbname};\""
  expect_one [ fname, 'tinyint(1)', 'YES', '0' ]
end
