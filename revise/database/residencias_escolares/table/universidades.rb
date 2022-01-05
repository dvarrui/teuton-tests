
group "Database and table universidades" do

  dbname = 'db_residencias_escolares'
  target "Create database #{dbname}"
  run "mysql -u root -e \"show databases;\""
  expect_one dbname

  tbname = 'universidades'
  target "Create table #{tbname}"
  run "mysql -u root -e \"use #{dbname}; show tables;\""
  expect_one tbname

  fname = 'cod_universidad'
  target "Verify field #{fname}"
  run "mysql -u root -e \"use #{dbname}; desc #{tbname};\""
  expect_one [ fname, 'char(6)', 'NO', 'PRI' ]

  fname = 'nom_universidad'
  target "Verify field #{fname}"
  run "mysql -u root -e \"use #{dbname}; desc #{tbname};\""
  expect_one [ fname, 'varchar(30)', 'YES', 'La Laguna' ]
end
