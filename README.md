### Mail server configuration

https://www.digitalocean.com/community/tutorials/how-to-configure-a-mail-server-using-postfix-dovecot-mysql-and-spamassasin

To use uuid as mail home set `driver` of `userdb` to `sql` and `args` to
`/etc/dovecot/dovecot-sql.conf.ext` in `/etc/dovecot/conf.d/auth-sql.conf.ext`.
Then set `user_query` in `/etc/dovecot/dovecot-sql.conf.ext` to

```
user_query = SELECT CONCAT('maildir:/var/mail/', uuid) AS mail, CONCAT('/var/mail/', uuid) AS home, 5000 AS uid, 5000 AS gid FROM users WHERE email='%u';
```
