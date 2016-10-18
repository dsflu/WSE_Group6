-- Group [Group]
create table "public"."group" (
   "oid_group"  int4  not null,
   "groupname"  varchar(255),
  primary key ("oid_group")
);


-- Module [Module]
create table "public"."module" (
   "oid_module"  int4  not null,
   "moduleid"  varchar(255),
   "modulename"  varchar(255),
  primary key ("oid_module")
);


-- User [User]
create table "public"."user" (
   "oid_user"  int4  not null,
   "username"  varchar(255),
   "password"  varchar(255),
   "name"  varchar(255),
   "payment_information"  varchar(255),
   "birthdate"  date,
  primary key ("oid_user")
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "public"."group"  add column  "module_oid_module"  int4;
alter table "public"."group"   add constraint fk_group_module foreign key ("module_oid_module") references "public"."module" ("oid_module");


-- Group_Module [Group2Module_Module2Group]
create table "public"."group_module" (
   "group_oid_group"  int4 not null,
   "module_oid_module"  int4 not null,
  primary key ("group_oid_group", "module_oid_module")
);
alter table "public"."group_module"   add constraint fk_group_module_group foreign key ("group_oid_group") references "public"."group" ("oid_group");
alter table "public"."group_module"   add constraint fk_group_module_module foreign key ("module_oid_module") references "public"."module" ("oid_module");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "public"."user"  add column  "group_oid_group"  int4;
alter table "public"."user"   add constraint fk_user_group foreign key ("group_oid_group") references "public"."group" ("oid_group");


-- User_Group [User2Group_Group2User]
create table "public"."user_group" (
   "user_oid_user"  int4 not null,
   "group_oid_group"  int4 not null,
  primary key ("user_oid_user", "group_oid_group")
);
alter table "public"."user_group"   add constraint fk_user_group_user foreign key ("user_oid_user") references "public"."user" ("oid_user");
alter table "public"."user_group"   add constraint fk_user_group_group foreign key ("group_oid_group") references "public"."group" ("oid_group");


