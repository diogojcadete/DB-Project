#!/usr/bin/python3
import cgi
import psycopg2

form = cgi.FieldStorage()

cust_no = form.getvalue('c_cust_no')
cust_name = form.getvalue('c_name')
cust_email = form.getvalue('c_email')
cust_phone = form.getvalue('c_phone')
cust_address = form.getvalue('c_address')

db_name = "ist1102477"
ist_id = "ist1102477"
password = "lvbq7532"
host = "db.tecnico.ulisboa.pt"
port = "5432"
dsn = ('host={} port={} user={} password={} dbname={}'.format(host, port, ist_id, password, db_name))

print('Content-type:text/html\n\n')
print('<html>')
print('<head>')
print('<title>Lab 09</title>')
print('</head>')
print('<body>')

connection = None

try:

    # Creating connection
    connection = psycopg2.connect(dsn)
    print('<p>Connected<p>')
    cursor = connection.cursor()

    cursor.execute('INSERT INTO customer VALUES (%s, %s, %s, %s, %s)', (cust_no,cust_name,cust_email,cust_phone,cust_address))

    connection.commit()
    print("<h1>Customer registered with success!</h1>")

    cursor.close()

except Exception as exp:
    # Print errors on the webpage if they occur
    print('<h1>An error occurred.</h1>')
    print('<p>{}</p>'.format(exp))
finally:
    if connection is not None:
        connection.close()
print('</body>')
print('</html>')