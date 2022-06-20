
If you want to pull things out to avoid defining everything inline, you can do it here
and call them from elsewhere.

example: how to call the definition of a kubernetes ingress.

_Note: the PWD is relative to the `playbook.yml` that we're calling to start ansible._

```yml
- name: Set dir for kubernetes resource definitions
  set_fact: resource_dir='{{ lookup('env', 'PWD') }}/resources'

- name: Ensure a kubernetes resource defining the behaviour of the ingress controller
  k8s:
    state: present
    force: true
    src: '{{ resource_dir }}//ingress.yml'
```