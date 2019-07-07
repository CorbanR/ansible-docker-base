# Packer Example
Example shows creating a test docker container using `corbanr/ansible:2.8-ubuntu` with `ansible` and `packer`.
This particular example removes `python3` and `ansible` from the final image(but that is entirely optional).
as such we set `"commit": false`, `"export_path": "test.tar"` and use the `docker-import` post-processor to tag the image.
Using `export_path` and `docker-import` ensure the final is as small as possible as it essentially gets rid of any layers.

If however you wanted to keep `ansible` and or `python3` set `"commit": true`, remove `"export_path": "test.tar"`
and update the post-processor to `docker-tag`.

it would look something like this
```
    ....
    {
      "type": "docker",
      "image": "corbanr/ansible:2.8-ubuntu",
      "commit": true,
      "changes": [
      "LABEL version=1.0"
      ]
    },
    ....
  "post-processors": [
    {
      "type": "docker-tag",
      "repository": "localpacker/test",
      "tag": "0.1"
    }
  ]
```

## Example commands

`packer build packer.alpine.json`
`packer build packer.debian.json`
`packer build packer.ubuntu.json`

## Troubleshooting
When trying to build with packer you may get an error stating it can't find the docker image.

You can change `"pull": true`, or from the root dir just build the base `ansible` images yourself.

- `make debian`
- `make alpine`
- `make ubuntu`
- or finally `make all`
