Design
======

This document represents a public draft of the direction of this tool in terms of the workflow, user experiences, features, capabilities, and contribution opportunities.

# UI Behavior

The general workflow should error on the side of [DWIM](https://en.wikipedia.org/wiki/DWIM) wherever possible to the extent that risk of unintended destructive operations (eg, unintended file deletion) is mitigated.  Generally speaking, the less commands necessary to do something, the better.

The general goal should be to have robust and intuitive enough command-line arguments such that interactive inputs are unnecessary and to be avoided.  This should hopefully serve the purposes of making for a more robust CLI and for making this a more useful tool for scripted/automated purposes.

The general syntax of the command is the paradigm of **resource** **action** *options/positional arguments*.

Where possible, when problems or issues are reported that may have a root upstream, contributors to this should report and, where possible, submit patches to fix problems upstream before implenting workaround fixes here.  The immediate upstreams for this project are the [Nextcloud Python API](https://github.com/cloud-py-api/nc_py_api/) and [Nextcloud Server](https://github.com/nextcloud/server).  This way, all users of the Nextcloud community benefit from this project's existence and not just users/contributors of this tool.

# Definitions of Terms

A quick definition of terms used in this document

## Action (aka, Command)

Actions define the user command against a given resource, such as "list" for "files" to list files.  These are built upon [upstream exposed methods](https://github.com/cloud-py-api/nc_py_api/blob/main/nc_py_api/files/files.py#L35) for the resources, but need not necessary be a one-for-one correlation for the sake of DWIM.

## DWIM (Do What I Mean)

DWIM is a principle of software design such that the software will attempt to respond in accordance to what a reasonable user might expect it to do, even if all of the parameters might not be explicitly given.  Bearing in mind avoiding any potentially destructive actions (eg, deleting files) or breaking changes (altering behavior that breaks existing workflows), feedback and PRs that provide another route to accomplish something within the design here that may be more intuitive to users should be considered with gravity.

## Resource (aka, Service)

Resources refer to a specific Nextcloud service or API Resource, such as "files", "users", etc.  These correlate to the [upstream exposed API resources](https://github.com/cloud-py-api/nc_py_api/blob/main/nc_py_api/nextcloud.py#L50).  Outside of `--help`, every valid user command must container one and exactly one supported Resource.  Resources must always be the first positional argument and immediately precede an Action, unless there is an obvious, inherently harmless, and intuitive default action for the Resource (eg, return forecast for weather).

## Server

This tool is an (unofficial) client for a [Nextcloud](https://nextcloud.com/) server.  References to a "server" refer to a remote [Nextcloud Server](https://github.com/nextcloud/server).
