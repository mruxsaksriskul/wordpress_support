data-bag-faker
==============

This cookbook will only be used for serverspec tests. 

The git-credentials recipe requires an SSH key to clone private Github repositories. 
So this recipe will build a fake databag containing a real SSH key for a github account, by reading an
ENV variable with a valid key, then editing it into an existing databag in the test directory.

To use this recipe, include it in your Kitchen yml runlist, before any other recipes:

    run_list:
      - recipe[data-bag-faker]

Then set an ENV variable, exactly as it is in the databag:

    export GIT_SSH_KEY="-----BEGIN RSA PRIVATE KEY-----\nMIIEpQIBAAKC ... XzGd6GuiCcCGHoGxbIEnf+OV+hIzh3qFqvSOXSBUVj9ZD3t3UgIG5ds32I9o\neQY02NreACnTdqUsYgLrMcipAoGBANQB9Rhc/XUxnSOMS6ZDCmKLQD2ScMYGxOfC\nw4dR32ukP+MpaPuVcEPnG8CVNoHEMJ8Hak1QfBEx8a22fPpEmhhdLYbdQVENK3mo\nwDC7SqjI6vzMHz4LpeiyiYBlL8DNC0x6cT30tuV+dC4/OVS6Pe/x100IXSag1FAN\nxr0xGzypAoGABPMJbRGrMD+AHFxGp8uZqDbG1M2ZaFaz2RQw5xIvnqp/CCLFBoNS\nqdjhsPGqFOBhMopi29rxZx44hGA4uJXQcF2Buoyv/WB2g6sXV2E/+A9C+/hQs7V0\nNj0H1Ibq3D2LRklS3cBo0vyTkVncquZGPEsyyrtfHF8H52In96oI8cw=\n-----END RSA PRIVATE KEY-----"


