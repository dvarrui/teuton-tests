group "Database Scheme" do

  target "Create database #{get(:dbname)}"
  run "mysql -u root -e \"show databases;\"", on: :host1
  expect_one get(:dbname)

  target "Create table #{get(:tbname)}"
  run "mysql -u root -e \"use #{get(:dbname)}; show tables;\"", on: :host1
  expect_one get(:tbname)

  target "Verify ID field"
  run "mysql -u root -e \"use #{get(:dbname)}; desc #{get(:tbname)};\"", on: :host1
  expect_one [ 'ID', 'int(11)', 'NO', 'PRI', 'NULL', 'auto_increment' ]

  target "Verify NAME field"
  run "mysql -u root -e \"use #{get(:dbname)}; desc #{get(:tbname)};\"", on: :host1
  expect_one [ 'NAME', 'varchar(30)', 'YES' ]
end
