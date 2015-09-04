
discover:
  cmd.run:
    - name: "iscsiadm -m discovery -t st -p igw1"
    - shell: /bin/bash
    - unless: "iscsiadm -m node | grep -q 'iqn'"

login:
  cmd.run:
    - name: "iscsiadm -m node -L all"
    - shell: /bin/bash
    - unless: "multipath -ll | grep -q '\n'"
    - require:
      - cmd: discover


