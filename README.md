sm
==


sm is a simple mail sender that uses, by default, Google’s SMTP
servers. It reads an `smrc` file that contains the configuration
options. It reads `/etc/smrc`, `/usr/local/etc/smrc`, and
`$HOME/.smrc`, in that order.

It uses [nix-shell](http://nixos.org/nix/manual/) underneath, to
ensure that all the dependencies are met, prior to running the
program.


Configuration
-------------

The following snippet contains a basic `smrc` configuration:

```
SERVER=smtp.gmail.com
PORT=587
USERNAME=user@domain.com
NAME="Foo Bar"
PASSWORD=mysupersecretpassword
FROM=user@domain.com
```

The `smrc` file must be stored securly. Ideally, it must at least be
on an FDE-disk with the proper filesystem permissions.

If an account uses two-factor authentication, use the
[App password](https://security.google.com/settings/security/apppasswords)
in the `PASSWORD` field, instead of the main account password.


Usage
-----

To send a mail to `user@domain.com`, with the subject `Hi!`, and with
the message `Hello, there!`:
```bash
sm --to user@domain.com --subject "Hi!" --message "Hello, there!"
```

To send a mail to `user@domain.com`, and
`anotheruser@anotherdomain.com`, with the subject `Hi!`, attaching the
file `hello.html`:
```bash
sm --to user@domain,anotheruser@anotherdomain.com --subject "Hi!" --attach hello.html
```

To send a mail to a list of users, contained in `list.txt`, with each
recipient separated with a newline, and with a file attachment `hello.html`:
```bash
sm --list list.txt --subject "Hi!" --attach hello.html
```

To display help:
```bash
sm --help
```
