# Mac Software Install Ansible Playbook

## XXX README IS NOT COMPLETE YET XXX

Ansible playbook to install a preconfigured set of software on a Mac.

It is based heavily on [Jeff Geerling](http://www.jeffgeerling.com/)'s
[mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook). 

The main change is that it focuses solely on installing software packages and doesn't do 
extra things like installing dotfiles.

## Installation

  1. Install XCode.  Easiest way to do this is to run git -- the system will prompt to install XCode.
  1. Run the `bootstrap.sh` script which bootstraps the system to have Ansible.
  1. Run `$ ansible-galaxy install -r requirements.yml` inside this directory to install required Ansible roles.
  1. Run `ansible-playbook main.yml -i inventory -K` inside this directory. Enter your account password when prompted.

> Note: If some Homebrew commands fail, you might need to agree to XCode's license or fix some other Brew issue. Run `brew doctor` to see if this is the case.

## Overriding Defaults

Not everyone's development environment and preferred software configuration is the same.

You can override any of the defaults configured in `default.config.yml` by creating a `config.yml` file and setting the overrides in that file. For example, you can customize the installed packages and apps with something like:

    homebrew_installed_packages:
      - cowsay
      - git
      - go

    mas_installed_apps:
      - { id: 443987910, name: "1Password" }
      - { id: 498486288, name: "Quick Resizer" }
      - { id: 557168941, name: "Tweetbot" }
      - { id: 497799835, name: "Xcode" }

Any variable can be overridden in `config.yml`; see the supporting roles' documentation for a complete list of available variables.

### Things that still need to be done manually

XXX REVIEW

It's my hope that I can get the rest of these things wrapped up into Ansible playbooks soon, but for now, these steps need to be completed manually (assuming you already have Xcode and Ansible installed, and have run this playbook).

  1. Install all the apps that aren't yet in this setup (see below).
  1. Remap Caps Lock to Escape (requires macOS Sierra 10.12.1+).
  1. Set trackpad tracking rate.
  1. Set mouse tracking rate.
  1. Configure extra Mail and/or Calendar accounts (e.g. Google, Exchange, etc.).

## Testing the Playbook

[Jeff Geerling](http://www.jeffgeerling.com/) has provided instructions on how to make a 
[Mac OS X VirtualBox VM](https://github.com/geerlingguy/mac-osx-virtualbox-vm) for testing.
I use the snapshot feature in VirtualBox to allow resetting the VM to a pristine state easily.

## Author

[Jon Dugan](http://x1024.net/), 2017 based on [mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook).
