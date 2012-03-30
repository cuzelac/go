go/
=======
a simple server to manage shortcuts

create a link
-----

curl --data "shortcut=my-first-link&target=http://github.com" localhost:3000/links.json

test it out
-----
localhost:3000/my-first-link

That will redirect you to http://github.com
