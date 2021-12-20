import cx_Oracle
import psycopg2
from psycopg2.extras import NamedTupleCursor

connection_settings = {
    'host': 'edp.testing.bss.loc',
    'port': 5432,
    'dbname': 'notifier',
    'user': 'notifier',
    'password': 'nono',
}
pg_conn = psycopg2.connect(**connection_settings)
pg_cursor = pg_conn.cursor(cursor_factory=NamedTupleCursor)

pg_cursor.execute('select * from databases')
for pg_row in pg_cursor.fetchall():
    print(pg_row)
    dsn_tns = cx_Oracle.makedsn(pg_row.host, pg_row.port, service_name=pg_row.service_name)
    ora_conn = cx_Oracle.connect(user=pg_row.username, password=pg_row.password, dsn=dsn_tns, encoding='utf8')
    ora_cursor = ora_conn.cursor()

    ora_cursor.execute('select city_support.get_current_region_id() from dual')
    print(ora_cursor.fetchone())

    ora_cursor.close()
    ora_conn.close()

pg_cursor.close()
pg_conn.close()
