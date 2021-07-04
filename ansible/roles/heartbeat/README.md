# nephelaiio.heartbeat

An [ansible role](https://galaxy.ansible.com/nephelaiio/heartbeat) to install and configure heartbeat

## Role Variables

Please refer to the [defaults file](/defaults/main.yml) for an up to date list of input parameters.

## Dependencies

* [nephelaiio.elastic_repo](https://galaxy.ansible.com/nephelaiio/elastic_repo/)

Please review the [dependency configuration](/meta/main.yml) for more details

## Example Playbook

```
- hosts: servers
  vars:
    heartbeat_package_state: latest
    heartbeat_conf_manage: yes
  roles:
     - role: nephelaiio.heartbeat
```

## Example Playbook with config file

```
- hosts: servers
  vars:
    heartbeat_package_state: latest
    heartbeat_conf_path: /etc/ha.d/ha.cf
    heartbeat_haressources_path: /etc/ha.d/haresources
    heartbeat_authkey_path: /etc/ha.d/authkeys
    heartbeat_conf_file: "{{ config_files_dir }}/ha.cf.j2"
    heartbeat_haressources_file: "{{ config_files_dir }}/haressources.j2"
    heartbeat_authkey_file: "{{ config_files_dir }}/authkey.j2"
  roles:
     - role: nephelaiio.heartbeat
```

## Testing

Please make sure your environment has [docker](https://www.docker.com) installed in order to run role validation tests. Additional python dependencies are listed in the [requirements file](https://github.com/nephelaiio/ansible-role-requirements/blob/master/requirements.txt)

Role is tested against the following distributions (docker images):
  * Ubuntu Focal
  * Ubuntu Bionic
  * Ubuntu Xenial
  * CentOS 7
  * Debian Buster

You can test the role directly from sources using command ` molecule test `

## License

This project is licensed under the terms of the [MIT License](/LICENSE)
