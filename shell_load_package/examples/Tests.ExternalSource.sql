
create table t (i integer);

copy t with source ExternalSource(cmd='seq 1 10') no commit;
select * from t;
rollback;

copy t with source ExternalSource(cmd='exit 7') no commit;

copy t with source ExternalSource(cmd='echo "message on stderr" >&2') no commit;

drop table t;
