# jq

See the [official manual](https://stedolan.github.io/jq/manual/) for more details.

Make sure you quote your path to jq if it has spaces.

## Check

```sh
if $(./jq 'has("foo")' /path/to/file.json) ; then
    # top level node "foo" exists, do something
fi

if ! $(./jq 'has("foo")' /path/to/file.json) ; then
    # top level node "foo" does not exist, do something
fi
```

## Add / Update

```sh
# update the existing file
./jq '.foo = "bar"' /path/to/file.json > /path/to/temp-file.json && mv /path/to/temp-file.json /path/to/file.json

# don't alter the original file
./jq '.foo = "bar"' /path/to/file.json > /path/to/new-file.json
```

## Remove

```sh
# update the existing file
./jq 'del(foo)' /path/to/file.json > /path/to/temp-file.json && mv /path/to/temp-file.json /path/to/file.json

# don't alter the original file
./jq 'del(foo)' /path/to/file.json > /path/to/new-file.json
```
