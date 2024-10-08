Design
======

This document represents a public draft of the direction of this tool in terms of the workflow, user experiences, features, capabilities, and contribution opportunities.

# UI Behavior

The general workflow should error on the side of [DWIM](https://en.wikipedia.org/wiki/DWIM) wherever possible to the extent that risk of unintended destructive operations (eg, unintended file deletion) is mitigated.  Generally speaking, the less commands necessary to do something, the better.

The general goal should be to have robust and intuitive enough command-line arguments such that interactive inputs are unnecessary and to be avoided.  This should hopefully serve the purposes of making for a more robust CLI and for making this a more useful tool for scripted/automated purposes.

The general syntax of the command is the paradigm of **resource** **action** *options/positional arguments*.

Where possible, when problems or issues are reported that may have a root upstream, contributors to this should report and, where possible, submit patches to fix problems upstream before implenting workaround fixes here.  The immediate upstreams for this project are the [Nextcloud Python API](https://github.com/cloud-py-api/nc_py_api/) and [Nextcloud Server](https://github.com/nextcloud/server).  This way, all users of the Nextcloud community benefit from this project's existence and not just users/contributors of this tool.

# Definitions of Terms

A definition of common terms used in this document/project.

## Action (aka, Command)

Actions define the user command against a given resource, such as "list" for "files" to list files.  These are built upon [upstream exposed methods](https://github.com/cloud-py-api/nc_py_api/blob/main/nc_py_api/files/files.py#L35) for the resources, but need not necessary be a one-for-one correlation for the sake of DWIM.

## DWIM (Do What I Mean)

DWIM is a principle of software design such that the software will attempt to respond in accordance to what a reasonable user might expect it to do, even if all of the parameters might not be explicitly given.  Bearing in mind avoiding any potentially destructive actions (eg, deleting files) or breaking changes (altering behavior that breaks existing workflows), feedback and PRs that provide another route to accomplish something within the design here that may be more intuitive to users should be considered with gravity.

## Resource (aka, Service)

Resources refer to a specific Nextcloud service or API Resource, such as "files", "users", etc.  These correlate to the [upstream exposed API resources](https://github.com/cloud-py-api/nc_py_api/blob/main/nc_py_api/nextcloud.py#L50).  Outside of `--help`, every valid user command must container one and exactly one supported Resource.  Resources must always be the first positional argument and immediately precede an Action, unless there is an obvious, inherently harmless, and intuitive default action for the Resource (eg, return forecast for weather).

## Server

This tool is an (unofficial) client for a [Nextcloud](https://nextcloud.com/) server.  References to a "server" refer to a remote [Nextcloud Server](https://github.com/nextcloud/server).

# Future Plans

This section captures brainstorming and contribution opportnities for expanding the feature set of this client.  This section is organized by Resource.

## Calendar

The current upstream [calendar](https://github.com/cloud-py-api/nc_py_api/blob/main/nc_py_api/calendar.py#L8) API is just a stub, but pending that functionality, the ability to see upcoming events, create events, update invitees, and cancel/modify events.  This could be especially useful for leveraging Nextcloud for appointment/meeting scheduling automations.

## Files

Future plans for the Files resource.

### download

Download files individually or in bulk, defaulting to the current directory and source remote file/directory name for the destination path. 

### ls (list)

Expand this to include extended information, list by user (assuming credential capability), list by file size, list by created/modified.

### sharing (share)

Manage sharing of files including querying, creating, updating, and removing share options to other users as well as by link.  Users should specifically be able to upload and share an arbitrary file as easily as possible.

### upload (put)

Expand this to include bulk operations, such as uploading a whole directory, passing multiple files at once to the same directory, or extracting the contents of a zip/tarball archive to a directory on the server.

Option to [create files based on IO input](https://github.com/cloud-py-api/nc_py_api/blob/main/nc_py_api/files/files.py#L123), such as streaming the output from another command passed as a pipe and read via stdin.

## Notes

Future plans to support the [Notes](https://github.com/cloud-py-api/nc_py_api/blob/main/nc_py_api/notes.py#L94) resource.

* List existing notes
* Display a note or save to a file
* Create a note with string contents from stdin, argument, or possible EDITOR integration (vim, nano, emacs)
* Ability to update an existing note by appending, overwriting, or possible EDITOR integration (vim, nano, emacs, etc.)
* Share a note (might require the Files API under the hood)
* Delete notes

## Talk

Future plans to support the [Talk](https://github.com/cloud-py-api/nc_py_api/blob/main/nc_py_api/_talk_api.py#L28) resource.

* See existing conversations
* Create a conversation (public or otherwise), immediately generating a link
* Send/Download a file to/from a conversation
* Send a message to a conversation (example use case: Forward some log output to a conversation from a VNC connection where copy/paste might not work.)
* Leave Conversation
* Delete Conversation
* Retrieve conversation logs (possibly incorporating some kind of pagination)

## Users

Future plans for the [Users resource](https://github.com/cloud-py-api/nc_py_api/blob/main/nc_py_api/users.py#L159).

Persuant to their server capabilities, regular users should be able to search for other users, display and set their personal attributes, and see their quotas. 

Nextcloud Admins should be able to manage users, such as creation/deleation, activating/deactivating, setting quoatas, and viewing/curating group membership.

## Weather

Future plans to support the [Weather](https://github.com/cloud-py-api/nc_py_api/blob/main/nc_py_api/weather_status.py#L43) resource.

Extend existing functionality to get/set current weather location(s) for the user as well as set how many forecast data points to return and display it in a more friendly way.
