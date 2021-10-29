--Data Access--
create role BookRole NOT IDENTIFIED;
GRANT SELECT ON vBookStatus to BookRole;

select * from SYS.vBookStatus;