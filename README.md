# nextcloud-remote-client
The (unofficial) Nextcloud Remote Client CLI is a client side CLI to interact with [Nextcloud](https://nextcloud.com) servers via a container or command line.  It uses the [Nextcloud Python API](https://github.com/cloud-py-api/nc_py_api) and does not require enabling anything special on the server side in order to use.

## Example usage

Show help:

`./nrc --help`
```
usage: nrc [-h] {files,file,users,user} ...

Remote CLI for Nextcloud Server

options:
  -h, --help            show this help message and exit

service:
  {files,file,users,user}
                        service --help
    files (file)        Interact with files in Nextcloud
    users (user)        User management in Nextcloud
```

List files:

`./nrc files ls / -r`  
```
'Documents/'
'Documents/Example.md'
'Documents/Nextcloud flyer.pdf'
'Documents/Readme.md'
'Documents/Welcome to Nextcloud Hub.docx'
'Nextcloud Manual.pdf'
'Nextcloud intro.mp4'
'Nextcloud.png'
```

List users:

`./nrc users list`
```
User: admin
Status: None
```

### Run this easily from a container:

You can run this with podman or docker without needing python installed locally:

`podman run -it --rm -e'NEXTCLOUD_SERVER=https://your-nextcloud.com' -e'NEXTCLOUD_USER=admin' -e'NEXTCLOUD_PASS=password' quay.io/vwbusguy/nextcloud-remote-client files ls / -r`

## Setup

In order to use this, you must pass your Nextcloud credentials via environment variables:

```sh
export NEXTCLOUD_SERVER='https://your-nextcloud.com'
export NEXTCLOUD_USER='admin'
export NEXTCLOUD_PASS='password'
```

## Run Locally

To run this locally, you will need python3:

```sh
python -m venv env
source env/bin/activate
./nrc files ls
```

Alternatively, build and run a container locally:
```sh
podman build -t localhost/nrc .
podman run -it --rm -e'NEXTCLOUD_SERVER=https://your-nextcloud.com' -e'NEXTCLOUD_USER=admin' -e'NEXTCLOUD_PASS=password' localhost/nrc files ls / -r
```
