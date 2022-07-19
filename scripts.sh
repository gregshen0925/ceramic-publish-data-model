npm install --global @glazed/cli

# 1. You need key before doing anything
glaze did:create

# 2. Creating a new local model
# glaze model:create model1 --key=<your-seed>
glaze model:create <your-new-model-name> --key=<your-seed>

# 3. Run node
ceramic daemon --network testnet-clay

# Schemas can be added to the model, either by using a stream already
# present on the given Ceramic node or by creating a new one:

# 4. Creating a new schema
glaze model:add <your-new-model-name> schema <your-schema-name> 'json-form-schema' --key=<your-seed>

# A local model can also be exported to a JSON file using the model:export command:

# 5. inspect to get versionID
glaze model:inspect <your-new-model-name>

# 6. add definition so that we can get this schema from DIDstore
# 6.1 add definition by using definition
glaze model:add abc definition <your-definition-name> '{
    "name": "Greg",
    "description": "Gregreg",
    "schema": "ceramic://<versionID-you-got-from-inspect-command>"
}' --key=<your-seed>

# 6.2. (optional)or use tile, the difference is we input ceramic://versionID in the command instead of context
glaze model:add tind3r-test5 tile EasySchema '{"text":"A simple text"}' --schema='ceramic://versionID' --key=<your-seed>


# 7. Final step, deploy your schema to use in app 
#    NewName.json will generate a json file for you to use in app
#    NewName.json includes definition hash and schema hash
glaze model:deploy <your-new-model-name> NewName.json --key=<your-seed>
