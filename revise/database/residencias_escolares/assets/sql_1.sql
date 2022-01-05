-- Base de Datos Residencias Escolares

-- Creación de base de datos

create database bdResidenciasEscolares;
use bdResidenciasEscolares;

create table universidades ( codUniversidad char(6),
							 nomUniversidad varchar(30) default "La Laguna" ,
							 constraint pk_uni primary key(codUniversidad));
							 


create table residencias ( codResidencia int AUTO_INCREMENT,
						   nomResidencia varchar(30),
						   codUniversidad char(6),
						   precioMensual int default 900,
						   comedor boolean default 0,
						   constraint pk_resi primary key(codResidencia),
						   constraint fk_uni foreign key(codUniversidad) references universidades(codUniversidad) );
						   
						   
create table estudiantes ( codEstudiante int,
			               nomEstudiante varchar(50),
						   dni char(9),
						   telefornoEstudiante char(9),
						   constraint pk_estu primary key(codEstudiante),
						   constraint u_dni unique(dni),
						   constraint u_telfEstu unique(telefornoEstudiante));
						   
create table estancias ( codEstudiante int,
					     codResidencia int,
						 fechaInicio date,
						 fechaFin date,
						 preciopagado int,
						 constraint ch_precio check( preciopagado > 0 ),
						 constraint pk_estancia primary key(codEstudiante, codResidencia, fechaInicio),
						 constraint fk_estu foreign key(codEstudiante) references estudiantes(codEstudiante),
						 constraint fk_resi foreign key(codResidencia) references residencias(codResidencia));

-- Insercciones 
						 
insert universidades values ( '000001', "uni1" ), ( '000002', "uni2" ), ( '000003', "uni3"), 
						    ( '000004', "uni4" ), ( '000005', "uni5" ), ( '000006', "uni6" );
							
insert residencias values ( NULL, "resi1", '000001', 500, 1 ), ( NULL, "resi2", '000002', default, DEFAULT ), (NULL, "resi3", '000003', 250, 0 ),
						  ( NULL, "resi4", '000004', 300, 1 ), ( NULL, "resi5", '000005', DEFAULT, 0 ), (NULL, "resi6", '000006', 100, DEFAULT );
						  
insert estudiantes values ( 1, "estu1", "100111222", "222111000" ), ( 2, "estu2", "200111223", "222111001" ), ( 3, "estu3", "300111224", "222111002" ),
						  ( 4, "estu4", "400111223", "232111005" ), ( 5, "estu5", "500111226", "222111005" ), ( 6, "estu6", "600111227", "222111008" );
						  
insert estancias values ( 1, 1, '1991-01-01', '1992-01-01', 50 ), ( 2, 1, '1991-02-01', '1992-01-01', 150 ), ( 3, 1, '1993-02-01', '1994-01-01', 200 ),
					    ( 4, 2, '1994-02-01', '1995-01-01', 150 ), ( 4, 1, '1996-02-01', '1997-01-01', 50 ), ( 6, 1, '1997-02-01', '1998-01-01', 50 ),
						( 3, 2, '1991-05-01', '1992-01-01', 50 ), ( 3, 3, '1992-04-01', '1992-06-01', 120 ), ( 3, 4, '1991-08-01', '1992-01-01', 135 ),
						( 4, 5, '1998-02-01', '1999-01-01', 500 );
						
-- Funciones y procedimentos

DELIMITER $$
create procedure sp_estuEstancias( IN dnic char(9) )

begin
	select residencias.nomResidencia, universidades.nomUniversidad,fechaInicio, fechaFin, preciopagado from estancias
	inner join residencias on residencias.codResidencia = estancias.codResidencia
	inner join estudiantes on estudiantes.codEstudiante = estancias.codEstudiante
	inner join universidades on universidades.codUniversidad = residencias.codUniversidad
	where dni like dnic
	order by fechaInicio;
end $$

DELIMITER ;

DELIMITER $$
create procedure sp_insertResidencia( IN pnombreResidencia varchar(30), IN pcodUniversidad char(6),
								   IN pprecioMensual int, IN pcomedor boolean, OUT uExiste boolean,
								   OUT resiInsertada boolean ) 
begin

	set resiInsertada = 0;
	IF exists (select codUniversidad from universidades where codUniversidad = pcodUniversidad) then
	
		set uExiste = 1;
		
		insert residencias values ( NULL, pnombreResidencia, pcodUniversidad, pprecioMensual,
									pcomedor );	
		set resiInsertada = 1;
									
	ELSE
			set uExiste = 0;
			set resiInsertada = 0;
	end if;
		
end $$

DELIMITER ;

DELIMITER $$
create procedure sp_cuentaResidencias ( IN pnomUniversidad varchar(30),
										IN pprecioMensual int,
										OUT cantResi int,
										OUT cantResiPrecio int )
										
begin
		select count(*) into cantResi from residencias 
		inner join universidades on universidades.codUniversidad = residencias.codUniversidad
		where nomUniversidad = pnomUniversidad;
		
		select count(*) into cantResiPrecio from residencias
		inner join universidades on universidades.codUniversidad = residencias.codUniversidad
		where nomUniversidad = pnomUniversidad and precioMensual < pprecioMensual;
end $$

DELIMITER ;

DELIMITER $$
create function fn_tiempoResidencias ( pdni char(9) )
RETURNS int
begin
	DECLARE meses int;
	
	select SUM(TIMESTAMPDIFF( MONTH, fechaInicio, fechaFin )) into meses from estancias
	inner join estudiantes on estudiantes.codEstudiante = estancias.codEstudiante
	where dni = pdni;
	
	
	return meses;
	
end $$

DELIMITER ;

-- Trigger

DELIMITER $$
create trigger tr_cambioFecha before insert on estancias 
FOR EACH ROW
begin
	DECLARE TMP date;
	IF (NEW.fechaInicio > NEW.fechaFin) then	
		SET TMP = NEW.fechaInicio;
		SET NEW.fechaInicio = NEW.fechaFin;
		SET NEW.fechaFin = TMP;
	end if;
end

$$
DELIMITER ;

DELIMITER $$
create trigger tr_cambioFechaUpdate before update on estancias
FOR EACH ROW
begin
	DECLARE TMP date;
	IF (NEW.fechaInicio > NEW.fechaFin) then	
		SET TMP = NEW.fechaInicio;
		SET NEW.fechaInicio = NEW.fechaFin;
		SET NEW.fechaFin = TMP;
	end if;
end

$$
DELIMITER ;

DELIMITER $$
create trigger tr_residenciaEscolar before insert on residencias
FOR EACH ROW
begin
	IF (NEW.precioMensual< 900 ) then
		signal sqlstate '45000' set message_text='El precio mensual debe ser superior a 900'; 
	end if;
end
$$

DELIMITER ;

DELIMITER $$
create trigger tr_residenciaEscolarUpdate before update on residencias
FOR EACH ROW
begin
	IF (NEW.precioMensual< 900 ) then
		signal sqlstate '45000' set message_text='El precio mensual debe ser superior a 900'; 
	end if;
end
$$

DELIMITER ;

DELIMITER $$
create trigger tr_protectUniversity before delete on universidades
FOR EACH ROW
begin
	signal sqlstate '45000' set message_text='No se puede eliminar ninguna universidad'; 
end
$$

DELIMITER ;

