Setup Shell
=========

This role will setup your shell if your using a *nix like system.

Requirements
------------

python3, python3-debian,  pip3, along with ansible-core will need to be installed on the laptop for this to work. In order to do this you will need to install the following:

```shell
	sudo apt install -y python3 python3-debian python3-pip
	pip install ansible-core

```
If zsh shell isn't working properly, then you might need to reboot the system. If the changes don't work AFTER a proper full reboot then open an issue and I'll investigate the issue.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: localhost
      roles:
         - role: setup-shell

License
-------

MIT

Author Information
------------------

Reuben devries
https://github.com/reubendevries

All issues can be opened [here](https://github.com/reubendevries/setup-shell/issues)
