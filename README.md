# osx-bootstrap

## Group vars

Here I set up packages to be installed, in my case just macbookpro, but you can make different grups here for different packages configurations. Then in host files you can select the group for localhost

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

``

## Usage

```bash
ansible-playbook main.yml


PLAY ***************************************************************************

TASK [homebrew : make sure brew tap items present] *****************************
ok: [localhost] => (item=caskroom/cask)
ok: [localhost] => (item=caskroom/versions)
ok: [localhost] => (item=homebrew/versions)
ok: [localhost] => (item=homebrew/binary)

TASK [homebrew : Update and Upgrade all] ***************************************
ok: [localhost]

TASK [homebrew : Install packages] *********************************************
ok: [localhost] => (item={u'name': u'brew-cask'})
ok: [localhost] => (item={u'name': u'nmap'})
ok: [localhost] => (item={u'install_options': u'with-lua', u'name': u'vim'})
ok: [localhost] => (item={u'name': u'lua'})
ok: [localhost] => (item={u'name': u'ctags'})
ok: [localhost] => (item={u'name': u'pandoc'})
ok: [localhost] => (item={u'install_options': u'enable-iri', u'name': u'wget'})
ok: [localhost] => (item={u'name': u'ssh-copy-id'})
ok: [localhost] => (item={u'name': u'xhyve'})

TASK [homebrew-cask : Install] *************************************************
ok: [localhost] => (item=vagrant)

PLAY RECAP *********************************************************************
localhost                  : ok=4    changed=0    unreachable=0    failed=0

```
