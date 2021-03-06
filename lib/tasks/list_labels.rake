require 'pp'

task :list_labels => :environment do

	client = Google::APIClient.new

	# key = Google::APIClient::KeyUtils.load_from_pkcs12(Rails.application.secrets.client_id, Rails.application.secrets.client_secret)

	# client.authorization.access_token = Token.last.fresh_token
	client.authorization.access_token = Token.first.refresh_token
	service = client.discovered_api('gmail')

	# result = client.execute(
	# 	api_method: service.users.labels.list,
	# 	parameters: {'userId' => 'me'},
	# 	headers: {'Content-Type' => 'application/json'})

	result = client.execute(
                :api_method => service.users.messages.list,
                :parameters => {'userId' => 'me'}, #'labelIds' => 'SENT',
                :headers => {'Content-Type' => 'application/json'})

	pp.JSON.parse(result.body)

end