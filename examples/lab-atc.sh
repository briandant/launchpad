CONFIG=$HOME/wt-setup.txt
if [ ! -f $CONFIG ] ; then 
	~/examples/wt-setup.sh
else
	source $CONFIG
fi
echo -e "\nGenerating the list of commands... (please ensure you edit the .json files before submitting the call, and replace <test_definition_id> and <test_definition_execution_id> with the values returned but the API calls)"
echo -e "\nhttp --session world-tour --auth-type=edgegrid -a atc: POST :/test-management/v1/test-definitions < ~/examples/create-test-definition.json"
echo -e "\nhttp --session world-tour --auth-type=edgegrid -a atc: POST :/test-management/v1/test-definitions/<test_definition_id>/test-cases < ~/examples/create-test-case.json"
echo -e "\nhttp --session world-tour --auth-type=edgegrid -a atc: POST :/test-management/v1/test-runs < ~/examples/test-run-obj.json"
echo -e "\nhttp --session world-tour --auth-type=edgegrid -a atc: GET :/test-management/v1/test-definition-executions/<test_definition_execution_id>"
echo -e "\nhttp --session world-tour --auth-type=edgegrid -a atc: GET :/test-management/v1/test-definition-executions/<test_definition_execution_id>/differences"
echo -e "\nhttp --session world-tour --auth-type=edgegrid -a atc: PUT :/test-management/v1/test-definition-executions/<test_definition_execution_id>/differences < ~/examples/differences.json"