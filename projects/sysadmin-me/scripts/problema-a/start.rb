
group "Problema A" do
  target "Crear el usuario alumno"
  run "id alumno"
  expect_one "alumno"
end

play do
  show
  export
end
