npm install --global @glazed/cli


# Creating a local model can be done using the model:create command:
glaze model:create greg6 --key=0a7cd10cf729c260545d3e81eefbe0c90482d299f6ef9c76dc42e7a337198e81

# Schemas can be added to the model, either by using a stream already present on the given Ceramic node or by creating a new one:
Run ceramic daemon first

# Creating a new schema
glaze model:create profile3 --key=0a7cd10cf729c260545d3e81eefbe0c90482d299f6ef9c76dc42e7a337198e81

glaze model:add profile3 schema Dick '{
    "$schema": "http://json-schema.org/draft-07/schema#",
    "type": "object",
    "title": "Tind3rUsers",
    "required": [
        "counts",
        "name",
        "description"
    ],
    "additionalProperties": false,
    "properties": {
        "counts": {
            "type": "integer",
            "description": "The total appliers of Tind3r",
            "default": 0
        },
        "name": {
            "type": "string",
            "description": "User name",
            "default": ""
        },
        "description": {
            "type": "string",
            "description": "Bio",
            "default": ""
        },
        "wallets": {
            "type": "array",
            "description": "Collection of the contacts wallet addresses and respective networks",
            "default": [],
            "items": {
                "type": "object",
                "default": {},
                "required": [
                    "walletAddress",
                    "network"
                ],
                "additionalProperties": false,
                "properties": {
                    "walletAddress": {
                        "type": "string",
                        "default": ""
                    },
                    "network": {
                        "type": "string",
                        "default": ""
                    }
                }
            }
        },
        "avatar": {
            "type": "string",
            "description": "URI of user avatar",
            "default": ""
        },
        "birthday": {
            "type": "string",
            "description": "birthday",
            "default": ""
        },
        "gender": {
            "type": "string",
            "description": "gender",
            "default": ""
        },
        "sexOrientation": {
            "type": "string",
            "description": "sex orientation",
            "default": ""
        },
        "tags": {
            "type": "array",
            "description": "Optional tags for the user",
            "items": {
                "type": "string"
            },
            "minItems": 1,
            "uniqueItems": true
        },
        "data": {
            "type": "object",
            "description": "Fields to include optional arbitrary data",
            "properties": {}
        }
    }
}' --key=0a7cd10cf729c260545d3e81eefbe0c90482d299f6ef9c76dc42e7a337198e81

# A local model can also be exported to a JSON file using the model:export command:

# inspect to get versionID
glaze model:inspect profile3


# Optionally, a second argment can be provided to output the ModelAliases to a JSON file:

# add definition so that we can get this schema from DIDstore
# 1. use definition
glaze model:add profile3 definition Profile3 '{
    "name": "Greg",
    "description": "Greg got a big duck",
    "schema": "ceramic://k3y52l7qbv1fryozq1wi9xvepyhcqilrj5wr1a1e0jb30v9l91xldphbbna212kg0"
}' --key=0a7cd10cf729c260545d3e81eefbe0c90482d299f6ef9c76dc42e7a337198e81

# 2. or use tile, the difference is we input ceramic://versionID in the command instead of context
glaze model:add tind3r-test5 tile EasySchema '{"text":"A simple text"}' --schema='ceramic://versionID' --key=

glaze model:deploy profile3 profile3.json --key=0a7cd10cf729c260545d3e81eefbe0c90482d299f6ef9c76dc42e7a337198e81
