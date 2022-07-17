npm install --global @glazed/cli


# Creating a local model can be done using the model:create command:
glaze model:create greg6 --key=0a7cd10cf729c260545d3e81eefbe0c90482d299f6ef9c76dc42e7a337198e81

# Schemas can be added to the model, either by using a stream already present on the given Ceramic node or by creating a new one:
Run ceramic daemon first

# Creating a new schema
glaze model:add greg6 schema greg6 '{
    "$schema": "http://json-schema.org/draft-07/schema#",
    "type": "object",
    "title": "Tind3rUsers",
    "required": [
        "name",
        "info"
    ],
    "additionalProperties": false,
    "properties": {
        "name": {
            "type": "string",
            "description": "User name",
            "default": ""
        },
        "info": {
            "type": "string",
            "description": "Your description",
            "default": ""
        }
    }
}' --key=0a7cd10cf729c260545d3e81eefbe0c90482d299f6ef9c76dc42e7a337198e81

# A local model can also be exported to a JSON file using the model:export command:

# inspect to get versionID
glaze model:inspect greg6


# Optionally, a second argment can be provided to output the ModelAliases to a JSON file:

# add definition so that we can get this schema from DIDstore
# 1. use definition
glaze model:add greg6 definition Greg6 '{
    "name": "Greg",
    "description": "Greg got a big duck",
    "schema": "ceramic://k3y52l7qbv1frxhj4d1ryrt31p3iqgd80ti8g1nccwcdps75pfqu2b5ipyoqe0sn4"
}' --key=0a7cd10cf729c260545d3e81eefbe0c90482d299f6ef9c76dc42e7a337198e81

# 2. or use tile, the difference is we input ceramic://versionID in the command instead of context
glaze model:add tind3r-test5 tile EasySchema '{"text":"A simple text"}' --schema='ceramic://versionID' --key=

glaze model:deploy greg6 testest.json --key=0a7cd10cf729c260545d3e81eefbe0c90482d299f6ef9c76dc42e7a337198e81
