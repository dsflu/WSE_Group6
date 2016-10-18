-- Group [Group]
create table "information_schema"."group" (
   "oid_group"  int4  not null,
   "groupname"  varchar(255),
  primary key ("oid_group")
);


-- Module [Module]
create table "information_schema"."module" (
   "oid_module"  int4  not null,
   "moduleid"  varchar(255),
   "modulename"  varchar(255),
  primary key ("oid_module")
);


-- User [User]
create table "information_schema"."user" (
   "oid_user"  int4  not null,
   "username"  varchar(255),
   "password"  varchar(255),
   "name"  varchar(255),
   "payment_information"  varchar(255),
   "birthdate"  date,
  primary key ("oid_user")
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "information_schema"."group"  add column  "module_oid_module"  int4;
alter table "information_schema"."group"   add constraint fk_group_module foreign key ("module_oid_module") references "information_schema"."module" ("oid_module");


-- Group_Module [Group2Module_Module2Group]
create table "information_schema"."group_module" (
   "group_oid_group"  int4 not null,
   "module_oid_module"  int4 not null,
  primary key ("group_oid_group", "module_oid_module")
);
alter table "information_schema"."group_module"   add constraint fk_group_module_group foreign key ("group_oid_group") references "information_schema"."group" ("oid_group");
alter table "information_schema"."group_module"   add constraint fk_group_module_module foreign key ("module_oid_module") references "information_schema"."module" ("oid_module");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "information_schema"."user"  add column  "group_oid_group"  int4;
alter table "information_schema"."user"   add constraint fk_user_group foreign key ("group_oid_group") references "information_schema"."group" ("oid_group");


-- User_Group [User2Group_Group2User]
create table "information_schema"."user_group" (
   "user_oid_user"  int4 not null,
   "group_oid_group"  int4 not null,
  primary key ("user_oid_user", "group_oid_group")
);
alter table "information_schema"."user_group"   add constraint fk_user_group_user foreign key ("user_oid_user") references "information_schema"."user" ("oid_user");
alter table "information_schema"."user_group"   add constraint fk_user_group_group foreign key ("group_oid_group") references "information_schema"."group" ("oid_group");


