#!/usr/bin/env bash

__PY3=$(command -v python3 || true)
__PIP3=$(command -v pip3 || true)
__ANSIBLE=$(command -v ansible || true)

if [ "${__ANSIBLE}" != "" ] ; then echo "Ansible already installed, exiting." ; exit ; fi
if [ "${__PY3}" == "" ] ; then echo "Python 3 not found, please install." ; exit ; fi
if [ "${__PIP3}" == "" ] ; then echo "pip3 not found, please install." ; exit ; fi

test -d /tmp/ve-ansible || python3 -m venv /tmp/ve-ansible

source /tmp/ve-ansible/bin/activate

pip3 install ansible

deactivate

echo ""
echo ""
echo "Ansible has been temporarily installed to /tmp/ve-ansible."
echo "To activate virtual environment, run:"
echo ""
echo "  source /tmp/ve-ansible/bin/activate"
echo ""
echo "To verify Ansible is present, run:"
echo ""
echo "  ansible --version"
echo ""
echo "To exit the virtual environment, run:"
echo ""
echo "  deactivate"
