# osx-bootstrap

Script and ansible playbook to set up my my brew packets and bashrc, it's designed to be executed in local under OsX. 

# Role variables

- `bashrc_tokenfile`: File where you store your API tokens or any export that are not on .bashrc, the default value points to `~/.bash_apitokens`.
- `bashrc_java_environment`: Add alias `setjdk` to change envioronment from one version to another. Example: `setjdk 1.7` points JAVA_HOME to the correct version if you have it installed.
- `bashrc_sexy_bash_prompt`: Install sexy bash prompt. Default `true`.

- `homebrew_packages`: List of homebrew packages to install. Make sure you include `brew-cask`.
- `homebrew_cask_packages`: List of homebrew cask packages to install.

## Group vars

Here I set up packages to be installed, in my case just macbookpro, but you can make different groups here for different packages configurations.

Then in host files you can select the group for localhost. For example, you can make a macbookpro and an imac file with different packages.

- example `hosts`:

```
[macbookpro]
localhost
```

- example `group_vars/macbookpro`:

```yaml
---
homebrew_packages:
  - name: brew-cask
  - name: nmap
  - name: vim
    install_options: with-lua
  - name: lua
  - name: ctags
  - name: pandoc
  - name: wget
    install_options: enable-iri
  - name: ssh-copy-id
  - name: xhyve

homebrew_cask_packages:
  - vagrant
  - dropbox
  - evernote
  - google-chrome
  - sublime-text3
  - iterm2
  - virtualbox
  - vagrant
  - skype
  - vlc
  - java
  - the-unarchiver
```

## Usage

The `osx-bootstrap.sh` will check for requirements and execute `ansible-playbook main.yml`. You can use to upgrade packages, since the rest of the configuration wont be changed (except upgrades, the rest is idempotent).

Homebrew cask options points appdir to `/Applications`, that way you will see links on Applications inside Finder.

```bash

$ ./osx-bootstrap.sh


PLAY ***************************************************************************

TASK [homebrew : make sure brew tap items present] *****************************
ok: [localhost] => (item=caskroom/cask)
ok: [localhost] => (item=caskroom/versions)
ok: [localhost] => (item=homebrew/versions)
ok: [localhost] => (item=homebrew/binary)

TASK [homebrew : Update and Upgrade all] ***************************************
changed: [localhost]

TASK [homebrew : Install packages] *********************************************
ok: [localhost] => (item={u'name': u'brew-cask'})
ok: [localhost] => (item={u'name': u'nmap'})
ok: [localhost] => (item={u'install_options': u'with-lua', u'name': u'vim'})
ok: [localhost] => (item={u'name': u'lua'})
ok: [localhost] => (item={u'name': u'ctags'})
ok: [localhost] => (item={u'name': u'pandoc'})
ok: [localhost] => (item={u'install_options': u'enable-iri', u'name': u'wget'})
ok: [localhost] => (item={u'name': u'ncdu'})
ok: [localhost] => (item={u'name': u'ssh-copy-id'})
ok: [localhost] => (item={u'name': u'xhyve'})
ok: [localhost] => (item={u'name': u'node'})
ok: [localhost] => (item={u'name': u'go'})
ok: [localhost] => (item={u'name': u'sbt'})
ok: [localhost] => (item={u'name': u'awscli'})

TASK [homebrew-cask : Install] *************************************************
ok: [localhost] => (item=vagrant)
ok: [localhost] => (item=vlc)
ok: [localhost] => (item=skype)
ok: [localhost] => (item=the-unarchiver)
ok: [localhost] => (item=iterm2)

TASK [bashrc : check if bash_prompt exist already] *****************************
ok: [localhost]

TASK [bashrc : Sexy bash prompt repository] ************************************
skipping: [localhost]

TASK [bashrc : Install sexy-bash-promph] ***************************************
skipping: [localhost]

TASK [bashrc : Delete temp files if they exist] ********************************
ok: [localhost]

TASK [bashrc : Generate ~/.bashrc] *********************************************
ok: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=7    changed=1    unreachable=0    failed=0

```
