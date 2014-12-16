INSERT INTO sami.pais VALUES (1,0,'AR','ARG.',true,'Argentinos','Argentina');
select setval('sami.seq_pais', 1, true);

INSERT INTO sami.provincia VALUES (1,0,'ER','Entre Rios',1);
select setval('sami.seq_provincia', 1, true);

INSERT INTO sami.localidad VALUES (1,0,'CDELU',true,'3260','Conccepcion del Uruguay',1);
select setval('sami.seq_localidad', 1, true);

INSERT INTO sami.tipo_documento VALUES (1,0,'DNI',true,'DNI','Doc. Nac. Identidad','Registro Civil','Doc. Nac. Identidad',1,1);
select setval('sami.seq_tipo_documento', 1, true);

INSERT INTO sami.estado_civil VALUES (1,0,'Solterazo');
select setval('sami.seq_estado_civil', 1, true);

INSERT INTO sami.persona VALUES (1,0,'Migueles','Piedras 13','3260',20666666666,'Villaguay',1,1,1,'Matute',66666666,13,true,0,'SINRAZON',1);
select setval('sami.seq_persona', 1, true);
--insert into sami.usuario values (1,0,false,false,true,'',false,1,'Usuario1');
--insert into sami.usuario values (2,0,false,false,true,'',false,1,'Usuario2');

insert into sami.concepto_caja values(1,0,true,'EFE','EFECTIVO','EFECTIVO');
select setval('sami.seq_concepto_caja', 1, true);

insert into sami.obra_social values(1,0,true,'OS100',20282094712,'OS100',1,'');
select setval('sami.seq_obra_social', 1, true);

insert into sami.plan values(1,0,true,'F100','F100',1,'');
select setval('sami.seq_plan', 1, true);

INSERT INTO sami.rol (id, version, authority) VALUES (1, 0, 'ROLE_ADMIN');
INSERT INTO sami.rol (id, version, authority) VALUES (2, 0, 'ROLE_USER');
select setval('sami.seq_rol', 2, true);

INSERT INTO sami.usuario (id, version, account_expired, account_locked, enabled, password, password_expired, username) VALUES (2, 0, false, false, true, '', false, 'Usuario');
INSERT INTO sami.usuario (id, version, account_expired, account_locked, enabled, password, password_expired, username) VALUES (1, 0, false, false, true, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', false, 'admin');
select setval('sami.seq_usuario', 2, true);

INSERT INTO sami.usuario_rol (rol_id, usuario_id) VALUES (1, 1);
INSERT INTO sami.usuario_rol (rol_id, usuario_id) VALUES (2, 2);
--select setval('sami.seq_usuario_rol', 2, true);